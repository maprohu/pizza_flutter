import 'package:flutter/material.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_dart_commons/screenshots.dart';
import 'package:mhu_flutter_commons/screenshots.dart';
import 'package:pizza_flutter/model.dart';
import 'package:pizza_flutter/pages/calculation.dart';
import 'package:pizza_flutter/pages/calculations.dart';
import 'package:pizza_flutter/pages/help.dart';

/*
run with:

> mhu shots

'mhu' tool is available here:
https://github.com/maprohu/mhu_tool_flutter
 */

void main() {
  runApp(
    const ScreenshotsApp(
      screenshots: takeScreenshots,
    ),
  );
}

void takeScreenshots(BuildContext context) async {
  void push(Route route) {
    Navigator.push(context, route);
  }

  void pop() {
    Navigator.pop(context);
  }

  final screenshots = await ScreenshotsFlutter.create();

  final store = rxw(const PizzaValueModel());

  push(
    MaterialPageRoute(
      builder: (context) {
        final calc = rxw(
          PizzaCalculation(
            title: 'Bella Italia Pizzeria',
            lastModified: DateTime.now(),
            items: {
              0: const PizzaCalculationItem(
                label: 'Normal',
                size: 33,
                price: 10.50,
              ),
              1: const PizzaCalculationItem(
                label: 'Large',
                size: 40,
                price: 15,
              ),
              2: const PizzaCalculationItem(
                label: 'Family',
                size: 50,
                price: 20,
              ),
            },
          ),
        );
        return CalculationPage(
          rxVar: calc,
          store: store,
        );
      },
    ),
  );
  await screenshots.take("calc");
  pop();

  if (context.mounted) {
    showHelp(context);
  }
  await screenshots.take("help");
  pop();

  push(
    MaterialPageRoute(
      builder: (context) {
        return PizzaValueHome(store: store);
      },
    ),
  );
  await screenshots.take("main");
  pop();

  screenshots.shutdown();
}
