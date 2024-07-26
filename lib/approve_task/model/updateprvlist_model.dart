class updatePrvList {
  StatusupdatePrvList? status;
  Null data;

  updatePrvList({this.status, this.data});

  updatePrvList.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null
        ? new StatusupdatePrvList.fromJson(json['status'])
        : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class StatusupdatePrvList {
  int? code;
  String? description;

  StatusupdatePrvList({this.code, this.description});

  StatusupdatePrvList.fromJson(Map<String, dynamic> json) {
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
