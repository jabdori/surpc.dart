import 'package:surrealdb/surrealdb.dart';

abstract class SurrealDBClientInterface {
  Future<void> connect({required String host, int? port, bool secure});

  Future<void> ping({Duration duration});

  Future<void> use({required String ns, required String db});

  Future<T> info<T>({FromJson<T>? fromJson});

  Future<Token> signUp(
      {String? sc, String? user, String? pass, DataMap? options});

  Future<Token> signIn(
      {String? sc, String? user, String? pass, DataMap? options});

  Future<void> authenticate(Token token);

  Future<void> invalidate();

  Future<void> set({required String key, required dynamic value});

  Future<void> unset({required String key});

  Future<void> live({required String table});

  Future<LiveQuery> liveQuery(String liveQuery, {DataMap? vars});

  Future<List<Object?>> query(String query, {DataMap? vars});

  Future<T> select<T, TT>(String path, {FromJson<TT>? fromJson});

  Future<T> create<T>(String path, {DataMap? data, FromJson<T>? fromJson});

  Future<List<T>> insert<T>(String path,
      {List<DataMap>? data, FromJson<T>? fromJson});

  Future<List<T>> update<T>(String path, DataMap data, {FromJson<T>? fromJson});

  Future<List<T>> merge<T>(String path, DataMap data, {FromJson<T>? fromJson});

  Future<T> patch<T>({required String path});

  Future<T> delete<T>(String path);
}
