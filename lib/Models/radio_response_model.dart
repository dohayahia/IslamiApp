class RadioResponse {
  List<Radio>? radio;

  RadioResponse({this.radio});

  RadioResponse.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radio = <Radio>[];
      json['radios'].forEach((v) {
        radio!.add(Radio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (radio != null) {
      data['radios'] = radio!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Radio {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radio({this.id, this.name, this.url, this.recentDate});

  Radio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['recent_date'] = recentDate;
    return data;
  }
}



