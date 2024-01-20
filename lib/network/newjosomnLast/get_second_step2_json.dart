class Get_second_step2_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_second_step2_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_second_step2_json.fromJson(Map<String, dynamic> json) {
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
late  List<PriceListsInfo> priceListsInfo;

  Result({required this.priceListsInfo});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['price_lists_info'] != null) {
      priceListsInfo = [];
      json['price_lists_info'].forEach((v) {
        priceListsInfo.add(new PriceListsInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.priceListsInfo != null) {
      data['price_lists_info'] =
          this.priceListsInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceListsInfo {
late String id;
late String userId;
late String priceListId;
late String itemId;
late String sellingPrice;
late String toPrice;
late String discount;
late String taxStatus;
late String useInSales;
late String useInReturn;
late String unit;
late String unitID;

  PriceListsInfo(
      {required this.id,
       required  this.userId,
       required  this.priceListId,
       required  this.itemId,
       required  this.sellingPrice,
       required  this.toPrice,
       required  this.discount,
       required  this.taxStatus,
       required  this.useInSales,
       required  this.useInReturn,
       required  this.unit,
       required  this.unitID});

  PriceListsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    priceListId = json['price_list_id'];
    itemId = json['item_id'];
    sellingPrice = json['selling_price'];
    toPrice = json['to_price'];
    discount = json['discount'];
    taxStatus = json['tax_status'];
    useInSales = json['use_in_sales'];
    useInReturn = json['use_in_return'];
    unit = json['unit'];
    unitID = json['Unit_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['price_list_id'] = this.priceListId;
    data['item_id'] = this.itemId;
    data['selling_price'] = this.sellingPrice;
    data['to_price'] = this.toPrice;
    data['discount'] = this.discount;
    data['tax_status'] = this.taxStatus;
    data['use_in_sales'] = this.useInSales;
    data['use_in_return'] = this.useInReturn;
    data['unit'] = this.unit;
    data['Unit_ID'] = this.unitID;
    return data;
  }
}
