import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:surrealdb/src/client_interface.dart';
import 'package:surrealdb/src/common/method.dart';
import 'package:surrealdb/src/common/models/receive.dart';
import 'package:surrealdb/src/common/models/send.dart';
import 'package:surrealdb/src/common/models/websocket_state.dart';
import 'package:surrealdb/src/common/typedefs.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// ignore: constant_identifier_names
const ERR = "ERR";

class SurrealDB implements SurrealDBClientInterface {
  ValueNotifier<WebsocketState> state =
      ValueNotifier(WebsocketState.disconnected);
  late final WebSocketChannel _channel;
  late final Stream _stream;

  Stream get stream => _stream;

  String? _ns;
  String? _db;
  String? _sc;

  DataMap get _meta => {
        if (_ns != null) 'ns': _ns,
        if (_db != null) 'db': _db,
        if (_sc != null) 'sc': _sc,
      };

  @override
  Future<void> connect(
      {required String host, int? port, bool secure = false}) async {
    state.value = WebsocketState.connecting;

    _channel = WebSocketChannel.connect(
      Uri.parse('${secure ? 'wss://' : 'ws://'}$host:$port/rpc'),
    );

    debugPrint(
        'WebSocketUri: ${Uri.parse('${secure ? 'wss://' : 'ws://'}$host:$port/rpc')}');

    await _channel.ready.then(
      (value) => state.value = WebsocketState.connected,
      onError: (error) {
        state.value = WebsocketState.disconnected;
        throw Exception('Failed to connect to SurrealDB: $error');
      },
    );

    _stream = _channel.stream.asBroadcastStream();
  }

  StreamSubscription<Receive> listen(void Function(Receive) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _stream.map((event) => Receive.fromJson(jsonDecode(event))).listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
  }

  @override
  Future<void> ping({
    bool periodic = false,
    Duration duration = const Duration(milliseconds: 30000),
  }) async {
    Timer.periodic(duration, (timer) {
      final send = Send(method: Method.ping);

      asyncReceive(send);
      if (!periodic) {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> authenticate(Token token) {
    final params = [token];
    final send = Send(method: Method.authenticate, params: params);
    return asyncReceive(send).then((value) {
      if (value.error != null) {
        throw Exception(value.error);
      }
    });
  }

  @override
  Future<T> create<T>(String path,
      {DataMap? data, FromJson<T>? fromJson}) async {
    final params = [
      path,
      data,
    ];
    final send = Send(method: Method.create, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      // recv.result가 List일 경우
      if (recv.result is List) {
        // T가 List의 구체적인 타입이라고 가정하고 처리
        return (recv.result as List)
            .map((e) => fromJson(e as DataMap))
            .toList()
            .first;
      } else {
        return fromJson(recv.result as DataMap);
      }
    }
    return recv.result as T;
  }

  @override
  Future<T> delete<T>(String path, {FromJson<T>? fromJson}) async {
    final params = [path];
    final send = Send(method: Method.delete, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      return fromJson(recv.result as DataMap);
    }
    return recv.result as T;
  }

  @override
  Future<T> info<T>({FromJson<T>? fromJson}) async {
    final send = Send(method: Method.info);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      return fromJson(recv.result as DataMap);
    }
    return recv.result as T;
  }

  @override
  Future<List<T>> insert<T>(
    String path, {
    List<DataMap>? data,
    FromJson<T>? fromJson,
  }) async {
    final params = [
      path,
      data,
    ];
    final send = Send(method: Method.insert, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      // recv.result List 경우
      if (recv.result is List) {
        // T가 List 구체적인 타입이라고 가정하고 처리
        return (recv.result as List)
            .map((e) => fromJson(e as DataMap))
            .toList();
      }
    }
    return recv.result as List<T>;
  }

  @override
  Future<void> invalidate() {
    final send = Send(method: Method.invalidate);
    return asyncReceive(send).then((value) {
      if (value.error != null) {
        throw Exception(value.error);
      }
    });
  }

  @override
  Future<void> live({required String table}) {
    // TODO: implement live
    throw UnimplementedError();
  }

  @override
  Future<LiveQuery> liveQuery(String liveQuery, {DataMap? vars}) async {
    final recv = await query(liveQuery, vars: vars);
    return LiveQuery.create(recv.first as String, surrealDB: this);
  }

  @override
  Future<List<T>> merge<T>(String path, DataMap data,
      {FromJson<T>? fromJson}) async {
    final params = [
      path,
      data,
    ];
    final send = Send(method: Method.merge, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      if (recv.result is List) {
        return (recv.result as List)
            .map((e) => fromJson(e as DataMap))
            .toList();
      } else {
        return [fromJson(recv.result as DataMap)];
      }
    }
    return recv.result as List<T>;
  }

  @override
  Future<T> patch<T>({required String path}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<List<Object?>> query(String query, {DataMap? vars}) async {
    final params = [
      queryTidy(query),
      if (vars != null) vars,
    ];
    final send = Send(method: Method.query, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    final results =
        (recv.result as List).map((e) => Receive.fromJson(e)).toList();
    final errors =
        results.where((e) => e.error != null || e.status == ERR).toList();
    if (errors.isNotEmpty) {
      throw Exception(errors);
    }
    return results.map((e) => e.result).toList();
  }

  @override
  Future<T> select<T, TT>(String path, {FromJson<TT>? fromJson}) async {
    final params = [
      path,
    ];
    final send = Send(method: Method.select, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      // recv.result가 List일 경우
      if (recv.result is List) {
        // T가 List의 구체적인 타입이라고 가정하고 처리
        return (recv.result as List).map((e) => fromJson(e as DataMap)).toList()
            as T;
      } else {
        // T가 List가 아닌 경우
        return [fromJson(recv.result as DataMap)] as T;
      }
    } else {
      return recv.result as T;
    }
  }

  @override
  Future<void> set({required String key, required value}) {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<Token> signIn(
      {String? sc, String? user, String? pass, DataMap? options}) async {
    final Object params = [
      {
        ..._meta,
        if (sc != null) 'sc': sc,
        if (user != null) 'user': user,
        if (pass != null) 'pass': pass,
        ...?options, // data가 null이 아닐 경우 내용을 여기에 추가합니다.
      }
    ];
    final send = Send(method: Method.signin, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }
    return recv.result! as Token;
  }

  @override
  Future<Token> signUp(
      {String? sc, String? user, String? pass, DataMap? options}) async {
    final Object params = [
      {
        ..._meta,
        if (sc != null) 'sc': sc,
        if (user != null) 'user': user,
        if (pass != null) 'pass': pass,
        ...?options,
      }
    ];
    final send = Send(method: Method.signup, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }
    return recv.result! as Token;
  }

  @override
  Future<void> unset({required String key}) {
    // TODO: implement unset
    throw UnimplementedError();
  }

  @override
  Future<List<T>> update<T>(
    String path,
    DataMap data, {
    FromJson<T>? fromJson,
  }) async {
    final params = [
      path,
      data,
    ];
    final send = Send(method: Method.update, params: params);
    final recv = await asyncReceive(send);
    if (recv.error != null) {
      throw Exception(recv.error);
    }

    if (fromJson != null) {
      if (recv.result is List) {
        return (recv.result as List)
            .map((e) => fromJson(e as DataMap))
            .toList();
      } else {
        return [fromJson(recv.result as DataMap)];
      }
    }
    return recv.result as List<T>;
  }

  @override
  Future<void> use({required String ns, required String db}) async {
    final params = [
      ns,
      db,
    ];
    final send = Send(method: Method.use, params: params);
    final receive = await asyncReceive(send);
    if (receive.error != null) {
      _ns = null;
      _db = null;
      throw Exception(receive.error);
    }
    _ns = ns;
    _db = db;
  }

  Future<Receive> asyncReceive(Send send) async {
    final futureReply = _replyMessage(send.id!);
    _channel.sink.add(jsonEncode(send.toJson()));
    try {
      final receive = await futureReply;
      return receive;
    } catch (error) {
      rethrow;
    }
  }

  Future<Receive> _replyMessage<T>(ID id) async {
    var completer = Completer<Receive>();
    StreamSubscription<dynamic>? subscription;
    subscription = _stream.where((msg) {
      final receive = Receive.fromJson(jsonDecode(msg));
      return receive.id == id;
    }).listen(
      (msg) {
        final receive = Receive.fromJson(jsonDecode(msg));
        if (!completer.isCompleted) {
          completer.complete(receive);
        }
        subscription!.cancel();
      },
      onError: completer.completeError,
      onDone: () {
        if (!completer.isCompleted) {
          completer.completeError(
              Exception('Stream completed without finding the message'));
        }
      },
    );

    return completer.future;
  }
}

class LiveQuery {
  final ID id;
  final String? query;
  late SurrealDB _surrealDB;
  late final StreamSubscription _subscription;

  LiveQuery({required this.id, this.query, required SurrealDB surrealDB}) {
    _surrealDB = surrealDB;
  }

  factory LiveQuery.create(
    String id, {
    required SurrealDB surrealDB,
  }) {
    return LiveQuery(id: id, surrealDB: surrealDB);
  }

  void listen<T>(void Function(LiveAction action, T data) callback,
      {List<LiveAction>? allowActions, FromJson<T>? fromJson, debug = false}) {
    _subscription = _surrealDB.stream.where((msg) {
      try {
        final receive = Receive.fromJson(jsonDecode(msg));
        final receiveResult = Receive.fromJson(receive.result! as DataMap);
        return receiveResult.id == id;
      } catch (error) {
        return false;
      }
    }).listen((msg) {
      final receive = Receive.fromJson(jsonDecode(msg));
      final receiveResult = Receive.fromJson(receive.result as DataMap);

      if (allowActions != null && allowActions.contains(receiveResult.action)) {
        if (fromJson != null) {
          callback(
              receiveResult.action!, fromJson(receiveResult.result as DataMap));
        } else {
          callback(receiveResult.action!, receiveResult.result as T);
        }
      } else if (allowActions == null) {
        if (fromJson != null) {
          callback(
              receiveResult.action!, fromJson(receiveResult.result as DataMap));
        } else {
          callback(receiveResult.action!, receiveResult.result as T);
        }
      }
    });
  }

  Future<void> kill() async {
    final params = [id];
    final send = Send(method: Method.kill, params: params);
    return _surrealDB.asyncReceive(send).then((value) {
      if (value.error != null) {
        throw Exception(value.error);
      }
      _subscription.cancel();
    });
  }
}

class TransactionQuery {
  static const String _begin = 'BEGIN TRANSACTION';
  static const String _commit = 'COMMIT TRANSACTION';
  final List<String> _queries = [];
  final DataMap _vars = {};

  void query(String query, {DataMap? vars}) {
    _queries.add(query);
    if (vars != null) {
      _vars.addAll(vars);
    }
  }

  String queries(void Function(TransactionQuery tx) callback) {
    callback(this);
    return toString();
  }

  DataMap get vars => _vars;

  @override
  String toString() {
    _queries.insert(0, _begin);
    _queries.add(_commit);
    final query = _queries.join(';');
    return queryTidy(query);
  }
}

String queryTidy(String query) {
  if (!query.endsWith(';')) {
    query += ';';
  }
  if (query.startsWith(' ')) {
    query = query.trimLeft();
  }
  query = query.replaceAll(RegExp(r'\s{2,}'), ' ');
  query = query.replaceAll(RegExp(r';{2,}'), ';');
  return query;
}
