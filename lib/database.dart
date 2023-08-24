import 'package:drift/drift.dart';
part 'database.g.dart';

@DataClassName('Todo')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
}

abstract class TodosView extends View {
  Todos get todo;
  @override
  Query as() => select([todo.title, todo.description]).from(todo);
}

@DriftDatabase(tables: [Todos], views: [TodosView])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
