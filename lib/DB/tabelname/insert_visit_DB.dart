final String insert_visit_DB_tabelname="insert_cheque";
final String insert_visit_DB_Column_user_id="user_id";
final String insert_visit_DB_Column_employee_id="employee_id";
final String insert_visit_DB_Column_customer_id="customer_id";
final String insert_visit_DB_Column_start_lat="start_lat";
final String insert_visit_DB_Column_start_lang="start_lang";
final String insert_visit_DB_Column_end_lat="end_lat";

final String insert_visit_DB_Column_end_lang="end_lang";
final String insert_visit_DB_Column_start_date="start_date";
final String insert_visit_DB_Column_end_date="end_date";
final String insert_visit_DB_Column_current_visit_status="current_visit_status";
final String insert_visit_DB_Column_visit_type="visit_type";


class insert_visit_DB {
  String user_id;
  String employ_id;
  String customer_id;
  String start_lat;
  String start_lang;
  String end_lat;
  String end_lang;
  String start_date;
  String end_date;
  String current_visit_status;

  String visit_type;

  insert_visit_DB(
      {this.user_id,
        this.employ_id,
        this.start_lat,
        this.start_lang,
        this.end_lat,
        this.end_lang,
        this.start_date,
        this.end_date,
        this.current_visit_status,
        this.customer_id,
        this.visit_type});

  insert_visit_DB.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    employ_id = json['employ_id'];
    start_lat = json['start_lat'];
    start_lang = json['start_lang'];
    end_lat = json['end_lat'];
    end_lang = json['end_lang'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    current_visit_status = json['current_visit_status'];
    customer_id = json['customer_id'];
    visit_type = json['visit_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['employ_id'] = this.employ_id;
    data['start_lat'] = this.start_lat;
    data['start_lang'] = this.start_lang;
    data['end_lat'] = this.end_lat;
    data['end_lang'] = this.end_lang;
    data['start_date'] = this.start_date;
    data['end_date'] = this.end_date;
    data['current_visit_status'] = this.current_visit_status;
    data['customer_id'] = this.customer_id;
    data['visit_type'] = this.visit_type;
    return data;
  }
}
