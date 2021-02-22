import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../models/Recipe.dart';

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, "recipe.db"),
        onCreate: (db, version) {
      return db.execute("""
        CREATE TABLE favourite_recipes(
          id INTEGER PRIMARY KEY,
          imageUrl TEXT,
          title TEXT
        );
        """);
    }, version: 1);
  }

  static Future<void> insert(Recipe recipe) async {
    final database = await DBHelper.database();
    database.rawInsert('''
      INSERT INTO favourite_recipes(id, imageUrl, title) VALUES(
        ${recipe.id},
        "${recipe.imageUrl}",
        "${recipe.title}"
      )
      ''');
  }

  static Future<void> delete(int id) async {
    final database = await DBHelper.database();
    database.rawDelete('''
      DELETE FROM favourite_recipe WHERE id = ?
      ''', [id]);
  }
}
