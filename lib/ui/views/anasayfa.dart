import 'package:flutter/material.dart';
import 'package:getir_ornek_proje/data/entity/kategoriler.dart';
import 'package:getir_ornek_proje/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Kategoriler>> kategorileriYukle() async {
    var kategorilerListesi = <Kategoriler>[];
    var k1 = Kategoriler(id: 1, ad: "Bebek", resim: "bebek.jpg");
    var k2 = Kategoriler(id: 2, ad: "İçecek", resim: "icecek.jpeg");
    var k3 = Kategoriler(id: 3, ad: "Kişisel Bakım", resim: "kisiselBakim.jpg");
    var k4 = Kategoriler(id: 4, ad: "Oyun", resim: "oyun.jpeg");
    var k5 = Kategoriler(id: 5, ad: "Kampanya", resim: "kampanya.jpg");
    
    kategorilerListesi.addAll([k1, k2, k3, k4, k5]);
    return kategorilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Getir",
          style: TextStyle(color: Colors.amber, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: kategorileriYukle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            var kategorilerListesi = snapshot.data!;
            return GridView.builder(
              itemCount: kategorilerListesi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8, // yatay ve dikey oran
              ),
              itemBuilder: (context, index) {
                var kategori = kategorilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetaySayfa(kategori: kategori)),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${kategori.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print("${kategori.ad} Sepete Eklendi");
                              },
                              child: const Text("Aç"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Veri yok"));
          }
        },
      ),
    );
  }
}
