class Address {
  int id;
  String street;
  String house;
  String podezd;
  String kvartira;

  Address({this.street, this.house, this.podezd, this.kvartira});

  Address.fromDBJson(Map<String, dynamic> json) {
    street = json["street"];
    house = json["house"];
    podezd = json["podezd"];
    kvartira = json["kvartira"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street.toString();
    data['house'] = this.house.toString();
    data['podezd'] = this.podezd.toString();
    data['kvartira'] = this.kvartira.toString();
    return data;
  }
}

