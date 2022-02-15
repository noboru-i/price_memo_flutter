// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductDetailModelTearOff {
  const _$ProductDetailModelTearOff();

  _ProductDetailModel call(
      {required String productId,
      ProductDocumentSnapshot? snapshot,
      XFile? file,
      AsyncValue<Uint8List?>? imageData}) {
    return _ProductDetailModel(
      productId: productId,
      snapshot: snapshot,
      file: file,
      imageData: imageData,
    );
  }
}

/// @nodoc
const $ProductDetailModel = _$ProductDetailModelTearOff();

/// @nodoc
mixin _$ProductDetailModel {
  String get productId => throw _privateConstructorUsedError;
  ProductDocumentSnapshot? get snapshot => throw _privateConstructorUsedError;
  XFile? get file => throw _privateConstructorUsedError;
  AsyncValue<Uint8List?>? get imageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailModelCopyWith<ProductDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailModelCopyWith<$Res> {
  factory $ProductDetailModelCopyWith(
          ProductDetailModel value, $Res Function(ProductDetailModel) then) =
      _$ProductDetailModelCopyWithImpl<$Res>;
  $Res call(
      {String productId,
      ProductDocumentSnapshot? snapshot,
      XFile? file,
      AsyncValue<Uint8List?>? imageData});
}

/// @nodoc
class _$ProductDetailModelCopyWithImpl<$Res>
    implements $ProductDetailModelCopyWith<$Res> {
  _$ProductDetailModelCopyWithImpl(this._value, this._then);

  final ProductDetailModel _value;
  // ignore: unused_field
  final $Res Function(ProductDetailModel) _then;

  @override
  $Res call({
    Object? productId = freezed,
    Object? snapshot = freezed,
    Object? file = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      snapshot: snapshot == freezed
          ? _value.snapshot
          : snapshot // ignore: cast_nullable_to_non_nullable
              as ProductDocumentSnapshot?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Uint8List?>?,
    ));
  }
}

/// @nodoc
abstract class _$ProductDetailModelCopyWith<$Res>
    implements $ProductDetailModelCopyWith<$Res> {
  factory _$ProductDetailModelCopyWith(
          _ProductDetailModel value, $Res Function(_ProductDetailModel) then) =
      __$ProductDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productId,
      ProductDocumentSnapshot? snapshot,
      XFile? file,
      AsyncValue<Uint8List?>? imageData});
}

/// @nodoc
class __$ProductDetailModelCopyWithImpl<$Res>
    extends _$ProductDetailModelCopyWithImpl<$Res>
    implements _$ProductDetailModelCopyWith<$Res> {
  __$ProductDetailModelCopyWithImpl(
      _ProductDetailModel _value, $Res Function(_ProductDetailModel) _then)
      : super(_value, (v) => _then(v as _ProductDetailModel));

  @override
  _ProductDetailModel get _value => super._value as _ProductDetailModel;

  @override
  $Res call({
    Object? productId = freezed,
    Object? snapshot = freezed,
    Object? file = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_ProductDetailModel(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      snapshot: snapshot == freezed
          ? _value.snapshot
          : snapshot // ignore: cast_nullable_to_non_nullable
              as ProductDocumentSnapshot?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Uint8List?>?,
    ));
  }
}

/// @nodoc

class _$_ProductDetailModel implements _ProductDetailModel {
  _$_ProductDetailModel(
      {required this.productId, this.snapshot, this.file, this.imageData});

  @override
  final String productId;
  @override
  final ProductDocumentSnapshot? snapshot;
  @override
  final XFile? file;
  @override
  final AsyncValue<Uint8List?>? imageData;

  @override
  String toString() {
    return 'ProductDetailModel(productId: $productId, snapshot: $snapshot, file: $file, imageData: $imageData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDetailModel &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.snapshot, snapshot) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.imageData, imageData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(snapshot),
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(imageData));

  @JsonKey(ignore: true)
  @override
  _$ProductDetailModelCopyWith<_ProductDetailModel> get copyWith =>
      __$ProductDetailModelCopyWithImpl<_ProductDetailModel>(this, _$identity);
}

abstract class _ProductDetailModel implements ProductDetailModel {
  factory _ProductDetailModel(
      {required String productId,
      ProductDocumentSnapshot? snapshot,
      XFile? file,
      AsyncValue<Uint8List?>? imageData}) = _$_ProductDetailModel;

  @override
  String get productId;
  @override
  ProductDocumentSnapshot? get snapshot;
  @override
  XFile? get file;
  @override
  AsyncValue<Uint8List?>? get imageData;
  @override
  @JsonKey(ignore: true)
  _$ProductDetailModelCopyWith<_ProductDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
