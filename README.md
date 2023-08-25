## Drift Example Flutter

# Getting Started

# Add these Dependecies First
1. dependencies:
   drift: ^2.11.0
   path: ^1.8.3
   path_provider: ^2.1.0
   sqlite3_flutter_libs: ^0.5.15


2. dev_dependencies:
   build_runner: ^2.4.6
   drift_dev:


#  CODE FOR DATABASE TABLE 

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


## before using command to generate data You need to add first 
   1. import part 'database.g.dart';
    and 
   2. @DriftDatabase(tables: [Todos], views: [TodosView])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
## run the command 
    dart pub run build_runner build


