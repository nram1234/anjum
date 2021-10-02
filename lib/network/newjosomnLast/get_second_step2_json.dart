class Get_second_step2_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_second_step2_json({this.message, this.codenum, this.status, this.result});

  Get_second_step2_json.fromJson(Map<String, dynamic> json) {
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
  List<PriceListsInfo> priceListsInfo;

  Result({this.priceListsInfo});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['price_lists_info'] != null) {
      priceListsInfo = new List<PriceListsInfo>();
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
  String id;
  String userId;
  String priceListId;
  String itemId;
  String sellingPrice;
  String toPrice;
  String discount;
  String taxStatus;
  String useInSales;
  String useInReturn;
  String unit;
  String unitID;

  PriceListsInfo(
      {this.id,
        this.userId,
        this.priceListId,
        this.itemId,
        this.sellingPrice,
        this.toPrice,
        this.discount,
        this.taxStatus,
        this.useInSales,
        this.useInReturn,
        this.unit,
        this.unitID});

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
