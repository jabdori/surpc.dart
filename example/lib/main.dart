import 'package:flutter/material.dart';
import 'dart:async';
import 'package:surrealdb/surrealdb.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String? id;
  final String? email;
  final String? name;
  final String? sub;
  final String? provider;

  User({
    this.id,
    this.email,
    this.name,
    this.sub,
    this.provider,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      sub: json['sub'] as String?,
      provider: json['provider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (sub != null) 'sub': sub,
      if (provider != null) 'provider': provider,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, sub: $sub, provider: $provider}';
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';
  final _surrealdbPlugin = SurrealDB();

  final Receive _receive = Receive(
    id: '1',
    action: DBAction.create,
    result: 'result',
    error: 'error',
    status: 'status',
    time: 'time',
  );

  @override
  void initState() {
    super.initState();

    debugPrint('Receive: ${_receive.toJson()}');
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      _surrealdbPlugin.state.addListener(() {
        debugPrint('State: ${_surrealdbPlugin.state.value}');
      });

      await _surrealdbPlugin.connect(host: '192.168.0.100', port: 8000);

      // _surrealdbPlugin.listen((receive) {
      //   print('Receive: ${receive.toJson()}');
      // });

      _surrealdbPlugin.ping(duration: const Duration(milliseconds: 10000));
      await _surrealdbPlugin.use(ns: 'lostark', db: 'lobot');

      final auth = User(
        email: 'ppap@gmail.com',
        sub: 'ppap',
        provider: 'supabase',
      );

      try {
        // var token = await _surrealdbPlugin.signUp(
        //   sc: 'users',
        //   options: auth.toJson(),
        // );
        // debugPrint('Token: $token');
        final token = await _surrealdbPlugin.signIn(sc: 'users', options: auth.toJson(),);
        debugPrint('Token: $token');

        // final u1 = User(email: 'a', sub: 'a', provider: 'a');
        // final u2 = User(email: 'b', sub: 'b', provider: 'b');
        // final u3 = User(email: 'd', sub: 'd', provider: 'd');
        //
        // final up1 = User(provider: 'test');
        // final up2 = User(email: 'test');
        //
        // final cret = await _surrealdbPlugin.create<User>('account',
        //     data: u1.toJson(), fromJson: User.fromJson);
        // debugPrint('Create: ${cret.toJson()}');
        //
        // final updt = await _surrealdbPlugin.update<User>(cret.id!, up2.toJson(),
        //     fromJson: User.fromJson);
        // debugPrint('Update: ${updt.toJson()}');
        //
        // final inst = await _surrealdbPlugin.insert<User>('account',
        //     data: [u1.toJson(), u2.toJson()], fromJson: User.fromJson);
        // debugPrint('Insert: ${inst.map((e) => e.toJson())}');
        //
        // final mer = await _surrealdbPlugin.merge<User>('account', up1.toJson(),
        //     fromJson: User.fromJson);
        // debugPrint('Merge: ${mer.map((e) => e.toJson())}');
        //
        // final del = await _surrealdbPlugin.delete<User>(updt.id!,
        //     fromJson: User.fromJson);
        // debugPrint('Delete: ${del.toJson()}');
        //
        // final sel = await _surrealdbPlugin.select<List<User>, User>(
        //   'account',
        //   fromJson: User.fromJson,
        // );
        // debugPrint('Select: ${sel.map((e) => e.toJson())}');
        //
        // final tx = TransactionQuery();
        // final txQuery = tx.queries((tx) {
        //   tx.query(r'create account');
        // });
        // final txVars = tx.vars;
        // final txQuer = await _surrealdbPlugin.query(txQuery, vars: txVars);
        // debugPrint('Transaction Query: ${txQuer.map((e) => e)}');
        //

        final live = await _surrealdbPlugin.liveQuery(
          r'live select * from user'
        );
        debugPrint('Live Query: $live');
        
        live.listen<User>((action, data) {
          debugPrint('Live Action: $action');
          debugPrint('Live Data: ${data.toString()}');
        }, fromJson: User.fromJson);

        await live.kill();

        final queries = await _surrealdbPlugin.query(
          r'select * from type::table($tb)',
          vars: {
            'tb': 'user',
          },
        );
        debugPrint('Query: ${queries.map((e) => e)}');

        //
        //
        // final ad = (quer.first as List).map((e) => User.fromJson(e)).toList();
        //
        // for (final user in ad) {
        //   await _surrealdbPlugin.delete<User>(user.id!,
        //       fromJson: User.fromJson);
        //   debugPrint('Delete: ${user.toJson()}');
        // }
      } catch (e) {
        debugPrint('Failed to sign in: $e');
      }
    } catch (e) {
      debugPrint('Failed to connect: $e');
    }
    // await _surrealdbPlugin.wait();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
