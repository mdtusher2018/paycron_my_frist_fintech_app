import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/data/models/card/card_model.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';

class CardsManagementPage extends ConsumerStatefulWidget {
  const CardsManagementPage({super.key});

  @override
  ConsumerState<CardsManagementPage> createState() =>
      _CardsManagementPageState();
}

class _CardsManagementPageState extends ConsumerState<CardsManagementPage> {
  List<CardModel> _cards = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await ref.read(cardUsecaseProvider).getSavedCards();

    if (result is Failure) {
      setState(() {
        _error = (result as Failure).message;
        _loading = false;
      });
      return;
    }

    final data = (result as Success<CardListResponse, Failure>).data;

    setState(() {
      _cards = data.cards;
      _loading = false;
    });
  }

  Future<void> _setDefault(CardModel card) async {
    final result = await ref.read(cardUsecaseProvider).setDefaultCard(card.id);

    if (result is Failure) {
      ref
          .read(snackBarServiceProvider)
          .showError((result as Failure).message, context: context);

      return;
    }

    _fetchCards();
  }

  Future<void> _confirmDelete(CardModel card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Card'),
        content: Text('Remove card ending in ${card.last4}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final result = await ref.read(cardUsecaseProvider).deleteCard(card.id);

    if (result is Failure) {
      ref
          .read(snackBarServiceProvider)
          .showError((result as Failure).message, context: context);

      return;
    }

    _fetchCards();
  }

  Future<void> addCardWithStripe() async {
    try {
      setState(() => _loading = true);

      /// 1. Get SetupIntent from backend
      final result = await ref.read(cardUsecaseProvider).createSetupIntent();

      if (result is Failure) {
        throw Exception((result as Failure).message);
      }

      final success = result as Success<String, Failure>;
      final clientSecret = success.data;

      /// 2. Init PaymentSheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          merchantDisplayName: 'Paycron',
          style: ThemeMode.light,
        ),
      );

      /// 3. Open Stripe UI
      await Stripe.instance.presentPaymentSheet();

      /// 4. IMPORTANT: Sync with backend (refresh cards)
      await ref.read(cardUsecaseProvider).getSavedCards();

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ref
          .read(snackBarServiceProvider)
          .showError(e.toString(), context: context);
    } finally {
      setState(() => _loading = false);
    }
  }

  Widget _buildAddCardButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ), // optional spacing from edges
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4), // subtle shadow below
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decorative icon
            Icon(
              Icons.credit_card_outlined,
              size: 64,
              color: AppColors.primary,
            ),
            SizedBox(height: 16),

            // Title text
            CommonText(
              'No cards added yet',
              textAlign: TextAlign.center,

              size: 18,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),

            // Subtext description
            CommonText(
              'Add a credit or debit card to start making payments.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // CommonButton
            CommonButton('Add Card', onTap: addCardWithStripe),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(
        title: CommonText(
          'Payment Methods',
          size: 20,
          isBold: true,
          color: AppColors.white,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back, color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : _cards.isEmpty
          ? _buildAddCardButton()
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _cards.length + 1,
              itemBuilder: (context, index) {
                if (index == _cards.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CommonButton('Add New', onTap: addCardWithStripe),
                  );
                }

                final card = _cards[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// BRAND ICON
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: _buildBrandIcon(card.brand),
                      ),

                      const SizedBox(width: 12),

                      /// CARD INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              card.brand.toUpperCase(),
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 4),
                            CommonText(
                              "**** **** **** ${card.last4}",
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),

                      /// DEFAULT BADGE
                      if (card.isDefault)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const CommonText(
                            "Default",
                            color: Colors.green,
                            size: 12,
                          ),
                        ),

                      /// MENU
                      PopupMenuButton(
                        itemBuilder: (_) => [
                          if (!card.isDefault)
                            PopupMenuItem(
                              child: const Text("Make Default"),
                              onTap: () => _setDefault(card),
                            ),
                          PopupMenuItem(
                            child: const Text("Delete"),
                            onTap: () => _confirmDelete(card),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildBrandIcon(String brand) {
    switch (brand.toLowerCase()) {
      case 'visa':
        return Image.asset('assets/images/visa.png', height: 32);
      case 'mastercard':
        return Image.asset('assets/images/master_card.png', height: 32);
      case 'paypal':
        return Image.asset(
          'assets/paypal.pnassets/images/paypal.pngg',
          height: 32,
        );
      default:
        return const Icon(Icons.credit_card, size: 32);
    }
  }
}
