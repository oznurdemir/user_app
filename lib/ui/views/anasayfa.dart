import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/entity/kisiler.dart';
import 'package:user_app/ui/cubit/anasayfa_cubit.dart';
import 'package:user_app/ui/views/detay_sayfa.dart';
import 'package:user_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  //sayfa yüklendiği anda ekranda çalışan fonksiyon
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().tumKisiler();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
         TextField(decoration: const InputDecoration(hintText: "Ara"), onChanged: (aramaSonucu){
           context.read<AnasayfaCubit>().ara(aramaSonucu);
        },)
            : const Text("Kişiler"),
        actions: [aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              // arama işlemi
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().tumKisiler(); //arama işlemi bittikten sonra ekranda tekrardan tüm kişiler görünsün
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search)),
        ],
      ),
      // Cubitteki fonksiyondan dönen listeyi dinlemek için bloc builder kullanıyoruz.
      body: BlocBuilder<AnasayfaCubit, List<Kisiler>>(
        builder: (context, kisilerListesi){
          if(kisilerListesi.isNotEmpty){ //içinde veri varsa çalışsın
            return ListView.builder(
              itemCount: kisilerListesi.length, //listedeki item sayısı
              itemBuilder: (context, index){ // itemBuilder item sayısı kadar çalışacak(burada 3 kere)
                var kisi = kisilerListesi[index]; // listedeki her bir veriyi tek tek alıyoruz.
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // card a basınca detay sayfasına gitsin
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi))).then((value){
                        context.read<AnasayfaCubit>().tumKisiler();
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
                                    context.read<AnasayfaCubit>().kisiSil(kisi.kisi_id
                                    );
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
            context.read<AnasayfaCubit>().tumKisiler();
            print("Anasayfaya dönüldü.");
          });
        },
        child: const Icon(Icons.add), //fab buttonun üstündeki icon
      ),
    );
  }
}
