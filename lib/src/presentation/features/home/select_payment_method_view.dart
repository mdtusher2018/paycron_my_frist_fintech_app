import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/data/models/card/card_model.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'payment_notifier.dart';

class SelectPaymentMethodPage extends ConsumerStatefulWidget {
  final double amount;

  const SelectPaymentMethodPage({super.key, required this.amount});

  @override
  ConsumerState<SelectPaymentMethodPage> createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState
    extends ConsumerState<SelectPaymentMethodPage> {
  List<CardModel> _cards = [];
  CardModel? _selectedCard;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final result = await ref.read(cardUsecaseProvider).getSavedCards();

    if (result is Success) {
      final data = (result as Success).data;

      setState(() {
        _cards = data.cards;
        if (_cards.isNotEmpty) {
          _selectedCard = _cards.firstWhere(
            (c) => c.isDefault,
            orElse: () => _cards.first,
          );
        }
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
    }
  }

  /// 💳 PAY WITH NEW CARD (Stripe PaymentSheet)
  Future<void> _payWithNewCard() async {
    final homeUsecase = ref.read(homeUsecaseProvider);

    final result = await homeUsecase.deposite(amount: widget.amount);

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message), backgroundColor: Colors.red),
      );
      return;
    }

    final (clientSecret, paymentIntentId) = (result as Success).data;

    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Paycron',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      await homeUsecase.handlePaymentSuccess(paymentIntentId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Payment successful"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  Widget _cardTile(CardModel card) {
    final isSelected = _selectedCard?.id == card.id;

    return GestureDetector(
      onTap: () => setState(() => _selectedCard = card),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.credit_card),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(card.brand.toUpperCase(), isBold: true),
                  CommonText("**** ${card.last4}"),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentNotifierProvider);
    final isLoading = paymentState.isLoading;

    /// 🔥 LISTENER (SUCCESS / ERROR)
    ref.listen(paymentNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Payment successful"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(err.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Select Payment Method")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// 💳 SAVED CARDS
                  if (_cards.isNotEmpty) ...[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText("Saved Cards", isBold: true),
                    ),
                    const SizedBox(height: 10),
                    ..._cards.map(_cardTile),
                  ],

                  const SizedBox(height: 10),

                  /// ➕ NEW CARD
                  GestureDetector(
                    onTap: _payWithNewCard,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          SizedBox(width: 10),
                          CommonText("Use New Card"),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// 🚀 PAY BUTTON
                  CommonButton(
                    isLoading ? "Processing..." : "Pay \$${widget.amount}",
                    onTap: isLoading
                        ? null
                        : () {
                            if (_selectedCard != null) {
                              ref
                                  .read(paymentNotifierProvider.notifier)
                                  .payWithSavedCard(
                                    amount: widget.amount,
                                    paymentMethodId: _selectedCard!.id,
                                  );
                            } else {
                              _payWithNewCard();
                            }
                          },
                  ),
                ],
              ),
            ),
    );
  }
}
