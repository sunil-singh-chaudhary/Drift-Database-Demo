import 'package:flutter/material.dart';

import 'app_db.dart';

class DatabaseHelper {
  AppDatabase _db;
  DatabaseHelper(this._db);

  Future<List<Todo>> getDatabaseData() async {
    final id = await _db.into(_db.todos).insert(TodosCompanion.insert(
          title: ' TODO TABLE',
          description: "First desc ",
        ));

    await _db.into(_db.detail).insert(DetailCompanion.insert(
          name: ' DETAIL TABLE',
          productID: id,
        ));

    return await _db.select(_db.todos).get();
  }

  Future<List<Details>> getDetailsData() async {
    var da = await _db.select(_db.todosView).get();
    debugPrint('join data - $da');

    return await _db.select(_db.detail).get();
  }

  Future<List<Todo>> getAllTodos() async {
    return await _db.select(_db.todos).get();
  }

  Future<Todo> getTodoWithID(int id) async {
    return await (_db.select(_db.todos)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateTodoTable(TodosCompanion entity) async {
    return await _db.update(_db.todos).replace(entity);
  }

  Future<int> insertIntoTodo(TodosCompanion entity) async {
    return await _db.into(_db.todos).insert(entity);
  }

  Future<int> deleteTodo(int id) async {
    return await (_db.delete(_db.todos)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<int> drop() async {
    return await (_db.delete(_db.todos)).go();
  }
}
