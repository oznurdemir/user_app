import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/repo/kisilerdao_repository.dart';

class KayitSayfaCubit extends Cubit<void>{ //Geriye değer dönmediğinden void yazıyoruz.
  KayitSayfaCubit():super(0);
  var krepo = KisilerdaoRepository();

  // repodan nesne oluşturup repositorydeki fonksiyonu çalıştırıyoruz.
  Future<void> kisiKaydet(String kisi_ad, String kisi_tel) async{
    await krepo.kisiKaydet(kisi_ad, kisi_tel);
  }

}