import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhu_dart_commons/commons.dart';

part 'model.freezed.dart';

part 'model.g.dart';

@freezed
class PizzaValueModel with _$PizzaValueModel {
  const factory PizzaValueModel({
    @Default(0) int calculationSeq,
    @Default({}) Map<int, PizzaCalculation> calculations,
  }) = _PizzaValueModel;

  factory PizzaValueModel.fromJson(Map<String, dynamic> json) =>
      _$PizzaValueModelFromJson(json);
}

@freezed
class PizzaCalculation with _$PizzaCalculation {
  const factory PizzaCalculation({
    required String title,
    required DateTime lastModified,
    @Default(0) int itemSeq,
    @Default({}) Map<int, PizzaCalculationItem> items,
  }) = _PizzaCalculation;

  factory PizzaCalculation.fromJson(Map<String, dynamic> json) =>
      _$PizzaCalculationFromJson(json);
}

@freezed
class PizzaCalculationItem with _$PizzaCalculationItem {
  const factory PizzaCalculationItem({
    required String label,
    required double size,
    required double price,
  }) = _PizzaCalculationItem;

  factory PizzaCalculationItem.fromJson(Map<String, dynamic> json) =>
      _$PizzaCalculationItemFromJson(json);
}
