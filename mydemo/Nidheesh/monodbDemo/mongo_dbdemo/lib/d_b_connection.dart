import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db;

class DBConnection {
  late DBConnection instance;

  final String _host = "localhost";
  final String _port = "27017";
  final String _dbName = "debtservice";
  late Db _db;

  getInstance() {
    return instance;
  }

  Future<Db> getConnection() async {
    if (_db == null) {
      try {
        _db = Db(_getConnectionString());
        await _db.open();
      } catch (e) {
        if (kDebugMode) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }
    return _db;
  }

  _getConnectionString() {
    return "mongodb://192.168.1.44:5000/api/v1/bookings";
  }

  closeConnection() {
    _db.close();
  }
}
