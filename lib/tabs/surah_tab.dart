import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/models/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getListSurah() async {
    // Simulasi mengambil data secara asinkron
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data); // Mengembalikan list Surah
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: _getListSurah(),
      initialData: const [],
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
          itemBuilder: (context, index) =>
              _surahItem(surah: snapshot.data!.elementAt(index)),
          separatorBuilder: (context, index) => Container(),
          itemCount: snapshot.data!.length,
        );
      }),
    );
  }

  Container _surahItem({required Surah surah}) => Container(
        child: const Text("Oke"),
      );
}
