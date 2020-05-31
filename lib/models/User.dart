class User {
  int id;
  String username;
  String authToken;
  String type;

  User({this.id, this.username, this.authToken, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = 1;
    username = json['user']['username'];
    authToken = json['auth_token'];
    type = json["type"];
  }

  User.fromSignUp(Map<String, dynamic> json) {
    id = 1;
    username = json['username'];
    authToken = json['token'];
    type = json["type"];
  }

  User.fromNormal(Map<String, dynamic> json) {
    id = 1;
    username = json['username'];
    authToken = json['auth_token'];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['auth_token'] = this.authToken;
    data['type'] = this.type;

    return data;
  }
}
