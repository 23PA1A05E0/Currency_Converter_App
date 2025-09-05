import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 1. Create a variable that stores the converted currency value
class CurrencyConverterMaterialPageState extends StatefulWidget {
  const CurrencyConverterMaterialPageState({super.key});

  @override
  State<CurrencyConverterMaterialPageState> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPageState> {
  double result = 0; // Variable to store converted value
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 2. Create a function that multiplies the value taken from TextField
  void _convertCurrency() {
    final input = textEditingController.text;
    if (input.isNotEmpty) {
      final amount = double.tryParse(input.replaceAll(',', '')) ?? 0.0;
      if (amount > 0) {
        setState(() {
          // 3. Store the value in the variable
          result =
              amount * 81; // Multiplication by 81 (assumed conversion rate)
        });
      } else {
        setState(() {
          result = 0;
        });
        if (kDebugMode) {
          print("Invalid amount entered");
        }
      }
    } else {
      setState(() {
        result = 0;
      });
      if (kDebugMode) {
        print("Please enter an amount");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(118, 29, 152, 168),
        style: BorderStyle.solid,
        width: 3,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 89, 84),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 89, 84),
        elevation: 0,
        title: Center(
          child: const Text(
            "Currency Converter",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        leading: Icon(
          Icons.currency_exchange_outlined,
          color: Colors.white,
          size: 25,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 4. Display the variable
            Text(
              "Rupess:${result.toString()}",
              maxLines: 1,
              style: TextStyle(
                fontSize: 60,
                color: Color.fromRGBO(28, 159, 156, 0.384),
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Color.fromARGB(255, 227, 227, 231),
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Please Enter the amount in USD",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 248, 249, 249),
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                    color: Color.fromARGB(255, 161, 207, 148),
                  ),
                  prefixIconColor: Color.fromARGB(255, 59, 159, 97),
                  filled: true,
                  fillColor: Color.fromARGB(255, 56, 99, 108),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _convertCurrency, // Call the conversion function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 18, 19, 19),
                    foregroundColor: const Color.fromARGB(255, 199, 202, 207),
                    shadowColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text("Convert!", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
