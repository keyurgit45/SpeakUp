import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserCreated {
  @HiveField(0)
  late String title;
}
