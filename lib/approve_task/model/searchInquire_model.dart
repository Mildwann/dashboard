// // ignore_for_file: unnecessary_new

// class SearchInquireModel {
//   Status? status;
//   Data? data;

//   SearchInquireModel({this.status, this.data});

//   SearchInquireModel.fromJson(Map<String, dynamic> json) {
//     status =
//         json['status'] != null ? new Status.fromJson(json['status']) : null;
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.status != null) {
//       data['status'] = this.status!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Status {
//   int? code;
//   String? description;

//   Status({this.code, this.description});

//   Status.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['description'] = this.description;
//     return data;
//   }
// }

// class Datas {
//   Datas? data;
//   Null param;

//   Datas({this.data, this.param});

//   Datas.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Datas.fromJson(json['data']) : null;
//     param = json['param'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['param'] = this.param;
//     return data;
//   }
// }

// class Data {
//   int? totalRecord;
//   int? currentPage;
//   int? pageSize;
//   List<Null>? items;

//   Data({this.totalRecord, this.currentPage, this.pageSize, this.items});

//   Data.fromJson(Map<String, dynamic> json) {
//     totalRecord = json['total_record'];
//     currentPage = json['current_page'];
//     pageSize = json['page_size'];
//     if (json['items'] != null) {
//       items = <Null>[];
//       json['items'].forEach((v) {
//         items!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_record'] = this.totalRecord;
//     data['current_page'] = this.currentPage;
//     data['page_size'] = this.pageSize;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
