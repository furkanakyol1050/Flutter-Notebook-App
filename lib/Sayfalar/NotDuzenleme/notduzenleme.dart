import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/degiskenler.dart';
import 'package:notdefteri/Sayfalar/NotDuzenleme/widgets.dart';
import 'package:notdefteri/main.dart';
import 'package:notdefteri/modeller/modeller.dart';

class NotDuzenleme extends ConsumerWidget {
  NotDuzenleme({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWidget(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            kaydet(ref);
            Navigator.pop(context);
          }
        },
        label: const Text(
          "   Kaydet    ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          FontAwesome.floppy_disk,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightGreen.shade400,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: const Column(
            children: [
              BaslikAlani(),
              RenkYazisi(),
              RenkSecme(),
              YazmaAlani(),
            ],
          ),
        ),
      ),
    );
  }

  static kaydet(WidgetRef ref) async {
    Not not = Not(
      ref.watch(notYazisi),
      ref.watch(baslikYazisi),
      (ref.watch(favoriProvider) == Bootstrap.star) ? 0 : 1,
      ref.watch(radioSecilen),
      DateTime.now(),
    );

    List liste = ref.watch(notListesi);
    liste.add(not);

    List<Not> liste1 = [];
    List<Not> liste2 = [];

    if (ref.watch(eklemeBilgisi) != null) {
      liste.remove(ref.watch(eklemeBilgisi));
    }

    for (Not i in liste) {
      if (i.favori == 1) {
        liste1.add(i);
      } else {
        liste2.add(i);
      }
    }

    liste1.sort((a, b) => a.tarih.compareTo(b.tarih));
    liste2.sort((a, b) => a.tarih.compareTo(b.tarih));

    liste = liste1.reversed.toList() + liste2.reversed.toList();

    ref.read(notListesi.notifier).state = liste;

    await box.clear();
    await box.addAll(liste);
  }
}
