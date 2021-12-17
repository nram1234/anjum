class InsertEmployeeVisitPhotosJson {
  String message;
  int codenum;
  bool status;
  int visitId;

  InsertEmployeeVisitPhotosJson(
      {this.message, this.codenum, this.status, this.visitId});

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
