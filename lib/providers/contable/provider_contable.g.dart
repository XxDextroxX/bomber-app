// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_contable.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDataBoxHash() => r'f5e339429293f30ac7230a00a94d5f68b2384732';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getDataBox].
@ProviderFor(getDataBox)
const getDataBoxProvider = GetDataBoxFamily();

/// See also [getDataBox].
class GetDataBoxFamily extends Family<AsyncValue<List<DataBox>>> {
  /// See also [getDataBox].
  const GetDataBoxFamily();

  /// See also [getDataBox].
  GetDataBoxProvider call({
    required String code,
    int limit = 10,
    int page = 1,
  }) {
    return GetDataBoxProvider(code: code, limit: limit, page: page);
  }

  @override
  GetDataBoxProvider getProviderOverride(
    covariant GetDataBoxProvider provider,
  ) {
    return call(
      code: provider.code,
      limit: provider.limit,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getDataBoxProvider';
}

/// See also [getDataBox].
class GetDataBoxProvider extends AutoDisposeFutureProvider<List<DataBox>> {
  /// See also [getDataBox].
  GetDataBoxProvider({required String code, int limit = 10, int page = 1})
    : this._internal(
        (ref) => getDataBox(
          ref as GetDataBoxRef,
          code: code,
          limit: limit,
          page: page,
        ),
        from: getDataBoxProvider,
        name: r'getDataBoxProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getDataBoxHash,
        dependencies: GetDataBoxFamily._dependencies,
        allTransitiveDependencies: GetDataBoxFamily._allTransitiveDependencies,
        code: code,
        limit: limit,
        page: page,
      );

  GetDataBoxProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
    required this.limit,
    required this.page,
  }) : super.internal();

  final String code;
  final int limit;
  final int page;

  @override
  Override overrideWith(
    FutureOr<List<DataBox>> Function(GetDataBoxRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDataBoxProvider._internal(
        (ref) => create(ref as GetDataBoxRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
        limit: limit,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DataBox>> createElement() {
    return _GetDataBoxProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDataBoxProvider &&
        other.code == code &&
        other.limit == limit &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDataBoxRef on AutoDisposeFutureProviderRef<List<DataBox>> {
  /// The parameter `code` of this provider.
  String get code;

  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetDataBoxProviderElement
    extends AutoDisposeFutureProviderElement<List<DataBox>>
    with GetDataBoxRef {
  _GetDataBoxProviderElement(super.provider);

  @override
  String get code => (origin as GetDataBoxProvider).code;
  @override
  int get limit => (origin as GetDataBoxProvider).limit;
  @override
  int get page => (origin as GetDataBoxProvider).page;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
