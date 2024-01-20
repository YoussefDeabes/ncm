import 'dart:async';
import 'dart:io';


import 'package:ncm/api/helpers/climate_data_request_form_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ncm.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const varcharType = 'TEXT';
    const textType = 'TEXT';
    const tinyIntType = 'INTEGER';
    const double = 'REAL';
    const intType = 'INTEGER';
    // const foreinKeyType = 'INTEGER FOREIGN KEY';

    await db.execute('''
    CREATE TABLE "$climateDataRequestForm" (
    "${ClimateFields.id}" $idType,
    "${ClimateFields.weatherStationUnderConstruction}" $intType,
    "${ClimateFields.listOfWeatherStations}" $intType,
    "${ClimateFields.stationClassification}" $textType,
    "${ClimateFields.stationClass}" $textType,
    "${ClimateFields.proposedStationLocation}"$textType,
    "${ClimateFields.latitude}" $double,
    "${ClimateFields.longitude}" $double,
    "${ClimateFields.ownership}" $intType,
    "${ClimateFields.rent}" $intType,
    "${ClimateFields.stationType}" $intType,
    "${ClimateFields.stationAddress}" $textType,
    "${ClimateFields.delegateName}" $textType,
    "${ClimateFields.idNumber}" $textType,
    "${ClimateFields.authorizationReferenceNumber}" $tinyIntType,
    )
    ''');

    await db.execute('''
     CREATE TABLE "$files" (
     "${ClimateFields.id}" $idType,
     "${ClimateFields.path}" $varcharType,
     "${ClimateFields.climateId}" $intType,
     FOREIGN KEY (${ClimateFields.climateId}) REFERENCES $climateDataRequestForm (${ClimateFields.id})
     )
     ''');
  }

  Future<ClimateDataRequestFormModel> createForm(ClimateDataRequestFormModel data,
      {List<File>? files}) async {
    final db = await instance.database;

    final id = await db.insert(climateDataRequestForm, data.toJson()).then((value) async {
      Files? filesList = Files();
      if (files != null && files.isNotEmpty) {
        for (int i = 0; i < files.length; i++) {
          filesList.climateId = value;
          filesList.path = files[i].path;
          await createFormFiles(filesList);
        }
      }
    });
    return data.copy(id: id);
  }

  Future<Files> createFormFiles(Files data) async {
    final db = await instance.database;

    final id = await db.insert(files, data.toJson());
    return data.copy(id: id);
  }

  Future<ClimateDataRequestFormModel> readForm(int id) async {
    final db = await instance.database;

    final maps = await db.query(climateDataRequestForm,
        columns: ClimateFields.formValues,
        where: '${ClimateFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return ClimateDataRequestFormModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }


  Future<List<Files>?> readFiles(int id) async {
    final db = await instance.database;

    final maps = await db.query(files,
        columns: ClimateFields.filesValues,
        where: '${ClimateFields.climateId} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return maps.map((json) => Files.fromJson(json)).toList();
    } else {
      print('ID $id not found');
      return null;
    }
  }

  Future<List<ClimateDataRequestFormModel>> readAllFormData() async {
    final db = await instance.database;

    final result = await db.query(climateDataRequestForm, orderBy: "id DESC");
    return result.map((json) => ClimateDataRequestFormModel.fromJson(json)).toList();
  }

  Future<List<Files>> realAllFilesData() async {
    final db = await instance.database;
    final result = await db.query(files);
    return result.map((json) => Files.fromJson(json)).toList();
  }

  Future<int> updateForm(ClimateDataRequestFormModel form) async {
    final db = await instance.database;
    return db.update(
      climateDataRequestForm,
      form.toJson(),
      where: '${ClimateFields.id} = ?',
      whereArgs: [form.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      climateDataRequestForm,
      where: '${ClimateFields.id} = ?',
      whereArgs: [id],
    );
  }

// Future close() async {
//   final db = await instance.database;
//   db.close();
// }
}