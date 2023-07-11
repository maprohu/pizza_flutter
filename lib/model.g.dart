// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PizzaValueModel _$$_PizzaValueModelFromJson(Map<String, dynamic> json) =>
    _$_PizzaValueModel(
      calculationSeq: json['calculationSeq'] as int? ?? 0,
      calculations: (json['calculations'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k),
                PizzaCalculation.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      sizeSeq: json['sizeSeq'] as int? ?? 5,
      sizes: (json['sizes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k), e as String),
          ) ??
          const {
            0: 'Small',
            1: 'Normal',
            2: 'Medium',
            3: 'Large',
            4: 'Extra Large',
            5: 'Family'
          },
    );

Map<String, dynamic> _$$_PizzaValueModelToJson(_$_PizzaValueModel instance) =>
    <String, dynamic>{
      'calculationSeq': instance.calculationSeq,
      'calculations':
          instance.calculations.map((k, e) => MapEntry(k.toString(), e)),
      'sizeSeq': instance.sizeSeq,
      'sizes': instance.sizes.map((k, e) => MapEntry(k.toString(), e)),
    };

_$_PizzaCalculation _$$_PizzaCalculationFromJson(Map<String, dynamic> json) =>
    _$_PizzaCalculation(
      title: json['title'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      itemSeq: json['itemSeq'] as int? ?? 0,
      items: (json['items'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k),
                PizzaCalculationItem.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_PizzaCalculationToJson(_$_PizzaCalculation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'lastModified': instance.lastModified.toIso8601String(),
      'itemSeq': instance.itemSeq,
      'items': instance.items.map((k, e) => MapEntry(k.toString(), e)),
    };

_$_PizzaCalculationItem _$$_PizzaCalculationItemFromJson(
        Map<String, dynamic> json) =>
    _$_PizzaCalculationItem(
      label: json['label'] as String,
      size: (json['size'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PizzaCalculationItemToJson(
        _$_PizzaCalculationItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'size': instance.size,
      'price': instance.price,
    };
