import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/mhu_flutter_commons.dart';
import 'package:pizza_flutter/model.dart';
import 'package:pizza_flutter/model_ext.dart';
import 'package:pizza_flutter/pages/calculation_edit.dart';
import 'package:pizza_flutter/pages/help.dart';

import '../store.dart';

part 'calculation.freezed.dart';

NumberFormat numberFormat = NumberFormat()..minimumFractionDigits = 0;

const nameCellWidth = 140.0;
const numberCellWidth = 60.0;

@freezed
class ColumnDef<T extends Comparable<T>> with _$ColumnDef<T> {
  const factory ColumnDef({
    required double width,
    required String label,
    required T Function(PizzaCalculatedItem item) value,
    required String Function(T value) cell,
  }) = _ColumnDef;

  static ColumnDef<num> number<T extends num>({
    required String label,
    required T Function(PizzaCalculatedItem item) value,
  }) =>
      ColumnDef(
        width: numberCellWidth,
        label: label,
        value: value,
        cell: numberFormat.format,
      );

  Comparator<PizzaCalculatedItem> get comparator => value.toComparator;

  String text(PizzaCalculatedItem item) {
    return cell(value(item));
  }

  const ColumnDef._();
}

typedef SortState = ({
  ColumnDef<Comparable<dynamic>> column,
  bool ascending,
  List<PizzaCalculatedItem> sorted,
});

class CalculationPage extends StatelessWidget {
  final RxVar<PizzaCalculation?> rxVar;
  final PizzaValueStore store;

  CalculationPage({super.key, required this.rxVar, required this.store});

  late final ColumnDef relativeCostColumn;

  late final List<ColumnDef<Comparable<dynamic>>> columns = [
    ColumnDef<String>(
      label: 'Name',
      width: nameCellWidth,
      value: (item) => item.item.label,
      cell: identity,
    ),
    ColumnDef.number(
      label: '⌀',
      value: (PizzaCalculatedItem item) => item.item.size,
    ),
    ColumnDef.number(
      label: '＄',
      value: (PizzaCalculatedItem item) => item.item.price,
    ),
    ColumnDef<num>(
      label: '🫰⨉',
      value: (PizzaCalculatedItem item) => item.relativePrice,
      width: numberCellWidth,
      cell: (value) => value == 1 ? '🥇' : numberFormat.format(value),
    ).also((e) => relativeCostColumn = e),
  ];

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
            actions: const [
              HelpButton(),
            ],
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
          body: calculation.items.isEmpty
              ? noItemsWidget()
              : table(context, calculation),
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

  Widget table(
    BuildContext context,
    PizzaCalculation calculation,
  ) {
    final List<PizzaCalculatedItem> result = calculation.calculate;

    SortState sortState({
      required ColumnDef column,
      required bool ascending,
    }) {
      final sorted = result.sorted(
        column.comparator.ascending(ascending),
      );

      return (
        column: column,
        ascending: ascending,
        sorted: sorted,
      );
    }

    columns;
    final sorted = rxw(
      sortState(
        column: relativeCostColumn,
        ascending: true,
      ),
    );

    const iconSize = 12.0;

    return Center(
      child: RxBuilder(
        rxVal: sorted,
        builder: (context, sort) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...columns.map((column) {
                      final sorting = sort.column == column;

                      return InkWell(
                        onTap: () {
                          final ascending = sorting ? !sort.ascending : true;
                          sorted.value =
                              sortState(column: column, ascending: ascending);
                        },
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 40,
                          ),
                          child: SizedBox(
                            width: column.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    column.label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (sorting)
                                  Icon(
                                    sort.ascending
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    size: iconSize,
                                  )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final item in sort.sorted)
                        InkWell(
                          onTap: () {
                            showItemEditor(context, item.id);
                          },
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 48,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (final column in columns)
                                  SizedBox(
                                    width: column.width,
                                    child: Text(
                                      column.text(item),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
