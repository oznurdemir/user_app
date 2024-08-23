import 'package:flutter/material.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

//kişi kayıt işleminin modüler olması için ayrı bir fonksiyonda bu işlemi yapıyoruz.
Future<void> kisiKaydet(String kisi_ad, String kisi_tel) async{
  print("Kişi kayıt: $kisi_ad - $kisi_tel");
}

class _KayitSayfaState extends State<KayitSayfa> {
  // text fieldlar için controller oluştur.
  var tfKisiAdController = TextEditingController();
  var tfKisiTelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Kayıt"),),
      // widgetları yatayda ortalamak istediğimiz içn Cneter() yapısını kullanıyoruz.
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdController, decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfKisiTelController, decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                // veri kaydetme işlemi
                kisiKaydet(tfKisiAdController.text, tfKisiTelController.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        )
      ),
    );
  }
}
