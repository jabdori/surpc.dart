
import 'surrealdb_platform_interface.dart';

class Surrealdb {
  Future<String?> getPlatformVersion() {
    return SurrealdbPlatform.instance.getPlatformVersion();
  }
}
