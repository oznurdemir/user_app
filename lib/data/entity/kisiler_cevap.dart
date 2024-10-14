import 'kisiler.dart';

class KisilerCevap {
  List <Kisiler> kisiler;
  int success;

  KisilerCevap({required this.kisiler, required this.success});

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
        var jsonArray = json["kisiler"] as List;
        int success = json["success"] as int;

        // bu sırasıyla tüm json nesnelerini alıp kisiler sınıfına atacak. Orada da json nesnesi, kişi nesnesine çevrilecek.
        var kisiler = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

        return KisilerCevap(kisiler: kisiler, success: success);
  }
}