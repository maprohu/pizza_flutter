import 'package:flutter/material.dart';
import 'package:pizza_flutter/pages/calculations.dart';
import 'package:pizza_flutter/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await pizzaValueStore();
  runApp(
    PizzaValueApp(
      store: store,
    ),
  );
}

const appTitle = 'Appy Pizza';

class PizzaValueApp extends StatelessWidget {
  final PizzaValueStore store;

  const PizzaValueApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: PizzaValueHome(store: store),
    );
  }
}

