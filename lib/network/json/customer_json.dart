class Customer_json {
  List<Customers> customers;

  Customer_json({this.customers});

  Customer_json.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['customers'] = this.customers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  String customerNameEn;
  String customerNameAr;
  String location;
  String image;

  Customers(
      {this.customerNameEn, this.customerNameAr, this.location, this.image});

  Customers.fromJson(Map<String, dynamic> json) {
    customerNameEn = json['customer_name_en'];
    customerNameAr = json['customer_name_ar'];
    location = json['location'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name_en'] = this.customerNameEn;
    data['customer_name_ar'] = this.customerNameAr;
    data['location'] = this.location;
    data['image'] = this.image;
    return data;
  }
}
