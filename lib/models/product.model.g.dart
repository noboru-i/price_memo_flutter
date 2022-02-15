// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GroupCollectionReference
    implements GroupQuery, FirestoreCollectionReference<GroupQuerySnapshot> {
  factory GroupCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GroupCollectionReference;

  static Group fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$GroupFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Group value,
    SetOptions? options,
  ) {
    return _$GroupToJson(value);
  }

  @override
  GroupDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GroupDocumentReference> add(Group value);
}

class _$GroupCollectionReference extends _$GroupQuery
    implements GroupCollectionReference {
  factory _$GroupCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GroupCollectionReference._(
      firestore.collection('groups').withConverter(
            fromFirestore: GroupCollectionReference.fromFirestore,
            toFirestore: GroupCollectionReference.toFirestore,
          ),
    );
  }

  _$GroupCollectionReference._(
    CollectionReference<Group> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Group> get reference =>
      super.reference as CollectionReference<Group>;

  @override
  GroupDocumentReference doc([String? id]) {
    return GroupDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GroupDocumentReference> add(Group value) {
    return reference.add(value).then((ref) => GroupDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GroupDocumentReference
    extends FirestoreDocumentReference<GroupDocumentSnapshot> {
  factory GroupDocumentReference(DocumentReference<Group> reference) =
      _$GroupDocumentReference;

  DocumentReference<Group> get reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  late final ProductCollectionReference products = _$ProductCollectionReference(
    reference,
  );

  @override
  Stream<GroupDocumentSnapshot> snapshots();

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
  });

  Future<void> set(Group value);
}

class _$GroupDocumentReference
    extends FirestoreDocumentReference<GroupDocumentSnapshot>
    implements GroupDocumentReference {
  _$GroupDocumentReference(this.reference);

  @override
  final DocumentReference<Group> reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  late final ProductCollectionReference products = _$ProductCollectionReference(
    reference,
  );

  @override
  Stream<GroupDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return GroupDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return GroupDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
    };

    return reference.update(json);
  }

  Future<void> set(Group value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class GroupDocumentSnapshot extends FirestoreDocumentSnapshot {
  GroupDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Group> snapshot;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Group? data;
}

abstract class GroupQuery implements QueryReference<GroupQuerySnapshot> {
  @override
  GroupQuery limit(int limit);

  @override
  GroupQuery limitToLast(int limit);

  GroupQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  GroupQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });
}

class _$GroupQuery extends QueryReference<GroupQuerySnapshot>
    implements GroupQuery {
  _$GroupQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Group> reference;

  GroupQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Group> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return GroupQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<GroupDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: GroupDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return GroupQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<GroupQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<GroupQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  GroupQuery limit(int limit) {
    return _$GroupQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  GroupQuery limitToLast(int limit) {
    return _$GroupQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  GroupQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GroupQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GroupQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GroupQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GroupQuerySnapshot
    extends FirestoreQuerySnapshot<GroupQueryDocumentSnapshot> {
  GroupQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Group> snapshot;

  @override
  final List<GroupQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GroupDocumentSnapshot>> docChanges;
}

class GroupQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements GroupDocumentSnapshot {
  GroupQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Group> snapshot;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(snapshot.reference);
  }

  @override
  final Group data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ProductCollectionReference
    implements
        ProductQuery,
        FirestoreCollectionReference<ProductQuerySnapshot> {
  factory ProductCollectionReference(
    DocumentReference<Group> parent,
  ) = _$ProductCollectionReference;

  static Product fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ProductFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Product value,
    SetOptions? options,
  ) {
    return _$ProductToJson(value);
  }

  /// A reference to the containing [GroupDocumentReference] if this is a subcollection.
  GroupDocumentReference get parent;

  @override
  ProductDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ProductDocumentReference> add(Product value);
}

class _$ProductCollectionReference extends _$ProductQuery
    implements ProductCollectionReference {
  factory _$ProductCollectionReference(
    DocumentReference<Group> parent,
  ) {
    return _$ProductCollectionReference._(
      GroupDocumentReference(parent),
      parent.collection('products').withConverter(
            fromFirestore: ProductCollectionReference.fromFirestore,
            toFirestore: ProductCollectionReference.toFirestore,
          ),
    );
  }

  _$ProductCollectionReference._(
    this.parent,
    CollectionReference<Product> reference,
  ) : super(reference, reference);

  @override
  final GroupDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Product> get reference =>
      super.reference as CollectionReference<Product>;

  @override
  ProductDocumentReference doc([String? id]) {
    return ProductDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ProductDocumentReference> add(Product value) {
    return reference.add(value).then((ref) => ProductDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ProductCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ProductDocumentReference
    extends FirestoreDocumentReference<ProductDocumentSnapshot> {
  factory ProductDocumentReference(DocumentReference<Product> reference) =
      _$ProductDocumentReference;

  DocumentReference<Product> get reference;

  /// A reference to the [ProductCollectionReference] containing this document.
  ProductCollectionReference get parent {
    return _$ProductCollectionReference(
      reference.parent.parent!.withConverter<Group>(
        fromFirestore: GroupCollectionReference.fromFirestore,
        toFirestore: GroupCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ProductDocumentSnapshot> snapshots();

  @override
  Future<ProductDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int latestPrice,
    String groupId,
    String? imagePath,
  });

  Future<void> set(Product value);
}

class _$ProductDocumentReference
    extends FirestoreDocumentReference<ProductDocumentSnapshot>
    implements ProductDocumentReference {
  _$ProductDocumentReference(this.reference);

  @override
  final DocumentReference<Product> reference;

  /// A reference to the [ProductCollectionReference] containing this document.
  ProductCollectionReference get parent {
    return _$ProductCollectionReference(
      reference.parent.parent!.withConverter<Group>(
        fromFirestore: GroupCollectionReference.fromFirestore,
        toFirestore: GroupCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ProductDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ProductDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ProductDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ProductDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
    Object? latestPrice = _sentinel,
    Object? groupId = _sentinel,
    Object? imagePath = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (latestPrice != _sentinel) "latestPrice": latestPrice as int,
      if (groupId != _sentinel) "groupId": groupId as String,
      if (imagePath != _sentinel) "imagePath": imagePath as String?,
    };

    return reference.update(json);
  }

  Future<void> set(Product value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ProductDocumentSnapshot extends FirestoreDocumentSnapshot {
  ProductDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Product> snapshot;

  @override
  ProductDocumentReference get reference {
    return ProductDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Product? data;
}

abstract class ProductQuery implements QueryReference<ProductQuerySnapshot> {
  @override
  ProductQuery limit(int limit);

  @override
  ProductQuery limitToLast(int limit);

  ProductQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ProductQuery whereLatestPrice({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  ProductQuery whereGroupId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ProductQuery whereImagePath({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  ProductQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  });

  ProductQuery orderByLatestPrice({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  });

  ProductQuery orderByGroupId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  });

  ProductQuery orderByImagePath({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  });
}

class _$ProductQuery extends QueryReference<ProductQuerySnapshot>
    implements ProductQuery {
  _$ProductQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Product> reference;

  ProductQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Product> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ProductQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ProductDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ProductDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ProductQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ProductQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ProductQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ProductQuery limit(int limit) {
    return _$ProductQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ProductQuery limitToLast(int limit) {
    return _$ProductQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ProductQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ProductQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ProductQuery whereLatestPrice({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ProductQuery(
      reference.where(
        'latestPrice',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ProductQuery whereGroupId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ProductQuery(
      reference.where(
        'groupId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ProductQuery whereImagePath({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ProductQuery(
      reference.where(
        'imagePath',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ProductQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ProductQuery(query, _collection);
  }

  ProductQuery orderByLatestPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('latestPrice', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ProductQuery(query, _collection);
  }

  ProductQuery orderByGroupId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('groupId', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ProductQuery(query, _collection);
  }

  ProductQuery orderByImagePath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ProductDocumentSnapshot? startAtDocument,
    ProductDocumentSnapshot? endAtDocument,
    ProductDocumentSnapshot? endBeforeDocument,
    ProductDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('imagePath', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ProductQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ProductQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ProductQuerySnapshot
    extends FirestoreQuerySnapshot<ProductQueryDocumentSnapshot> {
  ProductQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Product> snapshot;

  @override
  final List<ProductQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ProductDocumentSnapshot>> docChanges;
}

class ProductQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ProductDocumentSnapshot {
  ProductQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Product> snapshot;

  @override
  ProductDocumentReference get reference {
    return ProductDocumentReference(snapshot.reference);
  }

  @override
  final Product data;
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertProduct(Product instance) {
  const Min(0).validate(instance.latestPrice, "latestPrice");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      name: json['name'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'name': instance.name,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      latestPrice: json['latestPrice'] as int,
      groupId: json['groupId'] as String,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'latestPrice': instance.latestPrice,
    'groupId': instance.groupId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imagePath', instance.imagePath);
  return val;
}
