import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:user_app/data/entity/kisiler.dart';
import 'package:user_app/data/entity/kisiler_cevap.dart';

class KisilerdaoRepository{

  //Cevabı getirip önce json formatına oradan da liste haline getrip kişileri içeren listedeki
  //her elemana erişim sağlanacak.
  List<Kisiler> parseKisiler(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

//kişi kayıt işleminin modüler olması için ayrı bir fonksiyonda bu işlemi yapıyoruz.
  Future<void> kisiKaydet(String kisi_ad, String kisi_tel) async{
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Kaydet: ${cevap.data.toString()}");
  }

  //kişi güncelleme işleminin modüler olması için ayrı bir fonksiyonda bu işlemi yapıyoruz.
  Future<void> kisiGuncelle(String kisi_id, String kisi_ad, String kisi_tel) async{
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Güncelle: ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> tumKisiler() async {
    // url den gelen cevabı alacağız ve liste halinde kişileri kullanabilmek için fonksiyonumuza gönderip cevabı döneceğiz.
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisiler(cevap.data.toString());
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async{
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseKisiler(cevap.data.toString());
  }

  Future<void> kisiSil(String kisi_id) async{
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id": kisi_id};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Güncelle: ${cevap.data.toString()}");
  }
}