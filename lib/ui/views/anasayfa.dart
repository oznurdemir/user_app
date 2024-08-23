import 'package:flutter/material.dart';
import 'package:user_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişiler"),),
      body: const Center(),
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
