
enum AdminType { Admin ,Sub_Admin }
enum StatusType { Active ,Inactive }

class AdminsModel{


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

AdminsModel(
      {
        this.id,
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
AdminsModel.fromJson(Map<String, dynamic> json) {
  id=json['id'];
  admin_type=json['admin_type'];
  name=json['name'];
  email=json['email'];
  phone_no=json['phone_no'];
  image=json['image'];
  password=json['password'];
  decoded_password=json['decoded_password'];
  remember_token=json['remember_token'];
  status=json['status'];
  created_at=json['created_at'];
  updated_at=json['updated_at'];



}
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['admin_type'] = this.admin_type;

  data['name'] = this.name;
  data['email'] = this.email;
  data['phone_no'] = this.phone_no;
  data['image'] = this.image;

  data['password'] = this.password;
  data['decoded_password'] = this.decoded_password;

  data['remember_token'] = this.remember_token;
  data['status'] = this.status;

  data['created_at'] = this.created_at;
  data['updated_at'] = this.updated_at;


}
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



  Alternate_Items_Model.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    user_id=json['user_id'];
    item_id=json['item_id'];
    alt_item_id=json['alt_item_id'];
    created_at=json['created_at'];
    updated_at=json['updated_at'];




  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['item_id'] = this.item_id;
    data['alt_item_id'] = this.alt_item_id;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;



  }
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




  Banks_Model.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    user_id=json['user_id'];
    bank_name_en=json['bank_name_en'];
    bank_name_ar=json['bank_name_ar'];
    note=json['note'];
    status=json['status'];
    updated_at=json['updated_at'];
    remember_token=json['remember_token'];





  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['bank_name_en'] = this.bank_name_en;
    data['bank_name_ar'] = this.bank_name_ar;
    data['note'] = this.note;
    data['status'] = this.status;



  }
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

  Bank_Branches_Model.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    bank_id=json['bank_id'];
    user_id=json['user_id'];
    branch_name_en=json['branch_name_en'];
    phone_no=json['phone_no'];
    branch_name_ar=json['branch_name_ar'];
    fax_no=json['fax_no'];
    decoded_password=json['decoded_password'];
    remember_token=json['remember_token'];
    status=json['status'];
    created_at=json['created_at'];
    updated_at=json['updated_at'];



  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_type'] = this.admin_type;

    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phone_no;
    data['image'] = this.image;

    data['password'] = this.password;
    data['decoded_password'] = this.decoded_password;

    data['remember_token'] = this.remember_token;
    data['status'] = this.status;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;


  }
}