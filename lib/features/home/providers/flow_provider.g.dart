// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isCurrentFlowFinishedHash() =>
    r'1797759340686d21f5df3cede7bae0c28ea740e7';

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

/// See also [isCurrentFlowFinished].
@ProviderFor(isCurrentFlowFinished)
const isCurrentFlowFinishedProvider = IsCurrentFlowFinishedFamily();

/// See also [isCurrentFlowFinished].
class IsCurrentFlowFinishedFamily extends Family<bool> {
  /// See also [isCurrentFlowFinished].
  const IsCurrentFlowFinishedFamily();

  /// See also [isCurrentFlowFinished].
  IsCurrentFlowFinishedProvider call(String uuid) {
    return IsCurrentFlowFinishedProvider(uuid);
  }

  @override
  IsCurrentFlowFinishedProvider getProviderOverride(
    covariant IsCurrentFlowFinishedProvider provider,
  ) {
    return call(provider.uuid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isCurrentFlowFinishedProvider';
}

/// See also [isCurrentFlowFinished].
class IsCurrentFlowFinishedProvider extends AutoDisposeProvider<bool> {
  /// See also [isCurrentFlowFinished].
  IsCurrentFlowFinishedProvider(String uuid)
    : this._internal(
        (ref) => isCurrentFlowFinished(ref as IsCurrentFlowFinishedRef, uuid),
        from: isCurrentFlowFinishedProvider,
        name: r'isCurrentFlowFinishedProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$isCurrentFlowFinishedHash,
        dependencies: IsCurrentFlowFinishedFamily._dependencies,
        allTransitiveDependencies:
            IsCurrentFlowFinishedFamily._allTransitiveDependencies,
        uuid: uuid,
      );

  IsCurrentFlowFinishedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    bool Function(IsCurrentFlowFinishedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsCurrentFlowFinishedProvider._internal(
        (ref) => create(ref as IsCurrentFlowFinishedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsCurrentFlowFinishedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsCurrentFlowFinishedProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsCurrentFlowFinishedRef on AutoDisposeProviderRef<bool> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _IsCurrentFlowFinishedProviderElement
    extends AutoDisposeProviderElement<bool>
    with IsCurrentFlowFinishedRef {
  _IsCurrentFlowFinishedProviderElement(super.provider);

  @override
  String get uuid => (origin as IsCurrentFlowFinishedProvider).uuid;
}

String _$flowListHash() => r'db872cf3848c42e45af5fc80b8bb31540998cb20';

/// See also [FlowList].
@ProviderFor(FlowList)
final flowListProvider =
    AutoDisposeNotifierProvider<FlowList, List<Flow>>.internal(
      FlowList.new,
      name: r'flowListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$flowListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FlowList = AutoDisposeNotifier<List<Flow>>;
String _$currentFlowHash() => r'52c8c7c8bec2a0c8feb4e3cd971d13abea19ce76';

abstract class _$CurrentFlow extends BuildlessAutoDisposeNotifier<Flow> {
  late final String uuid;

  Flow build({required String uuid});
}

/// See also [CurrentFlow].
@ProviderFor(CurrentFlow)
const currentFlowProvider = CurrentFlowFamily();

/// See also [CurrentFlow].
class CurrentFlowFamily extends Family<Flow> {
  /// See also [CurrentFlow].
  const CurrentFlowFamily();

  /// See also [CurrentFlow].
  CurrentFlowProvider call({required String uuid}) {
    return CurrentFlowProvider(uuid: uuid);
  }

  @override
  CurrentFlowProvider getProviderOverride(
    covariant CurrentFlowProvider provider,
  ) {
    return call(uuid: provider.uuid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentFlowProvider';
}

/// See also [CurrentFlow].
class CurrentFlowProvider
    extends AutoDisposeNotifierProviderImpl<CurrentFlow, Flow> {
  /// See also [CurrentFlow].
  CurrentFlowProvider({required String uuid})
    : this._internal(
        () => CurrentFlow()..uuid = uuid,
        from: currentFlowProvider,
        name: r'currentFlowProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$currentFlowHash,
        dependencies: CurrentFlowFamily._dependencies,
        allTransitiveDependencies: CurrentFlowFamily._allTransitiveDependencies,
        uuid: uuid,
      );

  CurrentFlowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Flow runNotifierBuild(covariant CurrentFlow notifier) {
    return notifier.build(uuid: uuid);
  }

  @override
  Override overrideWith(CurrentFlow Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentFlowProvider._internal(
        () => create()..uuid = uuid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentFlow, Flow> createElement() {
    return _CurrentFlowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentFlowProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentFlowRef on AutoDisposeNotifierProviderRef<Flow> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _CurrentFlowProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentFlow, Flow>
    with CurrentFlowRef {
  _CurrentFlowProviderElement(super.provider);

  @override
  String get uuid => (origin as CurrentFlowProvider).uuid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
