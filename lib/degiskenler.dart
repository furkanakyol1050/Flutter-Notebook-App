import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/main.dart';
import 'package:notdefteri/modeller/modeller.dart';

final favoriProvider = StateProvider((ref) => Bootstrap.star);

final radioRenk = Provider((ref) => [
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.teal,
      Colors.indigo,
      Colors.deepPurple,
    ]);

final eklemeBilgisi = StateProvider<Not?>((ref) => null);

final radioSecilen = StateProvider((ref) => 0);

final baslikYazisi = StateProvider((ref) => "");

final notYazisi = StateProvider((ref) => "");

final notListesi = StateProvider((ref) => box.values.toList());

final notListesi2 = StateProvider((ref) => []);
