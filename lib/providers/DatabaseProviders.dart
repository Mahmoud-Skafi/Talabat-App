// import 'package:FlutterCourseProject/Models/MenuItem.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseProvider {
//   DatabaseProvider._();

//   static final DatabaseProvider db = DatabaseProvider._();
//   static final int version = 1;
//   static Database _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       print("database Already Exists");
//       return _database;
//     }
//     _database = await initDB();
//     return _database;
//   }

//   Future<Database> initDB() async {
//     String path = await getDatabasesPath();
//     path += 'menuItemsTable.db';

//     // print("Dropping DATABASE !");
//     // Database db = await openDatabase(path,version: version, onCreate: (x, y) async {});
//     // await db.execute("DROP TABLE IF EXISTS menuItems");

//     print("Initiating Database...");
//     return await openDatabase(
//       path,
//       version: version,
//       onCreate: (db, version) async {
//         print('Creating the database for the first time!');
//         await db
//             .execute('''
//           create table menuItemsTable (
//             id integer primary key autoincrement,
//             restId integer ,
//             rating integer ,
//             name text not null,
//             image text not null,
//             description text not null,
//             price integer not null
//           )
//           ''')
//             .then((value) => print("Finished Initiating ORDERED Database..."))
//             .catchError((e) => print('Error Creating ORDERED Database...'));
//         await db
//             .execute('''
//           create table favoritesTable (
//             id integer primary key autoincrement,
//             restId integer ,
//             rating integer ,
//             name text not null,
//             image text not null,
//             description text not null,
//             price integer not null
//           )
//           ''')
//             .then((value) => print("Finished Initiating FAVORITES Database..."))
//             .catchError((e) => print('Error Creating FAVORITES Database...'));
//       },
//     );
//   }
