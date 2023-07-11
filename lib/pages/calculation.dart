import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/commons.dart';
import 'package:pizza_flutter/model.dart';
import 'package:pizza_flutter/model_ext.dart';
import 'package:pizza_flutter/pages/calculation_edit.dart';

import '../store.dart';

NumberFormat numberFormat = NumberFormat()..minimumFractionDigits = 0;

class CalculationPage extends StatelessWidget {
  final RxVar<PizzaCalculation?> rxVar;
  final PizzaValueStore store;

  const CalculationPage({super.key, required this.rxVar, required this.store});

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
          DataCell Function(
            BuildContext context,
            PizzaCalculatedItem item,
          ) cell,
        }) column<T extends Comparable<T>>({
          required String label,
          required T Function(PizzaCalculatedItem item) value,
          required DataCell Function(T value, VoidCallback? onTap) cell,
          required bool numeric,
        }) {
          return (
            column: DataColumn(
              label: Text(label),
              numeric: numeric,
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
            cell: (context, item) {
              return cell(
                value(item),
                () => showItemEditor(context, item.id),
              );
            }
          );
        }

        DataCell doubleCell(num value, VoidCallback? onTap) => DataCell(
              Text(
                numberFormat.format(value),
              ),
              onTap: onTap,
            );

        final columns = [
          column<String>(
            label: 'Name',
            numeric: false,
            value: (item) => item.item.label,
            cell: (value, onTap) => DataCell(
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 80,
                ),
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: onTap,
            ),
          ),
          column<num>(
            label: 'Diameter',
            numeric: true,
            value: (PizzaCalculatedItem item) => item.item.size,
            cell: doubleCell,
          ),
          column<num>(
            label: 'Price',
            numeric: true,
            value: (PizzaCalculatedItem item) => item.item.price,
            cell: doubleCell,
          ),
          column<num>(
            label: 'Relative\nCost',
            numeric: true,
            value: (PizzaCalculatedItem item) => item.relativePrice,
            cell: doubleCell,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    addItem(context);
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    showConfirmDialog(
                      context: context,
                      title: const Text('Delete Calculation?'),
                      callback: () {
                        Navigator.pop(context);
                        rxVar.value = null;
                      },
                    );
                  },
                  color: Theme.of(context).colorScheme.error,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
          body: result.isEmpty
              ? noItemsWidget()
              : SingleChildScrollView(
                  child: ValueListenableBuilder(
                    valueListenable: sort,
                    builder: (context, value, child) {
                      return DataTable(
                        columnSpacing: 0,
                        sortColumnIndex: value.index,
                        sortAscending: value.ascending,
                        columns: dataColumns,
                        rows: value.items.map((e) {
                          return DataRow(
                            key: ValueKey(e.id),
                            cells: [
                              for (final column in columns)
                                column.cell(context, e),
                            ],
                          );
                        }).toList(),
                      );
                    },
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

    showItemEditor(context, id);
  }

  void showItemEditor(
    BuildContext context,
    int id,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PizzaCalculationItemEditor(
          item: rxVar.value?.items[id],
          id: id,
          callback: (item) {
            rxVar.update(
              (value) => value!.copyWith(
                items: Map.of(value.items)..putOrRemove(id, item),
              ),
            );
          },
          store: store,
        ),
      ),
    );
  }
}
