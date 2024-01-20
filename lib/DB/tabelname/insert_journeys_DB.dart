final String insert_journeys_DB_tabelname="insert_journeys";
final String insert_journeys_DB_Column_user_id="user_id";
final String insert_journeys_DB_Column_employee_id="employ_id";
final String insert_journeys_DB_Column_customer_id="customer_id";
final String insert_journeys_DB_Column_start_lat="start_lat";
final String insert_journeys_DB_Column_start_lang="start_lang";
final String insert_journeys_DB_Column_end_lat="end_lat";

final String insert_journeys_DB_Column_end_lang="end_lang";
final String insert_journeys_DB_Column_start_date="start_date";
final String insert_journeys_DB_Column_end_date="end_date";
final String insert_journeys_DB_Column_current_visit_status="current_visit_status";
final String insert_journeys_DB_Column_visit_type="visit_type";


class Insert_journeys_DB {
late String user_id;
late String employ_id;
late String customer_id;
late String start_lat;
late String start_lang;
late String end_lat;
late String end_lang;
late String start_date;
late String end_date;
late String current_visit_status;

 late String visit_type;

  Insert_journeys_DB(
      {required this.user_id,
       required  this.employ_id,
       required  this.start_lat,
       required  this.start_lang,
       required  this.end_lat,
       required  this.end_lang,
       required  this.start_date,
       required  this.end_date,
       required  this.current_visit_status,
       required  this.customer_id,
       required  this.visit_type});

  Insert_journeys_DB.fromJson(Map<String, dynamic> json) {
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
