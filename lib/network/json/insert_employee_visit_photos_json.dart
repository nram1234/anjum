class InsertEmployeeVisitPhotosJson {
late  String message;
late  int codenum;
late  bool status;
late  int visitId;

  InsertEmployeeVisitPhotosJson(
      {required this.message,required this.codenum,required this.status,required this.visitId});

  InsertEmployeeVisitPhotosJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    visitId = json['visit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    data['visit_id'] = this.visitId;
    return data;
  }
}
