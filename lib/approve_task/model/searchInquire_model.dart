class SearchInquireModel {
  Status? status;
  Data? data;

  SearchInquireModel({this.status, this.data});

  SearchInquireModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  int? code;
  String? description;

  Status({this.code, this.description});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    return data;
  }
}

class Data {
  int? totalRecord;
  int? currentPage;
  int? pageSize;
  List<dynamic>? items;

  Data({this.totalRecord, this.currentPage, this.pageSize, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecord = json['total_record'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    if (json['items'] != null) {
      items = <dynamic>[];
      json['items'].forEach((v) {
        items!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_record'] = totalRecord;
    data['current_page'] = currentPage;
    data['page_size'] = pageSize;
    if (items != null) {
      data['items'] = items!.map((v) => v).toList();
    }
    return data;
  }
}
