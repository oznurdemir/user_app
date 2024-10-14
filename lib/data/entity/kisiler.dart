
class Kisiler{
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisiler({required this.kisi_id, required this.kisi_ad, required this.kisi_tel});

  //Veri gelirse bu veriyi doğru isimlerle doğru veri tipine dönüştür.
  factory Kisiler.fromJson(Map<String, dynamic> json) {
    return Kisiler(
        kisi_id: json["kisi_id"] as String,
        kisi_ad: json["kisi_ad"] as String,
        kisi_tel: json["kisi_tel"] as String
    );
  }
}