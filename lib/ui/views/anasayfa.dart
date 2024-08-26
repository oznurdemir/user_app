import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_app/data/entity/kisiler.dart';
import 'package:user_app/ui/views/detay_sayfa.dart';
import 'package:user_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async{
    print("Arama Kelimesi: $aramaKelimesi");
  }
  Future<List<Kisiler>> tumKisiler() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }
  Future<void> kisiSil(int kisi_id) async{
    print("Kişi Silindi: ${kisi_id}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
         TextField(decoration: const InputDecoration(hintText: "Ara"), onChanged: (aramaSonucu){
          ara(aramaSonucu);
        },)
            : const Text("Kişiler"),
        actions: [aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              // arama işlemi
              aramaYapiliyorMu = false;
            });
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search)),
        ],
      ),
      // Performanslı bir şekilde verileri arayüzde göstermek için futureBuilder kullanıyoruz.
      body: FutureBuilder<List<Kisiler>>(
        future: tumKisiler(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            // Data varsa listeleme işlemi yapacağız.
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length, //listedeki item sayısı
              itemBuilder: (context, index){ // itemBuilder item sayısı kadar çalışacak(burada 3 kere)
                var kisi = kisilerListesi[index]; // listedeki her bir veriyi tek tek alıyoruz.
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // card a basınca detay sayfasına gitsin
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi))).then((value){
                        print("Anasayfaya dönüldü.");
                      });
                    },
                    child: Card(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                const SizedBox(height: 8,),
                                Text(kisi.kisi_tel, style: const TextStyle(fontSize: 12),),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){
                            //icona basınca silme işlemi gerçekleşecek
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Kişiyi Silmek İstiyor musunuz?"),
                                  action: SnackBarAction(label: "Evet", onPressed: (){
                                    kisiSil(kisi.kisi_id);
                                }),
                              )
                            );
                          }, icon: const Icon(Icons.clear)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //buttona basınca sayfa geçişi yapılacak.
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa())).then((value){
            //Geçişten sonra sayfaya geri dönüşte bilgi sahibi olmak için
            print("Anasayfaya dönüldü.");
          });
        },
        child: const Icon(Icons.add), //fab buttonun üstündeki icon
      ),
    );
  }
}
