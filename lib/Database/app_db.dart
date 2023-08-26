import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'entity.dart';
part 'app_db.g.dart';

LazyDatabase _openDbConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'employee.sqlite'));
    return NativeDatabase(file);
  });
}

abstract class TodosView extends View {
  Todos get todo;
  Detail get details;

  //when using join adding this is important expression here for getting common data
  //from productid from both table
  Expression<String> get dataTodoView =>
      todo.title + const Constant('(') + details.name + const Constant(')');

  @override
  Query as() =>
      select([todo.title, todo.description, details.productID, details.name])
          .from(todo)
          .join([innerJoin(details, details.productID.equalsExp(todo.id))]);
}

@DriftDatabase(tables: [Todos, Detail], views: [TodosView])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openDbConnection());

  @override
  int get schemaVersion => 1;

  //trying to watch data
  Stream<List<Todo>> get allTodoItemsWatch => select(todos).watch();
  Stream<List<Details>> get alldetailsItemsWatch => select(detail).watch();
}
