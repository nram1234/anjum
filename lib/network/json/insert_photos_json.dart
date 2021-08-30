class Insert_photos_json {
  String key;
  List<ListInvoice> listInvoice;

  Insert_photos_json({this.key, this.listInvoice});

  Insert_photos_json.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    if (json['list_invoice'] != null) {
      listInvoice = <ListInvoice>[];
      json['list_invoice'].forEach((v) {
        listInvoice.add(new ListInvoice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    if (this.listInvoice != null) {
      data['list_invoice'] = this.listInvoice.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListInvoice {
  int userId;
  int employeeId;
  int customerId;
  String storeId;
  int batteryLife;
  int androidVersion;
  int appVersion;
  String supervisorNote;
  String salesmanagerNote;
  String latitude;
  String longitude;

  ListInvoice(
      {this.userId,
        this.employeeId,
        this.customerId,
        this.storeId,
        this.batteryLife,
        this.androidVersion,
        this.appVersion,
        this.supervisorNote,
        this.salesmanagerNote,
        this.latitude,
        this.longitude});

  ListInvoice.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employeeId = json['employee_id'];
    customerId = json['customer_id'];
    storeId = json['store_id'];
    batteryLife = json['battery_life'];
    androidVersion = json['android_version'];
    appVersion = json['app_version'];
    supervisorNote = json['supervisor_note'];
    salesmanagerNote = json['salesmanager_note'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['customer_id'] = this.customerId;
    data['store_id'] = this.storeId;
    data['battery_life'] = this.batteryLife;
    data['android_version'] = this.androidVersion;
    data['app_version'] = this.appVersion;
    data['supervisor_note'] = this.supervisorNote;
    data['salesmanager_note'] = this.salesmanagerNote;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
