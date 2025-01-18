// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookDetailHash() => r'7af1003f4b7c3204b554d367be55b42b3331e0ba';

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

/// See also [bookDetail].
@ProviderFor(bookDetail)
const bookDetailProvider = BookDetailFamily();

/// See also [bookDetail].
class BookDetailFamily extends Family<Book?> {
  /// See also [bookDetail].
  const BookDetailFamily();

  /// See also [bookDetail].
  BookDetailProvider call({
    required int index,
  }) {
    return BookDetailProvider(
      index: index,
    );
  }

  @override
  BookDetailProvider getProviderOverride(
    covariant BookDetailProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'bookDetailProvider';
}

/// See also [bookDetail].
class BookDetailProvider extends AutoDisposeProvider<Book?> {
  /// See also [bookDetail].
  BookDetailProvider({
    required int index,
  }) : this._internal(
          (ref) => bookDetail(
            ref as BookDetailRef,
            index: index,
          ),
          from: bookDetailProvider,
          name: r'bookDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookDetailHash,
          dependencies: BookDetailFamily._dependencies,
          allTransitiveDependencies:
              BookDetailFamily._allTransitiveDependencies,
          index: index,
        );

  BookDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    Book? Function(BookDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookDetailProvider._internal(
        (ref) => create(ref as BookDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Book?> createElement() {
    return _BookDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BookDetailRef on AutoDisposeProviderRef<Book?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _BookDetailProviderElement extends AutoDisposeProviderElement<Book?>
    with BookDetailRef {
  _BookDetailProviderElement(super.provider);

  @override
  int get index => (origin as BookDetailProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
