enum Method {
  ping,
  use,
  info,
  version,
  signup,
  signin,
  authenticate,
  invalidate,
  let,
  unset,
  live,
  kill,
  query,
  graphql,
  run,
  select,
  create,
  insert,
  insertRelation,
  update,
  upsert,
  relate,
  merge,
  patch,
  delete;

  String get value {
    switch (this) {
      case Method.ping:
        return 'ping';
      case Method.use:
        return 'use';
      case Method.info:
        return 'info';
      case Method.version:
        return 'version';
      case Method.signup:
        return 'signup';
      case Method.signin:
        return 'signin';
      case Method.authenticate:
        return 'authenticate';
      case Method.invalidate:
        return 'invalidate';
      case Method.let:
        return 'let';
      case Method.unset:
        return 'unset';
      case Method.live:
        return 'live';
      case Method.kill:
        return 'kill';
      case Method.query:
        return 'query';
      case Method.graphql:
        return 'graphql';
      case Method.run:
        return 'run';
      case Method.select:
        return 'select';
      case Method.create:
        return 'create';
      case Method.insert:
        return 'insert';
      case Method.insertRelation:
        return 'insert_relation';
      case Method.update:
        return 'update';
      case Method.upsert:
        return 'upsert';
      case Method.relate:
        return 'relate';
      case Method.merge:
        return 'merge';
      case Method.patch:
        return 'patch';
      case Method.delete:
        return 'delete';
    }
  }
}
