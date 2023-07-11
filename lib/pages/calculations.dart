import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/commons.dart';
import 'package:pizza_flutter/model.dart';
import 'package:pizza_flutter/pages/calculation.dart';
import 'package:pizza_flutter/store.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../main.dart';

class PizzaValueHome extends StatelessWidget {
  const PizzaValueHome({
    super.key,
    required this.store,
  });

  final PizzaValueStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: RxBuilder(
        rxVal: store.map(
          (s) => s.calculations.entries
              .sortedBy((c) => c.value.lastModified)
              .reversed,
        ),
        builder: (context, value) {
          return ListView(
            children: value.map((calculation) {
              return ListTile(
                title: Text(calculation.value.title),
                subtitle: Timeago(
                  date: calculation.value.lastModified,
                  builder: (context, value) {
                    return Text(value);
                  },
                ),
                trailing: IconTheme(
                  data: IconTheme.of(context),
                  child: const Icon(Icons.chevron_right),
                ),
                onTap: () {
                  showCalculation(context, calculation.key);
                },
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                addCalculation(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  void addCalculation(BuildContext context) {
    final id = store
        .update(
          (m) => m.copyWith(
            calculationSeq: m.calculationSeq + 1,
          ),
        )
        .calculationSeq;

    final defaultTitle = 'Calculation $id';
    final controller = TextEditingController(
      text: defaultTitle,
    )..selectAll();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Calculation'),
        content: TextField(
          controller: controller,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              var title = controller.text;
              if (title.trim().isEmpty) {
                title = defaultTitle;
              }

              final calc = PizzaCalculation(
                title: title,
                lastModified: DateTime.now(),
              );

              store.update(
                (value) => value.copyWith(
                  calculations: Map.of(value.calculations)..[id] = calc,
                ),
              );

              showCalculation(context, id);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void showCalculation(BuildContext context, int id) {
    final calcVar = store.mapVar(
      mapper: (value) => value.calculations[id],
      setter: (t, v) => t.copyWith(
        calculations: Map.of(t.calculations)..putOrRemove(id, v),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalculationPage(rxVar: calcVar),
      ),
    );
  }
}
