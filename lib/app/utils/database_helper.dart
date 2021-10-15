import 'package:path/path.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static Database? _database;

  static Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDatabase();
    }

    return _database!;
  }

  static const _tableName = 'favorite_restaurants';
  static get tableName => _tableName;

  static Future<Database> _initializeDatabase() async {
    var path = await getDatabasesPath();

    var db = await openDatabase(
      join(path, 'favorite_restaurant_db.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableName (
          id TEXT,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating FLOAT
        )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    var db = await database;

    List<Map<String, dynamic>> res = await db.query(_tableName);

    return res.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<void> addToFavorite(Restaurant restaurant) async {
    var db = await database;

    await db.insert(_tableName, restaurant.toJson());
  }

  Future<void> removeFromFavorite(String id) async {
    var db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
