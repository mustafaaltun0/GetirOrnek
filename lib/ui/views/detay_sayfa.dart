import 'package:flutter/material.dart';
import 'package:getir_ornek_proje/data/entity/kategoriler.dart';

class DetaySayfa extends StatelessWidget {
  final Kategoriler kategori; // Kategori parametresi eklendi

  const DetaySayfa({super.key, required this.kategori}); // Constructor güncellendi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detay Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(kategori.ad, style: const TextStyle(fontSize: 24)), // Kategori adını göster
            Image.asset("resimler/${kategori.resim}"), // Kategori resmini göster
          ],
        ),
      ),
    );
  }
}
