// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_emergency.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getResponseEmergencyByUserHash() =>
    r'7e37820c102be80060e4a3f2543756a83b93104e';

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

/// See also [getResponseEmergencyByUser].
@ProviderFor(getResponseEmergencyByUser)
const getResponseEmergencyByUserProvider = GetResponseEmergencyByUserFamily();

/// See also [getResponseEmergencyByUser].
class GetResponseEmergencyByUserFamily
    extends Family<AsyncValue<ResponseEmergencyByUser?>> {
  /// See also [getResponseEmergencyByUser].
  const GetResponseEmergencyByUserFamily();

  /// See also [getResponseEmergencyByUser].
  GetResponseEmergencyByUserProvider call(int idEmergency, int idUser) {
    return GetResponseEmergencyByUserProvider(idEmergency, idUser);
  }

  @override
  GetResponseEmergencyByUserProvider getProviderOverride(
    covariant GetResponseEmergencyByUserProvider provider,
  ) {
    return call(provider.idEmergency, provider.idUser);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getResponseEmergencyByUserProvider';
}

/// See also [getResponseEmergencyByUser].
class GetResponseEmergencyByUserProvider
    extends AutoDisposeFutureProvider<ResponseEmergencyByUser?> {
  /// See also [getResponseEmergencyByUser].
  GetResponseEmergencyByUserProvider(int idEmergency, int idUser)
    : this._internal(
        (ref) => getResponseEmergencyByUser(
          ref as GetResponseEmergencyByUserRef,
          idEmergency,
          idUser,
        ),
        from: getResponseEmergencyByUserProvider,
        name: r'getResponseEmergencyByUserProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getResponseEmergencyByUserHash,
        dependencies: GetResponseEmergencyByUserFamily._dependencies,
        allTransitiveDependencies:
            GetResponseEmergencyByUserFamily._allTransitiveDependencies,
        idEmergency: idEmergency,
        idUser: idUser,
      );

  GetResponseEmergencyByUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idEmergency,
    required this.idUser,
  }) : super.internal();

  final int idEmergency;
  final int idUser;

  @override
  Override overrideWith(
    FutureOr<ResponseEmergencyByUser?> Function(
      GetResponseEmergencyByUserRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetResponseEmergencyByUserProvider._internal(
        (ref) => create(ref as GetResponseEmergencyByUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idEmergency: idEmergency,
        idUser: idUser,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ResponseEmergencyByUser?> createElement() {
    return _GetResponseEmergencyByUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetResponseEmergencyByUserProvider &&
        other.idEmergency == idEmergency &&
        other.idUser == idUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idEmergency.hashCode);
    hash = _SystemHash.combine(hash, idUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetResponseEmergencyByUserRef
    on AutoDisposeFutureProviderRef<ResponseEmergencyByUser?> {
  /// The parameter `idEmergency` of this provider.
  int get idEmergency;

  /// The parameter `idUser` of this provider.
  int get idUser;
}

class _GetResponseEmergencyByUserProviderElement
    extends AutoDisposeFutureProviderElement<ResponseEmergencyByUser?>
    with GetResponseEmergencyByUserRef {
  _GetResponseEmergencyByUserProviderElement(super.provider);

  @override
  int get idEmergency =>
      (origin as GetResponseEmergencyByUserProvider).idEmergency;
  @override
  int get idUser => (origin as GetResponseEmergencyByUserProvider).idUser;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
