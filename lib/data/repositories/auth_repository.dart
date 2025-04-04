import 'package:sqflite/sqflite.dart';
import '../database/auth_database.dart';
import '../models/user_model.dart';

class AuthRepository {
  Future<int> registerUser(User user) async {
    final db = await AuthDatabase.instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String email, String password) async {
    final db = await AuthDatabase.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
