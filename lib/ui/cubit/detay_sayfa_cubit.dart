import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/repo/kisilerdao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);
  var krepo = KisilerdaoRepository();
  Future<void> kisiGuncelle(String kisi_id, String kisi_ad, String kisi_tel) async{
    await krepo.kisiGuncelle(kisi_id, kisi_ad, kisi_tel); //await: repoda bu işlemin yapmasını bekler sonra işleme devam eder
  }
}