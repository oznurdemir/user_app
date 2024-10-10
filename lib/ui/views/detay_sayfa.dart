import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/entity/kisiler.dart';
import 'package:user_app/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  // Bu sayfaya geldiğimizde bir Kisiler nesnesi yollamamız gerekiyor.
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  // text fieldlar için controller oluştur.
  var tfKisiAdController = TextEditingController();
  var tfKisiTelController = TextEditingController();


  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdController.text = kisi.kisi_ad;
    tfKisiTelController.text = kisi.kisi_tel;
  }

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
                // veri güncelleme işlemi
                context.read<DetaySayfaCubit>().kisiGuncelle(widget.kisi.kisi_id, tfKisiAdController.text, tfKisiTelController.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        )
    ),
    );
  }
}
