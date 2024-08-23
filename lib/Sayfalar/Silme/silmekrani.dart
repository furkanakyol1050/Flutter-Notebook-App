import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notdefteri/degiskenler.dart';
import 'package:notdefteri/main.dart';

class Silme extends ConsumerWidget {
  const Silme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Bootstrap.caret_left_fill,
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Bootstrap.journal_x,
                size: 200,
                color: Colors.red.shade600,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              "Silmek istediğine emin misin?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll(EdgeInsets.only(
                    left: 60,
                    right: 60,
                    top: 10,
                    bottom: 10,
                  )),
                ),
                onPressed: () {
                  ref
                      .read(notListesi.notifier)
                      .state
                      .remove(ref.watch(eklemeBilgisi));
                  ref.read(notListesi2.notifier).state = ref.watch(notListesi);
                  // ignore: unused_result
                  ref.refresh(notListesi);
                  ref.read(notListesi.notifier).state = ref.watch(notListesi2);
                  box.clear();
                  box.addAll(ref.watch(notListesi));
                  Navigator.pop(context);
                },
                child: const Text(
                  "Evet",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
