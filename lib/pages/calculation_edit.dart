import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/mhu_flutter_commons.dart';
import 'package:pizza_flutter/pages/calculation.dart';
import 'package:pizza_flutter/pages/settings.dart';
import 'package:pizza_flutter/store.dart';

import '../model.dart';
import 'help.dart';

class PizzaCalculationItemEditor extends StatelessWidget {
  final PizzaValueStore store;
  final PizzaCalculationItem? item;
  final void Function(PizzaCalculationItem? item) callback;
  final int id;

  PizzaCalculationItemEditor({
    super.key,
    required this.item,
    required this.callback,
    required this.id,
    required this.store,
  });

  late final isNew = item == null;

  ({
    Widget widget,
    ValueListenable<
        PizzaCalculationItem Function(PizzaCalculationItem item)?> update,
  }) editor<T>({
    required String label,
    required T? initial,
    required String Function(T value) subtitle,
    required EditCallback<T> edit,
    required PizzaCalculationItem Function(PizzaCalculationItem item, T value)
        update,
  }) {
    final notifier = ValueNotifier(initial);

    final updater = ValueNotifier<
        PizzaCalculationItem Function(PizzaCalculationItem item)?>(null);

    void listener() {
      final value = notifier.value;
      updater.value = value?.let((value) => (item) => update(item, value));
    }

    listener();

    notifier.addListener(listener);

    return (
      widget: Builder(builder: (context) {
        return ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, child) {
            return ListTile(
              title: Text(label),
              subtitle: Text(
                value?.let(subtitle) ?? '<click to edit>',
              ),
              trailing: IconTheme(
                data: IconTheme.of(context),
                child: const Icon(Icons.edit),
              ),
              onTap: () {
                edit(
                  context,
                  value,
                  (value) {
                    notifier.value = value;
                  },
                );
              },
            );
          },
        );
      }),
      update: updater,
    );
  }

  late final editors = [
    editor(
      label: 'Name',
      initial: item?.label ?? 'Option $id',
      subtitle: identity,
      edit: editOptionsCallback(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Name'),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  SizesPage.show(
                    context: context,
                    store: store,
                  );
                },
                icon: const Icon(Icons.settings),
              );
            })
          ],
        ),
        options: store.map((value) => value.sizes.values.sortedBy(identity)),
        labelBuilder: (item) => Text(item),
      ),
      update: (item, value) => item.copyWith(label: value),
    ),
    editor(
      label: 'Diameter',
      initial: item?.size,
      subtitle: numberFormat.format,
      edit: editDoubleCallback(
        title: const Text('Diameter'),
        validator: (value) => [
          if (value <= 0) 'Diameter must be greater than zero.',
        ],
      ),
      update: (item, value) => item.copyWith(size: value),
    ),
    editor(
      label: 'Price',
      initial: item?.price,
      subtitle: numberFormat.format,
      edit: editDoubleCallback(
        title: const Text('Price'),
        validator: (value) => [
          if (value <= 0) 'Price must be greater than zero.',
        ],
      ),
      update: (item, value) => item.copyWith(price: value),
    ),
  ];

  late final updaters = listOfValueListenables(
    editors.map((e) => e.update).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Size Option'),
        actions: const [
          HelpButton(),
        ],
      ),
      body: ListView(
        children: [
          ...editors.map((e) => e.widget),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ValueListenableBuilder(
              valueListenable: updaters,
              builder: (context, updates, child) {
                final nonNulls = updates.whereNotNull().toList();

                final savable = updates.length == nonNulls.length;

                return IconButton(
                  onPressed: savable
                      ? () {
                          Navigator.pop(context);
                          final item = nonNulls.fold(
                            PizzaCalculationItem.defaultValue,
                            (previousValue, element) => element(previousValue),
                          );
                          callback(item);
                        }
                      : null,
                  icon: const Icon(Icons.save),
                );
              },
            ),
            if (!isNew)
              IconButton(
                onPressed: () {
                  showConfirmDialog(
                    context: context,
                    title: const Text('Delete Option?'),
                    callback: () {
                      Navigator.pop(context);
                      callback(null);
                    },
                  );
                },
                color: Theme.of(context).colorScheme.error,
                icon: const Icon(Icons.delete),
              ),
          ],
        ),
      ),
    );
  }
}
