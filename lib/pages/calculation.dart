import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/commons.dart';
import 'package:pizza_flutter/model.dart';
import 'package:pizza_flutter/model_ext.dart';

class CalculationPage extends StatelessWidget {
  final RxVar<PizzaCalculation?> rxVar;

  const CalculationPage({super.key, required this.rxVar});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      rxVal: rxVar,
      builder: (context, calculation) {
        if (calculation == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Not Found'),
            ),
          );
        }

        Widget noItemsWidget() => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No size options yet.'),
                  ElevatedButton(
                    onPressed: () {
                      addItem(context);
                    },
                    child: const Text('Add Size Option'),
                  ),
                ],
              ),
            );

        final List<PizzaCalculatedItem> result = calculation.calculate;

        NumberFormat nf = NumberFormat()..minimumFractionDigits = 0;

        final sort = ValueNotifier((
          index: 3,
          ascending: true,
          items: result,
        ));

        void setSort(
            int columnIndex, bool ascending, List<PizzaCalculatedItem> items) {
          sort.value = (
            index: columnIndex,
            ascending: ascending,
            items: items,
          );
        }

        ({
          DataColumn column,
        }) column<T extends Comparable<T>>({
          required String label,
          required T Function(PizzaCalculatedItem item) value,
        }) {
          return (
            column: DataColumn(
              label: Text(label),
              onSort: (columnIndex, ascending) {
                var sorted = result.sortedBy(value);
                if (!ascending) {
                  sorted = sorted.reversed.toList();
                }

                setSort(
                  columnIndex,
                  ascending,
                  sorted,
                );
              },
            ),
          );
        }

        final columns = [
          column<String>(
            label: 'Name',
            value: (item) => item.item.label,
          ),
          column<num>(
            label: 'Size',
            value: (PizzaCalculatedItem item) => item.item.size,
          ),
          column<num>(
            label: 'Price',
            value: (PizzaCalculatedItem item) => item.item.price,
          ),
          column<num>(
            label: 'Relative\nCost',
            value: (PizzaCalculatedItem item) => item.relativePrice,
          ),
        ];

        final dataColumns = columns.map((e) => e.column).toList();

        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              child: Text(calculation.title),
              onTap: () {
                final controller = TextEditingController(
                  text: calculation.title,
                )..selectAll();

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Rename Calculation'),
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
                            return;
                          }

                          rxVar.updateStamped(
                            (value) => value?.copyWith(
                              title: title,
                            ),
                          );
                        },
                        child: const Text('Rename'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    addItem(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          body: result.isEmpty
              ? noItemsWidget()
              : FittedBox(
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable: sort,
                      builder: (context, value, child) {
                        return DataTable(
                          sortColumnIndex: value.index,
                          sortAscending: value.ascending,
                          columns: dataColumns,
                          rows: value.items.map((e) {
                            return DataRow(
                              key: ValueKey(e.id),
                              cells: [
                                DataCell(
                                  Text(e.item.label),
                                ),
                                DataCell(
                                  Text(nf.format(e.item.size)),
                                ),
                                DataCell(
                                  Text(nf.format(e.item.price)),
                                  // showEditIcon: true,
                                ),
                                DataCell(
                                  Text(nf.format(e.relativePrice)),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }

  void addItem(BuildContext context) {
    final id = rxVar
        .update(
          (m) => m!.copyWith(
            itemSeq: m.itemSeq + 1,
          ),
        )!
        .itemSeq;

    final defaultTitle = 'Size $id';
    final controller = TextEditingController(
      text: defaultTitle,
    )..selectAll();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Size Option'),
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

              final calc = PizzaCalculationItem(
                label: title,
                size: 1,
                price: 1,
              );

              rxVar.update(
                (value) => value!.copyWith(
                  items: Map.of(value.items)..[id] = calc,
                ),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
