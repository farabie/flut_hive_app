import 'package:hive/hive.dart';
part 'monster.g.dart';

@HiveType(typeId: 0)
class Monster {
  @HiveField(0)
  String name;
  @HiveField(1)
  int level;

  //Pastikan parameternya bukan yang named parameter
  Monster(this.name, this.level);
}
