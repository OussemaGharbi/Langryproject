import 'package:landryproject/models/card_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:landryproject/constants/constants.dart';

class CardDataBaseHelper {
  CardDataBaseHelper._();
  static final CardDataBaseHelper db = CardDataBaseHelper._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }


  initDb() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(''' 
    CREATE TABLE $tableCard(
      $columnName TEXT,
      $columnImage TEXT ,
      $columnQuantity INTEGER ,
      $columnPrice INTEGER )
     ''');
        });
  }

  insert(CardModel model) async {
    var dbClient = await database;
    await dbClient!.insert(
      tableCard,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(model.name);

  }

  Future <List<CardModel>> getAll() async{
    var dbClient = await database;
    List <Map> maps = await dbClient!.query(tableCard);

    List <CardModel> list = maps.isNotEmpty ? maps.map((e) => CardModel.fromJson(e)).toList() : [];

    return list;
  }
}