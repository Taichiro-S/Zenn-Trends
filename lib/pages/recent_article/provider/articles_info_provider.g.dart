// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articlesInfoHash() => r'9b978590247577f06ecaf4355a14d65e292dc0a9';

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

/// See also [articlesInfo].
@ProviderFor(articlesInfo)
const articlesInfoProvider = ArticlesInfoFamily();

/// See also [articlesInfo].
class ArticlesInfoFamily extends Family<AsyncValue<List<ArticlesInfo>>> {
  /// See also [articlesInfo].
  const ArticlesInfoFamily();

  /// See also [articlesInfo].
  ArticlesInfoProvider call({
    required String topicId,
  }) {
    return ArticlesInfoProvider(
      topicId: topicId,
    );
  }

  @override
  ArticlesInfoProvider getProviderOverride(
    covariant ArticlesInfoProvider provider,
  ) {
    return call(
      topicId: provider.topicId,
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
  String? get name => r'articlesInfoProvider';
}

/// See also [articlesInfo].
class ArticlesInfoProvider
    extends AutoDisposeFutureProvider<List<ArticlesInfo>> {
  /// See also [articlesInfo].
  ArticlesInfoProvider({
    required String topicId,
  }) : this._internal(
          (ref) => articlesInfo(
            ref as ArticlesInfoRef,
            topicId: topicId,
          ),
          from: articlesInfoProvider,
          name: r'articlesInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articlesInfoHash,
          dependencies: ArticlesInfoFamily._dependencies,
          allTransitiveDependencies:
              ArticlesInfoFamily._allTransitiveDependencies,
          topicId: topicId,
        );

  ArticlesInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.topicId,
  }) : super.internal();

  final String topicId;

  @override
  Override overrideWith(
    FutureOr<List<ArticlesInfo>> Function(ArticlesInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArticlesInfoProvider._internal(
        (ref) => create(ref as ArticlesInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        topicId: topicId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArticlesInfo>> createElement() {
    return _ArticlesInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticlesInfoProvider && other.topicId == topicId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, topicId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArticlesInfoRef on AutoDisposeFutureProviderRef<List<ArticlesInfo>> {
  /// The parameter `topicId` of this provider.
  String get topicId;
}

class _ArticlesInfoProviderElement
    extends AutoDisposeFutureProviderElement<List<ArticlesInfo>>
    with ArticlesInfoRef {
  _ArticlesInfoProviderElement(super.provider);

  @override
  String get topicId => (origin as ArticlesInfoProvider).topicId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
