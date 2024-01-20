class GetTimelinesJson {
late  String message;
late  int codenum;
late  bool status;
late  Result result;

  GetTimelinesJson({required this.message,required this.codenum,required this.status,required this.result});

  GetTimelinesJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    (json['result'] != null ? new Result.fromJson(json['result']) : null)!;
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
late  List<TotalTimelines> totalTimelines;

  Result({required this.totalTimelines});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['total_timelines'] != null) {
      totalTimelines = [];
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
late  String id;
late  String contentId;
late  String contentType;
late  String visitId;
late  String employeeId;
late  String customerId;
late  String batteryLife;
late  String androidVersion;
late  String appVersion;
late  String latitude;
late  String longitude;
late  String creationDate;

  TotalTimelines(
      {required this.id,
       required  this.contentId,
       required  this.contentType,
       required  this.visitId,
       required  this.employeeId,
       required  this.customerId,
       required  this.batteryLife,
       required  this.androidVersion,
       required  this.appVersion,
       required  this.latitude,
       required  this.longitude,
       required  this.creationDate});

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
