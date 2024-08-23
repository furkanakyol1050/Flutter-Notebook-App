import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/degiskenler.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar.large(
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              ref.read(eklemeBilgisi.notifier).state = null;
              ref.read(favoriProvider.notifier).state = Bootstrap.star;
              ref.read(notYazisi.notifier).state = "";
              ref.read(baslikYazisi.notifier).state = "";
              ref.read(radioSecilen.notifier).state = 0;
              Navigator.pushNamed(context, '/duzenleme');
            },
            icon: const Icon(
              Bootstrap.journal_plus,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ),
      ],
      title: const Text(
        'Notlar',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      floating: false,
      centerTitle: true,
    );
  }
}

class Tasarim {
  static TextStyle beyazFontStil(double boyut) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: boyut,
    );
  }
}
