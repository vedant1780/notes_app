import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper getInstance = DBHelper._();
  static final String TABLE_NOTE = "note";
  static final String COLUMN_NOTE = "s_no";
  static final String COLUMN_NOTE_TITLE = "title";
  static final String COLUMN_NOTE_DESC = "description";

  //open db
  Database? myDB;

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
    // if(myDB!=null)
    //   {
    //     return myDB!;
    //   }
    // else
    //   {
    //     myDB=await openDB();
    //     return myDB!;
    //   }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");
    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        //create all tables
        db.execute(
          "create table $TABLE_NOTE ($COLUMN_NOTE integer primary key autoincrement,$COLUMN_NOTE_TITLE text,$COLUMN_NOTE_DESC text)",
        );
      },
      version: 1,
    );
  }

  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsAffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
    });
    return rowsAffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  Future<bool> updateNote({
    required String title,
    required String desc,
    required int s_no,
  }) async {
    var db = await getDB();
    int rowsAffected = await db.update(
      TABLE_NOTE,
      {
        COLUMN_NOTE_TITLE: title,
        COLUMN_NOTE_DESC: desc,
      },
      where: "$COLUMN_NOTE = ?",
      whereArgs: [s_no],
    );
    return rowsAffected > 0;
  }
  Future<bool> deleteNote({required int sno}) async{
    var db=await getDB();
    int RowsAffected=await db.delete(TABLE_NOTE,where: "$COLUMN_NOTE= ?",whereArgs:['$sno'] );
    return RowsAffected>0;
  }
}
