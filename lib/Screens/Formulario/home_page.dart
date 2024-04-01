import 'package:flutter/material.dart';
import 'package:form_tesis/Screens/Formulario/formprincipal.dart';

class miproyecto extends StatelessWidget {
  const miproyecto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const formPrincipal(),
    );
  }
}