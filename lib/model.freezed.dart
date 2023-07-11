// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PizzaValueModel _$PizzaValueModelFromJson(Map<String, dynamic> json) {
  return _PizzaValueModel.fromJson(json);
}

/// @nodoc
mixin _$PizzaValueModel {
  int get calculationSeq => throw _privateConstructorUsedError;
  Map<int, PizzaCalculation> get calculations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaValueModelCopyWith<PizzaValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaValueModelCopyWith<$Res> {
  factory $PizzaValueModelCopyWith(
          PizzaValueModel value, $Res Function(PizzaValueModel) then) =
      _$PizzaValueModelCopyWithImpl<$Res, PizzaValueModel>;
  @useResult
  $Res call({int calculationSeq, Map<int, PizzaCalculation> calculations});
}

/// @nodoc
class _$PizzaValueModelCopyWithImpl<$Res, $Val extends PizzaValueModel>
    implements $PizzaValueModelCopyWith<$Res> {
  _$PizzaValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculationSeq = null,
    Object? calculations = null,
  }) {
    return _then(_value.copyWith(
      calculationSeq: null == calculationSeq
          ? _value.calculationSeq
          : calculationSeq // ignore: cast_nullable_to_non_nullable
              as int,
      calculations: null == calculations
          ? _value.calculations
          : calculations // ignore: cast_nullable_to_non_nullable
              as Map<int, PizzaCalculation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PizzaValueModelCopyWith<$Res>
    implements $PizzaValueModelCopyWith<$Res> {
  factory _$$_PizzaValueModelCopyWith(
          _$_PizzaValueModel value, $Res Function(_$_PizzaValueModel) then) =
      __$$_PizzaValueModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int calculationSeq, Map<int, PizzaCalculation> calculations});
}

/// @nodoc
class __$$_PizzaValueModelCopyWithImpl<$Res>
    extends _$PizzaValueModelCopyWithImpl<$Res, _$_PizzaValueModel>
    implements _$$_PizzaValueModelCopyWith<$Res> {
  __$$_PizzaValueModelCopyWithImpl(
      _$_PizzaValueModel _value, $Res Function(_$_PizzaValueModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculationSeq = null,
    Object? calculations = null,
  }) {
    return _then(_$_PizzaValueModel(
      calculationSeq: null == calculationSeq
          ? _value.calculationSeq
          : calculationSeq // ignore: cast_nullable_to_non_nullable
              as int,
      calculations: null == calculations
          ? _value._calculations
          : calculations // ignore: cast_nullable_to_non_nullable
              as Map<int, PizzaCalculation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PizzaValueModel implements _PizzaValueModel {
  const _$_PizzaValueModel(
      {this.calculationSeq = 0,
      final Map<int, PizzaCalculation> calculations = const {}})
      : _calculations = calculations;

  factory _$_PizzaValueModel.fromJson(Map<String, dynamic> json) =>
      _$$_PizzaValueModelFromJson(json);

  @override
  @JsonKey()
  final int calculationSeq;
  final Map<int, PizzaCalculation> _calculations;
  @override
  @JsonKey()
  Map<int, PizzaCalculation> get calculations {
    if (_calculations is EqualUnmodifiableMapView) return _calculations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_calculations);
  }

  @override
  String toString() {
    return 'PizzaValueModel(calculationSeq: $calculationSeq, calculations: $calculations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PizzaValueModel &&
            (identical(other.calculationSeq, calculationSeq) ||
                other.calculationSeq == calculationSeq) &&
            const DeepCollectionEquality()
                .equals(other._calculations, _calculations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, calculationSeq,
      const DeepCollectionEquality().hash(_calculations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PizzaValueModelCopyWith<_$_PizzaValueModel> get copyWith =>
      __$$_PizzaValueModelCopyWithImpl<_$_PizzaValueModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PizzaValueModelToJson(
      this,
    );
  }
}

abstract class _PizzaValueModel implements PizzaValueModel {
  const factory _PizzaValueModel(
      {final int calculationSeq,
      final Map<int, PizzaCalculation> calculations}) = _$_PizzaValueModel;

  factory _PizzaValueModel.fromJson(Map<String, dynamic> json) =
      _$_PizzaValueModel.fromJson;

  @override
  int get calculationSeq;
  @override
  Map<int, PizzaCalculation> get calculations;
  @override
  @JsonKey(ignore: true)
  _$$_PizzaValueModelCopyWith<_$_PizzaValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PizzaCalculation _$PizzaCalculationFromJson(Map<String, dynamic> json) {
  return _PizzaCalculation.fromJson(json);
}

/// @nodoc
mixin _$PizzaCalculation {
  String get title => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;
  int get itemSeq => throw _privateConstructorUsedError;
  Map<int, PizzaCalculationItem> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaCalculationCopyWith<PizzaCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaCalculationCopyWith<$Res> {
  factory $PizzaCalculationCopyWith(
          PizzaCalculation value, $Res Function(PizzaCalculation) then) =
      _$PizzaCalculationCopyWithImpl<$Res, PizzaCalculation>;
  @useResult
  $Res call(
      {String title,
      DateTime lastModified,
      int itemSeq,
      Map<int, PizzaCalculationItem> items});
}

/// @nodoc
class _$PizzaCalculationCopyWithImpl<$Res, $Val extends PizzaCalculation>
    implements $PizzaCalculationCopyWith<$Res> {
  _$PizzaCalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lastModified = null,
    Object? itemSeq = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemSeq: null == itemSeq
          ? _value.itemSeq
          : itemSeq // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<int, PizzaCalculationItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PizzaCalculationCopyWith<$Res>
    implements $PizzaCalculationCopyWith<$Res> {
  factory _$$_PizzaCalculationCopyWith(
          _$_PizzaCalculation value, $Res Function(_$_PizzaCalculation) then) =
      __$$_PizzaCalculationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DateTime lastModified,
      int itemSeq,
      Map<int, PizzaCalculationItem> items});
}

/// @nodoc
class __$$_PizzaCalculationCopyWithImpl<$Res>
    extends _$PizzaCalculationCopyWithImpl<$Res, _$_PizzaCalculation>
    implements _$$_PizzaCalculationCopyWith<$Res> {
  __$$_PizzaCalculationCopyWithImpl(
      _$_PizzaCalculation _value, $Res Function(_$_PizzaCalculation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lastModified = null,
    Object? itemSeq = null,
    Object? items = null,
  }) {
    return _then(_$_PizzaCalculation(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemSeq: null == itemSeq
          ? _value.itemSeq
          : itemSeq // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<int, PizzaCalculationItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PizzaCalculation implements _PizzaCalculation {
  const _$_PizzaCalculation(
      {required this.title,
      required this.lastModified,
      this.itemSeq = 0,
      final Map<int, PizzaCalculationItem> items = const {}})
      : _items = items;

  factory _$_PizzaCalculation.fromJson(Map<String, dynamic> json) =>
      _$$_PizzaCalculationFromJson(json);

  @override
  final String title;
  @override
  final DateTime lastModified;
  @override
  @JsonKey()
  final int itemSeq;
  final Map<int, PizzaCalculationItem> _items;
  @override
  @JsonKey()
  Map<int, PizzaCalculationItem> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  String toString() {
    return 'PizzaCalculation(title: $title, lastModified: $lastModified, itemSeq: $itemSeq, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PizzaCalculation &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.itemSeq, itemSeq) || other.itemSeq == itemSeq) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, lastModified, itemSeq,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PizzaCalculationCopyWith<_$_PizzaCalculation> get copyWith =>
      __$$_PizzaCalculationCopyWithImpl<_$_PizzaCalculation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PizzaCalculationToJson(
      this,
    );
  }
}

abstract class _PizzaCalculation implements PizzaCalculation {
  const factory _PizzaCalculation(
      {required final String title,
      required final DateTime lastModified,
      final int itemSeq,
      final Map<int, PizzaCalculationItem> items}) = _$_PizzaCalculation;

  factory _PizzaCalculation.fromJson(Map<String, dynamic> json) =
      _$_PizzaCalculation.fromJson;

  @override
  String get title;
  @override
  DateTime get lastModified;
  @override
  int get itemSeq;
  @override
  Map<int, PizzaCalculationItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PizzaCalculationCopyWith<_$_PizzaCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

PizzaCalculationItem _$PizzaCalculationItemFromJson(Map<String, dynamic> json) {
  return _PizzaCalculationItem.fromJson(json);
}

/// @nodoc
mixin _$PizzaCalculationItem {
  String get label => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaCalculationItemCopyWith<PizzaCalculationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaCalculationItemCopyWith<$Res> {
  factory $PizzaCalculationItemCopyWith(PizzaCalculationItem value,
          $Res Function(PizzaCalculationItem) then) =
      _$PizzaCalculationItemCopyWithImpl<$Res, PizzaCalculationItem>;
  @useResult
  $Res call({String label, double size, double price});
}

/// @nodoc
class _$PizzaCalculationItemCopyWithImpl<$Res,
        $Val extends PizzaCalculationItem>
    implements $PizzaCalculationItemCopyWith<$Res> {
  _$PizzaCalculationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? size = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PizzaCalculationItemCopyWith<$Res>
    implements $PizzaCalculationItemCopyWith<$Res> {
  factory _$$_PizzaCalculationItemCopyWith(_$_PizzaCalculationItem value,
          $Res Function(_$_PizzaCalculationItem) then) =
      __$$_PizzaCalculationItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double size, double price});
}

/// @nodoc
class __$$_PizzaCalculationItemCopyWithImpl<$Res>
    extends _$PizzaCalculationItemCopyWithImpl<$Res, _$_PizzaCalculationItem>
    implements _$$_PizzaCalculationItemCopyWith<$Res> {
  __$$_PizzaCalculationItemCopyWithImpl(_$_PizzaCalculationItem _value,
      $Res Function(_$_PizzaCalculationItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? size = null,
    Object? price = null,
  }) {
    return _then(_$_PizzaCalculationItem(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PizzaCalculationItem implements _PizzaCalculationItem {
  const _$_PizzaCalculationItem(
      {required this.label, required this.size, required this.price});

  factory _$_PizzaCalculationItem.fromJson(Map<String, dynamic> json) =>
      _$$_PizzaCalculationItemFromJson(json);

  @override
  final String label;
  @override
  final double size;
  @override
  final double price;

  @override
  String toString() {
    return 'PizzaCalculationItem(label: $label, size: $size, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PizzaCalculationItem &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, size, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PizzaCalculationItemCopyWith<_$_PizzaCalculationItem> get copyWith =>
      __$$_PizzaCalculationItemCopyWithImpl<_$_PizzaCalculationItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PizzaCalculationItemToJson(
      this,
    );
  }
}

abstract class _PizzaCalculationItem implements PizzaCalculationItem {
  const factory _PizzaCalculationItem(
      {required final String label,
      required final double size,
      required final double price}) = _$_PizzaCalculationItem;

  factory _PizzaCalculationItem.fromJson(Map<String, dynamic> json) =
      _$_PizzaCalculationItem.fromJson;

  @override
  String get label;
  @override
  double get size;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_PizzaCalculationItemCopyWith<_$_PizzaCalculationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
