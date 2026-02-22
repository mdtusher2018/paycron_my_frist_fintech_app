// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> startCardPayment({required String clientSecret}) async {
  try {
    // 2. Initialize Payment Sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        style: ThemeMode.light,
        merchantDisplayName: "Terru",
      ),
    );

    // 3. Present Payment Sheet
    await Stripe.instance.presentPaymentSheet();
  } on StripeException catch (e) {
    log(e.toString());
  } catch (e) {
    log("Error in makePayment: $e");
  }
}
