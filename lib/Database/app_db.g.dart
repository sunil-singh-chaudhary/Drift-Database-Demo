// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, description];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String description;
  const Todo(
      {required this.id, required this.title, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
    };
  }

  Todo copyWith({int? id, String? title, String? description}) => Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? description}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $DetailTable extends Detail with TableInfo<$DetailTable, Details> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIDMeta =
      const VerificationMeta('productID');
  @override
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
      'product_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, productID];
  @override
  String get aliasedName => _alias ?? 'detail';
  @override
  String get actualTableName => 'detail';
  @override
  VerificationContext validateIntegrity(Insertable<Details> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('product_i_d')) {
      context.handle(
          _productIDMeta,
          productID.isAcceptableOrUnknown(
              data['product_i_d']!, _productIDMeta));
    } else if (isInserting) {
      context.missing(_productIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Details map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Details(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      productID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_i_d'])!,
    );
  }

  @override
  $DetailTable createAlias(String alias) {
    return $DetailTable(attachedDatabase, alias);
  }
}

class Details extends DataClass implements Insertable<Details> {
  final int id;
  final String name;
  final int productID;
  const Details(
      {required this.id, required this.name, required this.productID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['product_i_d'] = Variable<int>(productID);
    return map;
  }

  DetailCompanion toCompanion(bool nullToAbsent) {
    return DetailCompanion(
      id: Value(id),
      name: Value(name),
      productID: Value(productID),
    );
  }

  factory Details.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Details(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      productID: serializer.fromJson<int>(json['productID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'productID': serializer.toJson<int>(productID),
    };
  }

  Details copyWith({int? id, String? name, int? productID}) => Details(
        id: id ?? this.id,
        name: name ?? this.name,
        productID: productID ?? this.productID,
      );
  @override
  String toString() {
    return (StringBuffer('Details(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('productID: $productID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, productID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Details &&
          other.id == this.id &&
          other.name == this.name &&
          other.productID == this.productID);
}

class DetailCompanion extends UpdateCompanion<Details> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> productID;
  const DetailCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.productID = const Value.absent(),
  });
  DetailCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int productID,
  })  : name = Value(name),
        productID = Value(productID);
  static Insertable<Details> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? productID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (productID != null) 'product_i_d': productID,
    });
  }

  DetailCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? productID}) {
    return DetailCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      productID: productID ?? this.productID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (productID.present) {
      map['product_i_d'] = Variable<int>(productID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('productID: $productID')
          ..write(')'))
        .toString();
  }
}

class TodosViewData extends DataClass {
  final String title;
  final String description;
  final int productID;
  final String name;
  const TodosViewData(
      {required this.title,
      required this.description,
      required this.productID,
      required this.name});
  factory TodosViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodosViewData(
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      productID: serializer.fromJson<int>(json['productID']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'productID': serializer.toJson<int>(productID),
      'name': serializer.toJson<String>(name),
    };
  }

  TodosViewData copyWith(
          {String? title, String? description, int? productID, String? name}) =>
      TodosViewData(
        title: title ?? this.title,
        description: description ?? this.description,
        productID: productID ?? this.productID,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TodosViewData(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('productID: $productID, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, description, productID, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodosViewData &&
          other.title == this.title &&
          other.description == this.description &&
          other.productID == this.productID &&
          other.name == this.name);
}

class $TodosViewView extends ViewInfo<$TodosViewView, TodosViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDatabase attachedDatabase;
  $TodosViewView(this.attachedDatabase, [this._alias]);
  $TodosTable get todo => attachedDatabase.todos.createAlias('t0');
  $DetailTable get details => attachedDatabase.detail.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [title, description, productID, name];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'todos_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $TodosViewView get asDslTable => this;
  @override
  TodosViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodosViewData(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      productID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_i_d'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      generatedAs: GeneratedAs(todo.title, false), type: DriftSqlType.string);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      generatedAs: GeneratedAs(todo.description, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
      'product_i_d', aliasedName, false,
      generatedAs: GeneratedAs(details.productID, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(details.name, false), type: DriftSqlType.string);
  @override
  $TodosViewView createAlias(String alias) {
    return $TodosViewView(attachedDatabase, alias);
  }

  @override
  Query? get query => (attachedDatabase.selectOnly(todo)..addColumns($columns))
      .join([innerJoin(details, details.productID.equalsExp(todo.id))]);
  @override
  Set<String> get readTables => const {'todos', 'detail'};
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodosTable todos = $TodosTable(this);
  late final $DetailTable detail = $DetailTable(this);
  late final $TodosViewView todosView = $TodosViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [todos, detail, todosView];
}
