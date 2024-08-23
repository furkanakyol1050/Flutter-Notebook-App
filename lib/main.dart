import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notdefteri/Sayfalar/AnaSayfa/anasayfa.dart';
import 'package:notdefteri/Sayfalar/NotDuzenleme/notduzenleme.dart';
import 'package:notdefteri/Sayfalar/Silme/silmekrani.dart';
import 'package:notdefteri/modeller/modeller.dart';

late Box box;

Future<void> main(List<String> args) async {
  await Hive.initFlutter('uygulama');
  Hive.registerAdapter(NotAdapter());
  box = await Hive.openBox<Not>('notlar');

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AnaSayfa(),
        '/duzenleme': (context) => NotDuzenleme(),
        '/silme': (context) => const Silme(),
      },
    );
  }
}
