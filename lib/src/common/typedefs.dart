typedef ID = String;
typedef Token = String;
typedef DataMap = Map<String, dynamic>;
typedef FromJson<T> = T Function(Map<String, dynamic> json);
typedef ToJson<T> = Map<String, dynamic> Function(T object);
