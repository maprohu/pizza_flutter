import 'package:collection/collection.dart';
import 'package:mhu_dart_commons/commons.dart';

import 'model.dart';

extension PizzaCalculationRxVarX on RxVar<PizzaCalculation?> {
  PizzaCalculation? updateStamped(
    PizzaCalculation? Function(PizzaCalculation? value) updates,
  ) {
    final newValue = updates(value);

    if (newValue != value) {
      return update(
        (value) => newValue?.copyWith(
          lastModified: DateTime.now(),
        ),
      );
    }

    return value;
  }
}

typedef PizzaCalculatedItem = ({
  int id,
  PizzaCalculationItem item,
  double relativePrice,
});

extension PizzaCalculationItemX on PizzaCalculationItem {
  double get area => size * size;

  double get pricePerArea => price / area;
}

extension PizzaCalculationX on PizzaCalculation {
  List<PizzaCalculatedItem> get calculate {
    if (items.isEmpty) {
      return [];
    }

    final withPricePerArea = items.entries
        .map((e) => (item: e, pricePerArea: e.value.pricePerArea))
        .sortedBy<num>((r) => r.pricePerArea);

    final lowestPrice = withPricePerArea.first.pricePerArea;

    return withPricePerArea
        .map((r) => (
              id: r.item.key,
              item: r.item.value,
              relativePrice: r.pricePerArea / lowestPrice,
            ))
        .toList();
  }
}
