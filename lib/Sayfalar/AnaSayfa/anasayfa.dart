// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/Sayfalar/AnaSayfa/widgets.dart';
import 'package:notdefteri/degiskenler.dart';
import 'package:notdefteri/modeller/modeller.dart';

class AnaSayfa extends ConsumerWidget {
  // ignore: use_key_in_widget_constructors
  const AnaSayfa({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const AppBarWidget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final not = ref.watch(notListesi)[index];
                return _notYapisiOlustur(not, ref, context);
              },
              childCount: ref.watch(notListesi).length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _notYapisiOlustur(Not not, WidgetRef ref, BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Card(
        color: ref.watch(radioRenk)[not.renk],
        child: GestureDetector(
          onTap: () {
            ref.read(favoriProvider.notifier).state =
                not.favori == 1 ? Bootstrap.star_fill : Bootstrap.star;
            ref.read(notYazisi.notifier).state = not.not;
            ref.read(baslikYazisi.notifier).state = not.baslik;
            ref.read(radioSecilen.notifier).state = not.renk;
            ref.read(eklemeBilgisi.notifier).state = not;
            Navigator.pushNamed(context, '/duzenleme');
          },
          child: ListTile(
            trailing: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(100.0),
                onLongPress: () {
                  ref.read(eklemeBilgisi.notifier).state = not;
                  Navigator.pushNamed(context, '/silme');
                },
                child: Ink(
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Bootstrap.trash,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            subtitle: Text(
              not.tarih.day.toString().padLeft(2, '0') +
                  "." +
                  not.tarih.month.toString().padLeft(2, '0') +
                  ".${not.tarih.year}  " +
                  "${not.tarih.hour.toString().padLeft(2, '0')}:" +
                  "${not.tarih.minute.toString().padLeft(2, '0')}",
              style: Tasarim.beyazFontStil(15),
            ),
            leading: Icon(
              not.favori == 1
                  ? Bootstrap.journal_bookmark_fill
                  : Bootstrap.journal_text,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              not.baslik,
              style: Tasarim.beyazFontStil(20),
            ),
          ),
        ),
      ),
    );
  }
}
