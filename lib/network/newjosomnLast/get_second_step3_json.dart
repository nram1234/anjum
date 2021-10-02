class Get_second_step3_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_second_step3_json({this.message, this.codenum, this.status, this.result});

  Get_second_step3_json.fromJson(Map<String, dynamic> json) {
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
  List<ItemUnits> itemUnits;

  Result({this.itemUnits});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['item_units'] != null) {
      itemUnits = new List<ItemUnits>();
      json['item_units'].forEach((v) {
        itemUnits.add(new ItemUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemUnits != null) {
      data['item_units'] = this.itemUnits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemUnits {
  String id;
  String userId;
  String itemId;
  String itemBarcodes;
  String itemMeasurementUnits;
  String unitTypeId;
  String noOfPiece;
  String defaultValue;
  String createdAt;
  String updatedAt;

  ItemUnits(
      {this.id,
        this.userId,
        this.itemId,
        this.itemBarcodes,
        this.itemMeasurementUnits,
        this.unitTypeId,
        this.noOfPiece,
        this.defaultValue,
        this.createdAt,
        this.updatedAt});

  ItemUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemId = json['item_id'];
    itemBarcodes = json['item_barcodes'];
    itemMeasurementUnits = json['item_measurement_units'];
    unitTypeId = json['unit_type_id'];
    noOfPiece = json['no_of_piece'];
    defaultValue = json['default_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_id'] = this.itemId;
    data['item_barcodes'] = this.itemBarcodes;
    data['item_measurement_units'] = this.itemMeasurementUnits;
    data['unit_type_id'] = this.unitTypeId;
    data['no_of_piece'] = this.noOfPiece;
    data['default_value'] = this.defaultValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
