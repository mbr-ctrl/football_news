

class Club {
  late String clubId;
  late String name;
  late String city;
  List<Player>? player;
  late String logoUrl;
  late Manager manager;

  Club({
    required this.clubId,
    required this.name,
    required this.city,
             this.player,
    required this.logoUrl,
    required this.manager
});

  Club.fromJson(Map<String, dynamic> json) {
    clubId = json['clubId'];
    name = json['name'];
    city = json['city'];
    if (json['player'] != null) {
      player = <Player>[];
      json['items'].forEach((v) {
        player?.add(Player.fromJson(v));
      });
    }
    logoUrl = json['logoUrl'];
    manager = json['manager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clubId'] = clubId;
    data['name'] = name;
    data['city'] = city;
    final player = this.player;
    if (player != null) {
      data['player'] = player.map((v) => v.toJson()).toList();
    }
    data['logoUrl'] = logoUrl;
    data['manager'] = manager;
    return data;
  }
}

class Player {
  late String playerId;
  late String firstName;
  late String lastName;
  late String position;
  late String imgUrl;
  late int age;

  Player({
    required this.playerId,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.imgUrl,
    required this.age,
});

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['playerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    position = json['position'];
    imgUrl = json['imgUrl'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playerId'] = playerId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['position'] = position;
    data['imgUrl'] = imgUrl;
    data['age'] = age;
    return data;
  }
}

class Response {
  int? code;
  String? message;

  Response({
    this.code,
    this.message
});
}

class Manager{
  late String managerID;
  late String name;
  late String email;
  late String password;

  Manager({
    required this.managerID,
    required this.name,
    required this.email,
    required this.password
});

  Manager.fromJson(Map<String, dynamic> json) {
    managerID = json['managerID'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['managerID'] = managerID;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
