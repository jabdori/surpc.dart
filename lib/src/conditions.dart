class Condition {
  List<String> conditions = [];

  Condition eq(String key, dynamic value) {
    conditions.add('$key = $value');
    return this;
  }

  Condition neq(String key, dynamic value) {
    conditions.add('$key != $value');
    return this;
  }

  Condition gt(String key, dynamic value) {
    conditions.add('$key > $value');
    return this;
  }

  Condition gte(String key, dynamic value) {
    conditions.add('$key >= $value');
    return this;
  }

  Condition lt(String key, dynamic value) {
    conditions.add('$key < $value');
    return this;
  }

  Condition lte(String key, dynamic value) {
    conditions.add('$key <= $value');
    return this;
  }

  Condition inside(String key, dynamic value) {
    conditions.add('$key ∈ $value');
    return this;
  }

  Condition notInside(String key, dynamic value) {
    conditions.add('$key ∉ $value');
    return this;
  }

  Condition allInside(String key, List<dynamic> value) {
    conditions.add('$key ⊆ $value');
    return this;
  }

  Condition anyInside(String key, List<dynamic> value) {
    conditions.add('$key ⊂ $value');
    return this;
  }

  Condition noneInside(String key, List<dynamic> value) {
    conditions.add('$key ⊄ $value');
    return this;
  }

  Condition outside(String key, List<dynamic> value) {
    conditions.add('$key OUTSIDE $value');
    return this;
  }

  Condition intersects(String key, List<dynamic> value) {
    conditions.add('$key INTERSECTS $value');
    return this;
  }

  Condition matches(String key, String value) {
    conditions.add('$key @@ $value');
    return this;
  }

  Condition contains(String key, dynamic value) {
    conditions.add('$key ∋ $value');
    return this;
  }

  Condition notContains(String key, dynamic value) {
    conditions.add('$key ∌ $value');
    return this;
  }

  Condition containsAll(String key, List<dynamic> value) {
    conditions.add('$key ⊇ $value');
    return this;
  }

  Condition containsAny(String key, List<dynamic> value) {
    conditions.add('$key ⊃ $value');
    return this;
  }

  Condition containsNone(String key, List<dynamic> value) {
    conditions.add('$key ⊅ $value');
    return this;
  }

  String get query => conditions.join(' AND ');
}
