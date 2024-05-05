enum Method {
  ping,
  use,
  info,
  signup,
  signin,
  authenticate,
  invalidate,
  let,
  unset,
  live,
  kill,
  query,
  select,
  create,
  insert,
  update,
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
      case Method.select:
        return 'select';
      case Method.create:
        return 'create';
      case Method.insert:
        return 'insert';
      case Method.update:
        return 'update';
      case Method.merge:
        return 'merge';
      case Method.patch:
        return 'patch';
      case Method.delete:
        return 'delete';
    }
  }
}
