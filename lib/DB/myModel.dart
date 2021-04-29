
enum AdminType { Admin ,Sub_Admin }
enum StatusType { Active ,Inactive }

class adminsModel{


int id;
AdminType admin_type;
String name;
String email;
String phone_no;
String image;
String password;

String decoded_password;
String remember_token;
StatusType status;
int created_at;
int updated_at;

adminsModel(
      {this.id,
      this.admin_type,
      this.name,
      this.email,
      this.phone_no,
      this.image,
      this.password,
      this.decoded_password,
      this.remember_token,
      this.status,
      this.created_at,
      this.updated_at});
}

class Alternate_Items_Model{


  int id;
  int user_id;
  int item_id;
  int alt_item_id;
  int created_at;
  int updated_at;

  Alternate_Items_Model(
      {this.id,
      this.user_id,
      this.item_id,
      this.alt_item_id,
      this.created_at,
      this.updated_at});
}

class Banks_Model{


  int id;
  int user_id;
  String bank_name_en;
  String bank_name_ar;

  String note;
  String status;

  int updated_at;
  String remember_token;

  Banks_Model(
      {this.id,
      this.user_id,
      this.bank_name_en,
      this.bank_name_ar,
      this.note,
      this.status,
      this.updated_at,
      this.remember_token});
}

class Bank_Branches_Model{


  int id;
  int bank_id;
  int user_id;


  String branch_name_en;
  String branch_name_ar;

  String phone_no;
  String fax_no;

  String email;
  String area_1;

  String area_2;
  int state_id;

  int city_id;

  String contact_person;
  String note;
  StatusType status;

  int created_at;
  int updated_at;

  Bank_Branches_Model(
      {this.id,
      this.bank_id,
      this.user_id,
      this.branch_name_en,
      this.branch_name_ar,
      this.phone_no,
      this.fax_no,
      this.email,
      this.area_1,
      this.area_2,
      this.state_id,
      this.city_id,
      this.contact_person,
      this.note,
      this.status,
      this.created_at,
      this.updated_at});
}