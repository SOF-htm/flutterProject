import 'package:flutter/material.dart';
import 'package:flutter_exo1/models/fav.dart';
import 'package:flutter_exo1/pages/intro_page.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      builder: (context, child) => const MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ), 
      providers: [
        ChangeNotifierProvider(create: (context)=> Cart()),
        ChangeNotifierProvider(create: (context)=> Fav()),
      ],
    );
  }
}
