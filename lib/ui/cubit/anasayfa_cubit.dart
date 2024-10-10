import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/entity/kisiler.dart';
import 'package:user_app/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]); //Varsayılan olarak boş bir liste döndürecek

  var krepo = KisilerdaoRepository();

  Future<void> tumKisiler() async {
    // void olma sebebi; bu fonksyion verileri alıp sadece aryüze emit edecek (gönderecek).
    // await kullanma sebebi; veritabanları ile şçalışırken performans olarak bize faydası olacak.
    var kisilerListesi = await krepo.tumKisiler();
    emit(kisilerListesi);
  }

  Future<void> ara(String aramaKelimesi) async{
    var kisilerListesi = await krepo.ara(aramaKelimesi);
    emit(kisilerListesi);
  }

  Future<void> kisiSil(String kisi_id) async{
    await krepo.kisiSil(kisi_id);
    await tumKisiler();
  }
}