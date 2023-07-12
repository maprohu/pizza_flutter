// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColumnDef<T extends Comparable<T>> {
  double get width => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  T Function(({int id, PizzaCalculationItem item, double relativePrice}))
      get value => throw _privateConstructorUsedError;
  String Function(T) get cell => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColumnDefCopyWith<T, ColumnDef<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnDefCopyWith<T extends Comparable<T>, $Res> {
  factory $ColumnDefCopyWith(
          ColumnDef<T> value, $Res Function(ColumnDef<T>) then) =
      _$ColumnDefCopyWithImpl<T, $Res, ColumnDef<T>>;
  @useResult
  $Res call(
      {double width,
      String label,
      T Function(({int id, PizzaCalculationItem item, double relativePrice}))
          value,
      String Function(T) cell});
}

/// @nodoc
class _$ColumnDefCopyWithImpl<T extends Comparable<T>, $Res,
    $Val extends ColumnDef<T>> implements $ColumnDefCopyWith<T, $Res> {
  _$ColumnDefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? label = null,
    Object? value = null,
    Object? cell = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T Function(
                  ({int id, PizzaCalculationItem item, double relativePrice})),
      cell: null == cell
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as String Function(T),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnDefCopyWith<T extends Comparable<T>, $Res>
    implements $ColumnDefCopyWith<T, $Res> {
  factory _$$_ColumnDefCopyWith(
          _$_ColumnDef<T> value, $Res Function(_$_ColumnDef<T>) then) =
      __$$_ColumnDefCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {double width,
      String label,
      T Function(({int id, PizzaCalculationItem item, double relativePrice}))
          value,
      String Function(T) cell});
}

/// @nodoc
class __$$_ColumnDefCopyWithImpl<T extends Comparable<T>, $Res>
    extends _$ColumnDefCopyWithImpl<T, $Res, _$_ColumnDef<T>>
    implements _$$_ColumnDefCopyWith<T, $Res> {
  __$$_ColumnDefCopyWithImpl(
      _$_ColumnDef<T> _value, $Res Function(_$_ColumnDef<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? label = null,
    Object? value = null,
    Object? cell = null,
  }) {
    return _then(_$_ColumnDef<T>(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T Function(
                  ({int id, PizzaCalculationItem item, double relativePrice})),
      cell: null == cell
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as String Function(T),
    ));
  }
}

/// @nodoc

class _$_ColumnDef<T extends Comparable<T>> extends _ColumnDef<T> {
  const _$_ColumnDef(
      {required this.width,
      required this.label,
      required this.value,
      required this.cell})
      : super._();

  @override
  final double width;
  @override
  final String label;
  @override
  final T Function(({int id, PizzaCalculationItem item, double relativePrice}))
      value;
  @override
  final String Function(T) cell;

  @override
  String toString() {
    return 'ColumnDef<$T>(width: $width, label: $label, value: $value, cell: $cell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnDef<T> &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.cell, cell) || other.cell == cell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, width, label, value, cell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnDefCopyWith<T, _$_ColumnDef<T>> get copyWith =>
      __$$_ColumnDefCopyWithImpl<T, _$_ColumnDef<T>>(this, _$identity);
}

abstract class _ColumnDef<T extends Comparable<T>> extends ColumnDef<T> {
  const factory _ColumnDef(
      {required final double width,
      required final String label,
      required final T Function(
              ({int id, PizzaCalculationItem item, double relativePrice}))
          value,
      required final String Function(T) cell}) = _$_ColumnDef<T>;
  const _ColumnDef._() : super._();

  @override
  double get width;
  @override
  String get label;
  @override
  T Function(({int id, PizzaCalculationItem item, double relativePrice}))
      get value;
  @override
  String Function(T) get cell;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnDefCopyWith<T, _$_ColumnDef<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
