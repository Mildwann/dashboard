class ServiceDashboard {
  Status? status;
  Data? data;

  ServiceDashboard({this.status, this.data});

  ServiceDashboard.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  ApproveTask? approveTask;
  OrderType? orderType;

  Data({this.approveTask, this.orderType});

  Data.fromJson(Map<String, dynamic> json) {
    approveTask = json['approve_task'] != null
        ? new ApproveTask.fromJson(json['approve_task'])
        : null;
    orderType = json['order_type'] != null
        ? new OrderType.fromJson(json['order_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.approveTask != null) {
      data['approve_task'] = this.approveTask!.toJson();
    }
    if (this.orderType != null) {
      data['order_type'] = this.orderType!.toJson();
    }
    return data;
  }
}

class ApproveTask {
  int? totals;
  int? provisioning;
  int? packageComponent;
  int? backdate;

  ApproveTask(
      {this.totals, this.provisioning, this.packageComponent, this.backdate});

  ApproveTask.fromJson(Map<String, dynamic> json) {
    totals = json['totals'];
    provisioning = json['provisioning'];
    packageComponent = json['package_component'];
    backdate = json['backdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totals'] = this.totals;
    data['provisioning'] = this.provisioning;
    data['package_component'] = this.packageComponent;
    data['backdate'] = this.backdate;
    return data;
  }
}

class OrderType {
  NewOrder? newOrder;
  NewOrder? modify;

  OrderType({this.newOrder, this.modify});

  OrderType.fromJson(Map<String, dynamic> json) {
    newOrder = json['new_order'] != null
        ? new NewOrder.fromJson(json['new_order'])
        : null;
    modify =
        json['modify'] != null ? new NewOrder.fromJson(json['modify']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newOrder != null) {
      data['new_order'] = this.newOrder!.toJson();
    }
    if (this.modify != null) {
      data['modify'] = this.modify!.toJson();
    }
    return data;
  }
}

class NewOrder {
  double? values;
  int? items;

  NewOrder({this.values, this.items});

  NewOrder.fromJson(Map<String, dynamic> json) {
    values = json['values'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    data['items'] = this.items;
    return data;
  }
}
