import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
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
                context.read<KayitSayfaCubit>().kisiKaydet(tfKisiAdController.text, tfKisiTelController.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        )
      ),
    );
  }
}
