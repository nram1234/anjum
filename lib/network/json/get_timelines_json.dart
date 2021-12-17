class GetTimelinesJson {
  String message;
  int codenum;
  bool status;
  Result result;

  GetTimelinesJson({this.message, this.codenum, this.status, this.result});

  GetTimelinesJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<TotalTimelines> totalTimelines;

  Result({this.totalTimelines});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['total_timelines'] != null) {
      totalTimelines = new List<TotalTimelines>();
      json['total_timelines'].forEach((v) {
        totalTimelines.add(new TotalTimelines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalTimelines != null) {
      data['total_timelines'] =
          this.totalTimelines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalTimelines {
  String id;
  String contentId;
  String contentType;
  String visitId;
  String employeeId;
  String customerId;
  String batteryLife;
  String androidVersion;
  String appVersion;
  String latitude;
  String longitude;
  String creationDate;

  TotalTimelines(
      {this.id,
        this.contentId,
        this.contentType,
        this.visitId,
        this.employeeId,
        this.customerId,
        this.batteryLife,
        this.androidVersion,
        this.appVersion,
        this.latitude,
        this.longitude,
        this.creationDate});

  TotalTimelines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contentId = json['content_id'];
    contentType = json['content_type'];
    visitId = json['visit_id'];
    employeeId = json['employee_id'];
    customerId = json['customer_id'];
    batteryLife = json['battery_life'];
    androidVersion = json['android_version'];
    appVersion = json['app_version'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    creationDate = json['creation_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content_id'] = this.contentId;
    data['content_type'] = this.contentType;
    data['visit_id'] = this.visitId;
    data['employee_id'] = this.employeeId;
    data['customer_id'] = this.customerId;
    data['battery_life'] = this.batteryLife;
    data['android_version'] = this.androidVersion;
    data['app_version'] = this.appVersion;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['creation_date'] = this.creationDate;
    return data;
  }
}
