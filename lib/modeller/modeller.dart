import 'package:hive_flutter/hive_flutter.dart';
part 'modeller.g.dart';

@HiveType(typeId: 1)
class Not {
  @HiveField(0)
  String not;
  @HiveField(1)
  String baslik;
  @HiveField(2)
  int favori;
  @HiveField(3)
  int renk;
  @HiveField(4)
  DateTime tarih;

  Not(this.not, this.baslik, this.favori, this.renk, this.tarih);
}
