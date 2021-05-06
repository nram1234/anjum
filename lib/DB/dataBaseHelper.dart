import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DataBaseHelper{
  DataBaseHelper._();
  static Database _database;
  Future<Database>get database async{
    if (_database !=null)return _database;
    _database=await initDb();
    return _database;
  }
  initDb()async{
    String path=join(await getDatabasesPath(),"anjum.db");
    openDatabase(path,version: 1,onCreate: (Database db,int version)async{






      await db.execute( '''
      
CREATE TABLE  admins (
  id INTEGER PRIMARY KEY AUTOINCREMENT ,
   admin_type  TEXT NOT NULL DEFAULT 'sub_admin',
   name   TEXT NOT NULL,
   email   TEXT NOT NULL,
   phone_no   TEXT NOT NULL,
   image   TEXT NOT NULL,
   password   TEXT NOT NULL,
  decoded_password   TEXT ,
   remember_token   TEXT ,
   status  TEXT NOT NULL DEFAULT 'active',
   created_at  INTEGER  NOT NULL ,
   updated_at   INTEGER  NOT NULL
) 
      ''');
    });
  }
}












