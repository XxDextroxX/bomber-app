// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_responses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$emergencyResponsesHash() =>
    r'ffc5547ead0124e45bac2382f79380a5f0e2d1b5';

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

abstract class _$EmergencyResponses
    extends BuildlessStreamNotifier<List<EmergencyResponseModel>> {
  late final int emergencyId;
  late final int captainId;

  Stream<List<EmergencyResponseModel>> build(int emergencyId, int captainId);
}

/// See also [EmergencyResponses].
@ProviderFor(EmergencyResponses)
const emergencyResponsesProvider = EmergencyResponsesFamily();

/// See also [EmergencyResponses].
class EmergencyResponsesFamily
    extends Family<AsyncValue<List<EmergencyResponseModel>>> {
  /// See also [EmergencyResponses].
  const EmergencyResponsesFamily();

  /// See also [EmergencyResponses].
  EmergencyResponsesProvider call(int emergencyId, int captainId) {
    return EmergencyResponsesProvider(emergencyId, captainId);
  }

  @override
  EmergencyResponsesProvider getProviderOverride(
    covariant EmergencyResponsesProvider provider,
  ) {
    return call(provider.emergencyId, provider.captainId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'emergencyResponsesProvider';
}

/// See also [EmergencyResponses].
class EmergencyResponsesProvider
    extends
        StreamNotifierProviderImpl<
          EmergencyResponses,
          List<EmergencyResponseModel>
        > {
  /// See also [EmergencyResponses].
  EmergencyResponsesProvider(int emergencyId, int captainId)
    : this._internal(
        () =>
            EmergencyResponses()
              ..emergencyId = emergencyId
              ..captainId = captainId,
        from: emergencyResponsesProvider,
        name: r'emergencyResponsesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$emergencyResponsesHash,
        dependencies: EmergencyResponsesFamily._dependencies,
        allTransitiveDependencies:
            EmergencyResponsesFamily._allTransitiveDependencies,
        emergencyId: emergencyId,
        captainId: captainId,
      );

  EmergencyResponsesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.emergencyId,
    required this.captainId,
  }) : super.internal();

  final int emergencyId;
  final int captainId;

  @override
  Stream<List<EmergencyResponseModel>> runNotifierBuild(
    covariant EmergencyResponses notifier,
  ) {
    return notifier.build(emergencyId, captainId);
  }

  @override
  Override overrideWith(EmergencyResponses Function() create) {
    return ProviderOverride(
      origin: this,
      override: EmergencyResponsesProvider._internal(
        () =>
            create()
              ..emergencyId = emergencyId
              ..captainId = captainId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        emergencyId: emergencyId,
        captainId: captainId,
      ),
    );
  }

  @override
  StreamNotifierProviderElement<
    EmergencyResponses,
    List<EmergencyResponseModel>
  >
  createElement() {
    return _EmergencyResponsesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EmergencyResponsesProvider &&
        other.emergencyId == emergencyId &&
        other.captainId == captainId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emergencyId.hashCode);
    hash = _SystemHash.combine(hash, captainId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EmergencyResponsesRef
    on StreamNotifierProviderRef<List<EmergencyResponseModel>> {
  /// The parameter `emergencyId` of this provider.
  int get emergencyId;

  /// The parameter `captainId` of this provider.
  int get captainId;
}

class _EmergencyResponsesProviderElement
    extends
        StreamNotifierProviderElement<
          EmergencyResponses,
          List<EmergencyResponseModel>
        >
    with EmergencyResponsesRef {
  _EmergencyResponsesProviderElement(super.provider);

  @override
  int get emergencyId => (origin as EmergencyResponsesProvider).emergencyId;
  @override
  int get captainId => (origin as EmergencyResponsesProvider).captainId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
