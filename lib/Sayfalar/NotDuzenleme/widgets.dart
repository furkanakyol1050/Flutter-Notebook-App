import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/degiskenler.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            if (ref.watch(favoriProvider) == Bootstrap.star) {
              ref.read(favoriProvider.notifier).state = Bootstrap.star_fill;
            } else {
              ref.read(favoriProvider.notifier).state = Bootstrap.star;
            }
          },
          icon: Icon(
            ref.watch(favoriProvider),
            color: Colors.black54,
          ),
        )
      ],
      leading: IconButton(
        padding: const EdgeInsets.only(right: 16),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Bootstrap.caret_left_fill,
          color: Colors.black54,
        ),
      ),
      title: const Text(
        "Not Oluştur / Düzenle",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BaslikAlani extends ConsumerWidget {
  const BaslikAlani({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        initialValue: ref.watch(baslikYazisi),
        onChanged: (value) {
          ref.read(baslikYazisi.notifier).state = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Başlık Giriniz!';
          }
          return null;
        },
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: "Başlık",
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLength: 20,
        maxLines: 1,
      ),
    );
  }
}

class YazmaAlani extends ConsumerWidget {
  const YazmaAlani({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        initialValue: ref.watch(notYazisi),
        onChanged: (value) {
          ref.read(notYazisi.notifier).state = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Not Giriniz!';
          }
          return null;
        },
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          hintText: "Notunuzu buraya ekleyiniz",
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
        ),
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}

class RenkYazisi extends StatelessWidget {
  const RenkYazisi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      alignment: Alignment.centerLeft,
      child: const Column(
        children: [
          Text(
            "Renk :",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class RenkSecme extends ConsumerWidget {
  const RenkSecme({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
      child: Row(
        children: [
          for (var index = 0; index < ref.watch(radioRenk).length; index++)
            Radio(
              fillColor: MaterialStateProperty.all<Color>(
                ref.watch(radioRenk)[index],
              ),
              value: index,
              groupValue: ref.watch(radioSecilen),
              onChanged: (value) {
                ref.read(radioSecilen.notifier).state = index;
              },
            ),
        ],
      ),
    );
  }
}
