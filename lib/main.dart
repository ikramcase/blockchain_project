import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woo_storestackflutter/pages/DiscoveryPage.dart';
import 'package:woo_storestackflutter/pages/ProductDetailsPage.dart';
import 'package:woo_storestackflutter/pages/SplashPage.dart';
import 'package:woo_storestackflutter/services/ContractFactoryService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Contractfactoryservice>(
      create: (context) => Contractfactoryservice(),
      child: MaterialApp(
        title: 'Woo Store Dapp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DiscoveryPage(),
      ),
    );
  }
}
