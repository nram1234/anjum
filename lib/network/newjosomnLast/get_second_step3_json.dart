class Get_second_step3_json {
late String message;
late int codenum;
late bool status;
late Result result;

  Get_second_step3_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_second_step3_json.fromJson(Map<String, dynamic> json) {
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
late List<ItemUnits> itemUnits;

  Result({required this.itemUnits});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['item_units'] != null) {
      itemUnits =[];
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
late String id;
late String userId;
late String itemId;
late String itemBarcodes;
late String itemMeasurementUnits;
late String unitTypeId;
late String noOfPiece;
late String defaultValue;
late String createdAt;
late String updatedAt;

  ItemUnits(
      {required this.id,
       required  this.userId,
       required  this.itemId,
       required  this.itemBarcodes,
       required  this.itemMeasurementUnits,
       required  this.unitTypeId,
       required  this.noOfPiece,
       required  this.defaultValue,
       required  this.createdAt,
       required  this.updatedAt});

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
