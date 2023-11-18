import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'models/coffee_shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: Builder(
        builder: (context) => FutureBuilder(
          future: Provider.of<CoffeeShop>(context, listen: false).loadCoffeeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const MyApp();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
