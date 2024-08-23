import 'package:flutter/material.dart';
import 'package:user_app/data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  // Bu sayfaya geldiğimizde bir Kisiler nesnesi yollamamız gerekiyor.
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

//kişi güncelleme işleminin modüler olması için ayrı bir fonksiyonda bu işlemi yapıyoruz.
Future<void> kisiGuncelle(int kisi_id, String kisi_ad, String kisi_tel) async{
  print("Kişi Güncelle: $kisi_id - $kisi_ad - $kisi_tel");
}

class _DetaySayfaState extends State<DetaySayfa> {
  // text fieldlar için controller oluştur.
  var tfKisiAdController = TextEditingController();
  var tfKisiTelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Kişi Detay"),),
    body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdController, decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfKisiTelController, decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                // veri kaydetme işlemi
              }, child: const Text("KAYDET")),
            ],
          ),
        )
    ),,
    );
  }
}
