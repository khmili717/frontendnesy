// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictionResults _$PredictionResultsFromJson(Map<String, dynamic> json) {
  return _PredictionResults.fromJson(json);
}

/// @nodoc
mixin _$PredictionResults {
  int get ypred => throw _privateConstructorUsedError;
  double get proba => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  List<dynamic> get values => throw _privateConstructorUsedError;
  List<double> get contributions => throw _privateConstructorUsedError;
  @JsonKey(name: 'ypred_original')
  String get ypredOriginal => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;

  /// Serializes this PredictionResults to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictionResults
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionResultsCopyWith<PredictionResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionResultsCopyWith<$Res> {
  factory $PredictionResultsCopyWith(
          PredictionResults value, $Res Function(PredictionResults) then) =
      _$PredictionResultsCopyWithImpl<$Res, PredictionResults>;
  @useResult
  $Res call(
      {int ypred,
      double proba,
      List<String> features,
      List<dynamic> values,
      List<double> contributions,
      @JsonKey(name: 'ypred_original') String ypredOriginal,
      @JsonKey(name: 'image_path') String? imagePath});
}

/// @nodoc
class _$PredictionResultsCopyWithImpl<$Res, $Val extends PredictionResults>
    implements $PredictionResultsCopyWith<$Res> {
  _$PredictionResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictionResults
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ypred = null,
    Object? proba = null,
    Object? features = null,
    Object? values = null,
    Object? contributions = null,
    Object? ypredOriginal = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      ypred: null == ypred
          ? _value.ypred
          : ypred // ignore: cast_nullable_to_non_nullable
              as int,
      proba: null == proba
          ? _value.proba
          : proba // ignore: cast_nullable_to_non_nullable
              as double,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      contributions: null == contributions
          ? _value.contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      ypredOriginal: null == ypredOriginal
          ? _value.ypredOriginal
          : ypredOriginal // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionResultsImplCopyWith<$Res>
    implements $PredictionResultsCopyWith<$Res> {
  factory _$$PredictionResultsImplCopyWith(_$PredictionResultsImpl value,
          $Res Function(_$PredictionResultsImpl) then) =
      __$$PredictionResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int ypred,
      double proba,
      List<String> features,
      List<dynamic> values,
      List<double> contributions,
      @JsonKey(name: 'ypred_original') String ypredOriginal,
      @JsonKey(name: 'image_path') String? imagePath});
}

/// @nodoc
class __$$PredictionResultsImplCopyWithImpl<$Res>
    extends _$PredictionResultsCopyWithImpl<$Res, _$PredictionResultsImpl>
    implements _$$PredictionResultsImplCopyWith<$Res> {
  __$$PredictionResultsImplCopyWithImpl(_$PredictionResultsImpl _value,
      $Res Function(_$PredictionResultsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredictionResults
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ypred = null,
    Object? proba = null,
    Object? features = null,
    Object? values = null,
    Object? contributions = null,
    Object? ypredOriginal = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$PredictionResultsImpl(
      ypred: null == ypred
          ? _value.ypred
          : ypred // ignore: cast_nullable_to_non_nullable
              as int,
      proba: null == proba
          ? _value.proba
          : proba // ignore: cast_nullable_to_non_nullable
              as double,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      contributions: null == contributions
          ? _value._contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      ypredOriginal: null == ypredOriginal
          ? _value.ypredOriginal
          : ypredOriginal // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionResultsImpl implements _PredictionResults {
  const _$PredictionResultsImpl(
      {required this.ypred,
      required this.proba,
      required final List<String> features,
      required final List<dynamic> values,
      required final List<double> contributions,
      @JsonKey(name: 'ypred_original') required this.ypredOriginal,
      @JsonKey(name: 'image_path') this.imagePath})
      : _features = features,
        _values = values,
        _contributions = contributions;

  factory _$PredictionResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionResultsImplFromJson(json);

  @override
  final int ypred;
  @override
  final double proba;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<dynamic> _values;
  @override
  List<dynamic> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  final List<double> _contributions;
  @override
  List<double> get contributions {
    if (_contributions is EqualUnmodifiableListView) return _contributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributions);
  }

  @override
  @JsonKey(name: 'ypred_original')
  final String ypredOriginal;
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;

  @override
  String toString() {
    return 'PredictionResults(ypred: $ypred, proba: $proba, features: $features, values: $values, contributions: $contributions, ypredOriginal: $ypredOriginal, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionResultsImpl &&
            (identical(other.ypred, ypred) || other.ypred == ypred) &&
            (identical(other.proba, proba) || other.proba == proba) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality()
                .equals(other._contributions, _contributions) &&
            (identical(other.ypredOriginal, ypredOriginal) ||
                other.ypredOriginal == ypredOriginal) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ypred,
      proba,
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(_values),
      const DeepCollectionEquality().hash(_contributions),
      ypredOriginal,
      imagePath);

  /// Create a copy of PredictionResults
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionResultsImplCopyWith<_$PredictionResultsImpl> get copyWith =>
      __$$PredictionResultsImplCopyWithImpl<_$PredictionResultsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionResultsImplToJson(
      this,
    );
  }
}

abstract class _PredictionResults implements PredictionResults {
  const factory _PredictionResults(
          {required final int ypred,
          required final double proba,
          required final List<String> features,
          required final List<dynamic> values,
          required final List<double> contributions,
          @JsonKey(name: 'ypred_original') required final String ypredOriginal,
          @JsonKey(name: 'image_path') final String? imagePath}) =
      _$PredictionResultsImpl;

  factory _PredictionResults.fromJson(Map<String, dynamic> json) =
      _$PredictionResultsImpl.fromJson;

  @override
  int get ypred;
  @override
  double get proba;
  @override
  List<String> get features;
  @override
  List<dynamic> get values;
  @override
  List<double> get contributions;
  @override
  @JsonKey(name: 'ypred_original')
  String get ypredOriginal;
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath;

  /// Create a copy of PredictionResults
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionResultsImplCopyWith<_$PredictionResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
