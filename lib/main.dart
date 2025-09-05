import 'package:curency_converter/currecncy_converter_Material_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return(const MaterialApp(
    home: CurrencyConverterMaterialPageState(),
  ));
  }
}

//Cupertino 

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterMaterialPageState(),
    );
  }
}

