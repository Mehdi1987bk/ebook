
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:kango/domain/bd/book_dao.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [BookEntity])
abstract class FlutterDatabase extends FloorDatabase {
  BookDao get bookDao;
}