class DonViObject {
  int? iDKhoa;
  String? tenKhoa;
  String? createdAt;
  String? updatedAt;

  DonViObject({this.iDKhoa, this.tenKhoa});

  DonViObject.fromJson(Map<String, dynamic> json) {
    iDKhoa = json['ID_Khoa'];
    tenKhoa = json['Ten_Khoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_Khoa'] = this.iDKhoa;
    data['Ten_Khoa'] = this.tenKhoa;
    return data;
  }
}