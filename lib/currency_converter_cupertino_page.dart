import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    final input = textEditingController.text;
    if (input.isNotEmpty) {
      final amount = double.tryParse(input.replaceAll(',', '')) ?? 0.0;
      if (amount > 0) {
        setState(() {
          result = amount * 81;
          errorMessage = '';
        });
      } else {
        setState(() {
          result = 0;
          errorMessage = "Please enter a valid amount greater than 0";
        });
        if (kDebugMode) {
          print("Invalid amount entered");
        }
      }
    } else {
      setState(() {
        result = 0;
        errorMessage = "Please enter an amount to convert";
      });
      if (kDebugMode) {
        print("Please enter an amount");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 47, 89, 84),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 47, 89, 84),
        middle: Text(
          "Currency Converter",
          style: TextStyle(fontSize: 25, color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Result display
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 56, 99, 108),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Converted Amount",
                        style: TextStyle(
                          fontSize: 18,
                          color: CupertinoColors.extraLightBackgroundGray,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "₹ ${result.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 42,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Indian Rupees",
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.extraLightBackgroundGray,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Input field
                CupertinoTextField(
                  controller: textEditingController,
                  placeholder: "Enter amount in USD",
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.tertiaryLabel,
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      CupertinoIcons.money_dollar,
                      color: Color.fromARGB(255, 161, 207, 148),
                    ),
                  ),
                  style: const TextStyle(
                    color: CupertinoColors.white,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 56, 99, 108),
                    borderRadius: BorderRadius.circular(40),
                    // REMOVED: OutlineInputBorder - CupertinoTextField uses BoxDecoration
                    // Added border using BoxDecoration's border property instead
                    border: Border.all(
                      color: const Color.fromARGB(118, 29, 152, 168),
                      width: 2,
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                // Error message
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: CupertinoColors.systemRed,
                        fontSize: 14,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                // Convert button
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: _convertCurrency,
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(40),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Text(
                      "Convert to INR",
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.label,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Conversion rate info
                const Text(
                  "Conversion rate: 1 USD = 81 INR",
                  style: TextStyle(
                    color: CupertinoColors.extraLightBackgroundGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}