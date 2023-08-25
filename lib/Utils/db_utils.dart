import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

import '../Database/app_db.dart';
import '../Database/dbhelper.dart';

void openDialog(
    {required BuildContext context,
    required bool isUpdate,
    required DatabaseHelper? db,
    required VoidCallback callback,
    Todo? list}) {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  if (isUpdate) {
    nameController.text = list!.title;
    descriptionController.text = list.description;
  }
  //set default vaule
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Save button action here
              String name = nameController.text;
              debugPrint('name is $name');
              String description = descriptionController.text;

              if (isUpdate) {
                final entity = TodosCompanion(
                  id: drift.Value(list!.id), //ID IS IMPOrtant to update here
                  title: drift.Value(name),
                  description: drift.Value(description),
                );

                // Update existing record
                db!.updateTodoTable(entity);
              } else {
                final entity = TodosCompanion(
                  title: drift.Value(name),
                  description: drift.Value(description),
                );

                // Insert new record
                db!.insertIntoDatabaseData(entity);
              }

              //INSERT INTO DATABASE AND REBUILD IT
              callback();

              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
