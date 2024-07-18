class OrderDashboard {
  StatusOrderDashboard? status;
  DataOrderDashboard? data;

  OrderDashboard({this.status, this.data});

  OrderDashboard.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null
        ? new StatusOrderDashboard.fromJson(json['status'])
        : null;
    data = json['data'] != null
        ? new DataOrderDashboard.fromJson(json['data'])
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

class StatusOrderDashboard {
  int? code;
  String? description;

  StatusOrderDashboard({this.code, this.description});

  StatusOrderDashboard.fromJson(Map<String, dynamic> json) {
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

class DataOrderDashboard {
  Summary1OrderDashboard? summary;
  InprogressOrderDashboard? inprogress;

  DataOrderDashboard({this.summary, this.inprogress});

  DataOrderDashboard.fromJson(Map<String, dynamic> json) {
    summary = json['summary'] != null
        ? new Summary1OrderDashboard.fromJson(json['summary'])
        : null;
    inprogress = json['inprogress'] != null
        ? new InprogressOrderDashboard.fromJson(json['inprogress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.inprogress != null) {
      data['inprogress'] = this.inprogress!.toJson();
    }
    return data;
  }
}

class Summary1OrderDashboard {
  NewSumOrderDashboard? newSum;
  NewSumOrderDashboard? provisionningSum;
  NewSumOrderDashboard? billingSum;
  NewSumOrderDashboard? completeSum;

  Summary1OrderDashboard(
      {this.newSum, this.provisionningSum, this.billingSum, this.completeSum});

  Summary1OrderDashboard.fromJson(Map<String, dynamic> json) {
    newSum = json['new_sum'] != null
        ? new NewSumOrderDashboard.fromJson(json['new_sum'])
        : null;
    provisionningSum = json['provisionning_sum'] != null
        ? new NewSumOrderDashboard.fromJson(json['provisionning_sum'])
        : null;
    billingSum = json['billing_sum'] != null
        ? new NewSumOrderDashboard.fromJson(json['billing_sum'])
        : null;
    completeSum = json['complete_sum'] != null
        ? new NewSumOrderDashboard.fromJson(json['complete_sum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newSum != null) {
      data['new_sum'] = this.newSum!.toJson();
    }
    if (this.provisionningSum != null) {
      data['provisionning_sum'] = this.provisionningSum!.toJson();
    }
    if (this.billingSum != null) {
      data['billing_sum'] = this.billingSum!.toJson();
    }
    if (this.completeSum != null) {
      data['complete_sum'] = this.completeSum!.toJson();
    }
    return data;
  }
}

class NewSumOrderDashboard {
  int? values;
  int? items;

  NewSumOrderDashboard({this.values, this.items});

  NewSumOrderDashboard.fromJson(Map<String, dynamic> json) {
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

class InprogressOrderDashboard {
  OverDueOrderDashboard? overDue;
  OverDueOrderDashboard? atRisk;
  OverDueOrderDashboard? dueThisWeek;
  OverDueOrderDashboard? dueThisMonth;

  InprogressOrderDashboard(
      {this.overDue, this.atRisk, this.dueThisWeek, this.dueThisMonth});

  InprogressOrderDashboard.fromJson(Map<String, dynamic> json) {
    overDue = json['over_due'] != null
        ? new OverDueOrderDashboard.fromJson(json['over_due'])
        : null;
    atRisk = json['at_risk'] != null
        ? new OverDueOrderDashboard.fromJson(json['at_risk'])
        : null;
    dueThisWeek = json['due_this_week'] != null
        ? new OverDueOrderDashboard.fromJson(json['due_this_week'])
        : null;
    dueThisMonth = json['due_this_month'] != null
        ? new OverDueOrderDashboard.fromJson(json['due_this_month'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overDue != null) {
      data['over_due'] = this.overDue!.toJson();
    }
    if (this.atRisk != null) {
      data['at_risk'] = this.atRisk!.toJson();
    }
    if (this.dueThisWeek != null) {
      data['due_this_week'] = this.dueThisWeek!.toJson();
    }
    if (this.dueThisMonth != null) {
      data['due_this_month'] = this.dueThisMonth!.toJson();
    }
    return data;
  }
}

class OverDueOrderDashboard {
  int? totalItem;
  int? newItem;
  int? provisioningItem;
  int? billingItem;

  OverDueOrderDashboard(
      {this.totalItem, this.newItem, this.provisioningItem, this.billingItem});

  OverDueOrderDashboard.fromJson(Map<String, dynamic> json) {
    totalItem = json['total_item'];
    newItem = json['new_item'];
    provisioningItem = json['provisioning_item'];
    billingItem = json['billing_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_item'] = this.totalItem;
    data['new_item'] = this.newItem;
    data['provisioning_item'] = this.provisioningItem;
    data['billing_item'] = this.billingItem;
    return data;
  }
}
