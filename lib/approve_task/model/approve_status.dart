class AppoveStatus {
  StatusAppoveStatus? status;
  DataAppoveStatus? data;

  AppoveStatus({this.status, this.data});

  AppoveStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null
        ? new StatusAppoveStatus.fromJson(json['status'])
        : null;
    data = json['data'] != null
        ? new DataAppoveStatus.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StatusAppoveStatus {
  int? code;
  String? description;

  StatusAppoveStatus({this.code, this.description});

  StatusAppoveStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class DataAppoveStatus {
  Null selected;
  List<ItemsAppoveStatus>? items;

  DataAppoveStatus({this.selected, this.items});

  DataAppoveStatus.fromJson(Map<String, dynamic> json) {
    selected = json['selected'];
    if (json['items'] != null) {
      items = <ItemsAppoveStatus>[];
      json['items'].forEach((v) {
        items!.add(new ItemsAppoveStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selected'] = this.selected;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsAppoveStatus {
  String? value;
  String? key;

  ItemsAppoveStatus({this.value, this.key});

  ItemsAppoveStatus.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['key'] = this.key;
    return data;
  }
}
