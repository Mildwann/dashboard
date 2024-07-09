class CompleteDashboard {
  Status? status;
  Data? data;

  CompleteDashboard({this.status, this.data});

  CompleteDashboard.fromJson(Map<String, dynamic> json) {
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
  OrderComplete? orderComplete;

  Data({this.orderComplete});

  Data.fromJson(Map<String, dynamic> json) {
    orderComplete = json['order_complete'] != null
        ? new OrderComplete.fromJson(json['order_complete'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderComplete != null) {
      data['order_complete'] = this.orderComplete!.toJson();
    }
    return data;
  }
}

class OrderComplete {
  int? janValues;
  int? febValues;
  int? marValues;
  int? aprValues;
  int? mayValues;
  int? junValues;
  int? julValues;
  int? augValues;
  int? sepValues;
  int? octValues;
  int? novValues;
  int? decValues;

  OrderComplete(
      {this.janValues,
      this.febValues,
      this.marValues,
      this.aprValues,
      this.mayValues,
      this.junValues,
      this.julValues,
      this.augValues,
      this.sepValues,
      this.octValues,
      this.novValues,
      this.decValues});

  OrderComplete.fromJson(Map<String, dynamic> json) {
    janValues = json['jan_values'];
    febValues = json['feb_values'];
    marValues = json['mar_values'];
    aprValues = json['apr_values'];
    mayValues = json['may_values'];
    junValues = json['jun_values'];
    julValues = json['jul_values'];
    augValues = json['aug_values'];
    sepValues = json['sep_values'];
    octValues = json['oct_values'];
    novValues = json['nov_values'];
    decValues = json['dec_values'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jan_values'] = this.janValues;
    data['feb_values'] = this.febValues;
    data['mar_values'] = this.marValues;
    data['apr_values'] = this.aprValues;
    data['may_values'] = this.mayValues;
    data['jun_values'] = this.junValues;
    data['jul_values'] = this.julValues;
    data['aug_values'] = this.augValues;
    data['sep_values'] = this.sepValues;
    data['oct_values'] = this.octValues;
    data['nov_values'] = this.novValues;
    data['dec_values'] = this.decValues;
    return data;
  }
}
