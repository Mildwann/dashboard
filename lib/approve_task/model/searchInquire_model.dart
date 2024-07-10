class SearchInquireModel {
  Status? status;
  Datas? data;

  SearchInquireModel({this.status, this.data});

  SearchInquireModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Datas.fromJson(json['data']) : null;
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

class Status {
  int? code;
  String? description;

  Status({this.code, this.description});

  Status.fromJson(Map<String, dynamic> json) {
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

class Datas {
  Data? data;
  Param? param;

  Datas({this.data, this.param});

  Datas.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalRecord;
  int? currentPage;
  int? pageSize;
  List<Items>? items;

  Data({this.totalRecord, this.currentPage, this.pageSize, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecord = json['total_record'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_record'] = this.totalRecord;
    data['current_page'] = this.currentPage;
    data['page_size'] = this.pageSize;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? approverGroup;
  String? approvalTaskId;
  String? approvalStatusValue;
  String? subject;
  String? serviceItemId;
  String? taskStatusValue;
  String? approvalStatusValueStr;
  String? dueDate;
  int? serviceId;
  int? orderTypeLkp;
  int? orderSubTypeLkp;
  String? timestampUpdated;
  String? timestampCreated;
  String? orderId;
  String? createdBy;
  String? updatedBy;
  String? svcStatusId;
  String? orderTypeName;
  String? catBillAcctId;
  String? caId;
  int? rOWNUMBER;

  Items(
      {this.approverGroup,
      this.approvalTaskId,
      this.approvalStatusValue,
      this.subject,
      this.serviceItemId,
      this.taskStatusValue,
      this.approvalStatusValueStr,
      this.dueDate,
      this.serviceId,
      this.orderTypeLkp,
      this.orderSubTypeLkp,
      this.timestampUpdated,
      this.timestampCreated,
      this.orderId,
      this.createdBy,
      this.updatedBy,
      this.svcStatusId,
      this.orderTypeName,
      this.catBillAcctId,
      this.caId,
      this.rOWNUMBER});

  Items.fromJson(Map<String, dynamic> json) {
    approverGroup = json['approverGroup'];
    approvalTaskId = json['approvalTaskId'];
    approvalStatusValue = json['approvalStatusValue'];
    subject = json['subject'];
    serviceItemId = json['serviceItemId'];
    taskStatusValue = json['taskStatusValue'];
    approvalStatusValueStr = json['approvalStatusValueStr'];
    dueDate = json['dueDate'];
    serviceId = json['serviceId'];
    orderTypeLkp = json['orderTypeLkp'];
    orderSubTypeLkp = json['orderSubTypeLkp'];
    timestampUpdated = json['timestampUpdated'];
    timestampCreated = json['timestampCreated'];
    orderId = json['orderId'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    svcStatusId = json['svcStatusId'];
    orderTypeName = json['orderTypeName'];
    catBillAcctId = json['catBillAcctId'];
    caId = json['caId'];
    rOWNUMBER = json['ROWNUMBER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approverGroup'] = this.approverGroup;
    data['approvalTaskId'] = this.approvalTaskId;
    data['approvalStatusValue'] = this.approvalStatusValue;
    data['subject'] = this.subject;
    data['serviceItemId'] = this.serviceItemId;
    data['taskStatusValue'] = this.taskStatusValue;
    data['approvalStatusValueStr'] = this.approvalStatusValueStr;
    data['dueDate'] = this.dueDate;
    data['serviceId'] = this.serviceId;
    data['orderTypeLkp'] = this.orderTypeLkp;
    data['orderSubTypeLkp'] = this.orderSubTypeLkp;
    data['timestampUpdated'] = this.timestampUpdated;
    data['timestampCreated'] = this.timestampCreated;
    data['orderId'] = this.orderId;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['svcStatusId'] = this.svcStatusId;
    data['orderTypeName'] = this.orderTypeName;
    data['catBillAcctId'] = this.catBillAcctId;
    data['caId'] = this.caId;
    data['ROWNUMBER'] = this.rOWNUMBER;
    return data;
  }
}

class Param {
  String? isThereAnyTasksToClose;
  String? isAuthorize;

  Param({this.isThereAnyTasksToClose, this.isAuthorize});

  Param.fromJson(Map<String, dynamic> json) {
    isThereAnyTasksToClose = json['isThereAnyTasksToClose'];
    isAuthorize = json['isAuthorize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isThereAnyTasksToClose'] = this.isThereAnyTasksToClose;
    data['isAuthorize'] = this.isAuthorize;
    return data;
  }
}
