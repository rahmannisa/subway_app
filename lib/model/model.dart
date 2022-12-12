class Subway {
  String deskripsi;
  String img;
  String harga;
  String nama;

  Subway(
      {required this.deskripsi,
      required this.img,
      required this.harga,
      required this.nama});

  factory Subway.fromJson(Map map) {
    return Subway(
        nama: map['nama'],
        harga: map['harga'],
        deskripsi: map['deskripsi'],
        img: map['img']);
    //   return Ramene(
    //       map['description'], map['img_url'], map['price'], map['product_name']);
    // }
  }
}
