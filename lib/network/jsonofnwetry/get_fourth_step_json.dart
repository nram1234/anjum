class Get_fourth_step_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_fourth_step_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_fourth_step_json.fromJson(Map<String, dynamic> json) {
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
late  UserData userData;
late  List<AllCurrencies> allCurrencies;
late  List<AllBanks> allBanks;
late  List<AllCheques> allCheques;

  Result({required this.userData,required this.allCurrencies, required this.allBanks,required this.allCheques});

  Result.fromJson(Map<String, dynamic> json) {
    userData = (json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null)!;
    if (json['all_currencies'] != null) {
      allCurrencies = [];
      json['all_currencies'].forEach((v) {
        allCurrencies.add(new AllCurrencies.fromJson(v));
      });
    }
    if (json['all_banks'] != null) {
      allBanks = [];
      json['all_banks'].forEach((v) {
        allBanks.add(new AllBanks.fromJson(v));
      });
    }
    if (json['all_cheques'] != null) {
      allCheques =[];
      json['all_cheques'].forEach((v) {
        allCheques.add(new AllCheques.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData.toJson();
    }
    if (this.allCurrencies != null) {
      data['all_currencies'] =
          this.allCurrencies.map((v) => v.toJson()).toList();
    }
    if (this.allBanks != null) {
      data['all_banks'] = this.allBanks.map((v) => v.toJson()).toList();
    }
    if (this.allCheques != null) {
      data['all_cheques'] = this.allCheques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
 late String branchNameEn;
 late String branchNameAr;
 late String branchLocation;
 late String companyId;
 late String area1;
 late String locationLat;
 late String locationLng;
 late String email;
 late String area2;
 late String cityId;
 late String stateId;
 late String countryId;
 late String currency;
 late String phoneNo;
 late String faxNo;
 late String vatNo;
 late String taxableStatus;
 late String rememberToken;

  UserData(
      {required this.branchNameEn,
       required  this.branchNameAr,
       required  this.branchLocation,
       required  this.companyId,
       required  this.area1,
       required  this.locationLat,
       required  this.locationLng,
       required  this.email,
       required  this.area2,
       required  this.cityId,
       required  this.stateId,
       required  this.countryId,
       required  this.currency,
       required  this.phoneNo,
       required  this.faxNo,
       required  this.vatNo,
       required  this.taxableStatus,
       required  this.rememberToken});

  UserData.fromJson(Map<String, dynamic> json) {
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
    branchLocation = json['branch_location'];
    companyId = json['company_id'];
    area1 = json['area_1'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    email = json['email'];
    area2 = json['area_2'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    currency = json['currency'];
    phoneNo = json['phone_no'];
    faxNo = json['fax_no'];
    vatNo = json['vat_no'];
    taxableStatus = json['taxable_status'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
    data['branch_location'] = this.branchLocation;
    data['company_id'] = this.companyId;
    data['area_1'] = this.area1;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['email'] = this.email;
    data['area_2'] = this.area2;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['currency'] = this.currency;
    data['phone_no'] = this.phoneNo;
    data['fax_no'] = this.faxNo;
    data['vat_no'] = this.vatNo;
    data['taxable_status'] = this.taxableStatus;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}

class AllCurrencies {
 late String currencyName;
 late String currencyCode;
 late String currencyRate;
 late String currencyPrecision;
 late String currencySymbol;
 late String currencySymbolFirst;
 late String currencyDecimalMark;
 late String currencyThousandsSeparator;

  AllCurrencies(
      {required this.currencyName,
       required  this.currencyCode,
       required  this.currencyRate,
       required  this.currencyPrecision,
       required  this.currencySymbol,
       required  this.currencySymbolFirst,
       required  this.currencyDecimalMark,
       required  this.currencyThousandsSeparator});

  AllCurrencies.fromJson(Map<String, dynamic> json) {
    currencyName = json['currency_name'];
    currencyCode = json['currency_code'];
    currencyRate = json['currency_rate'];
    currencyPrecision = json['currency_precision'];
    currencySymbol = json['currency_symbol'];
    currencySymbolFirst = json['currency_symbol_first'];
    currencyDecimalMark = json['currency_decimal_mark'];
    currencyThousandsSeparator = json['currency_thousands_separator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_name'] = this.currencyName;
    data['currency_code'] = this.currencyCode;
    data['currency_rate'] = this.currencyRate;
    data['currency_precision'] = this.currencyPrecision;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_symbol_first'] = this.currencySymbolFirst;
    data['currency_decimal_mark'] = this.currencyDecimalMark;
    data['currency_thousands_separator'] = this.currencyThousandsSeparator;
    return data;
  }
}

class AllBanks {
 late String id;
 late String bankNameEn;
 late String bankNameAr;
 late String userId;
 late String note;
 late List<AllBankBranches> allBankBranches;

  AllBanks(
      {required this.id,
       required  this.bankNameEn,
       required  this.bankNameAr,
       required  this.userId,
       required  this.note,
       required  this.allBankBranches});

  AllBanks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankNameEn = json['bank_name_en'];
    bankNameAr = json['bank_name_ar'];
    userId = json['user_id'];
    note = json['note'];
    if (json['all_bank_branches'] != null) {
      allBankBranches =[];
      json['all_bank_branches'].forEach((v) {
        allBankBranches.add(new AllBankBranches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name_en'] = this.bankNameEn;
    data['bank_name_ar'] = this.bankNameAr;
    data['user_id'] = this.userId;
    data['note'] = this.note;
    if (this.allBankBranches != null) {
      data['all_bank_branches'] =
          this.allBankBranches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllBankBranches {
late String id;
late String bankId;
late String userId;
late String branchNameEn;
late String branchNameAr;
late String phoneNo;
late String faxNo;
late String email;
late String area1;
late String area2;
late String stateId;
late String cityId;
late String contactPerson;
late String note;

  AllBankBranches(
      {required  this.id,
       required   this.bankId,
       required   this.userId,
       required   this.branchNameEn,
       required   this.branchNameAr,
       required   this.phoneNo,
       required   this.faxNo,
       required   this.email,
       required   this.area1,
       required   this.area2,
       required   this.stateId,
       required   this.cityId,
       required   this.contactPerson,
       required   this.note});

  AllBankBranches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    userId = json['user_id'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
    phoneNo = json['phone_no'];
    faxNo = json['fax_no'];
    email = json['email'];
    area1 = json['area_1'];
    area2 = json['area_2'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    contactPerson = json['contact_person'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_id'] = this.bankId;
    data['user_id'] = this.userId;
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
    data['phone_no'] = this.phoneNo;
    data['fax_no'] = this.faxNo;
    data['email'] = this.email;
    data['area_1'] = this.area1;
    data['area_2'] = this.area2;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['contact_person'] = this.contactPerson;
    data['note'] = this.note;
    return data;
  }
}

class AllCheques {
 late String customerId;
 late String customerName;
 late String customerNameEn;
 late List<ListCheques> listCheques;

  AllCheques(
      {required this.customerId,
       required  this.customerName,
       required  this.customerNameEn,
       required  this.listCheques});

  AllCheques.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerNameEn = json['customer_name_en'];
    if (json['list_cheques'] != null) {
      listCheques =[];
      json['list_cheques'].forEach((v) {
        listCheques.add(new ListCheques.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_name_en'] = this.customerNameEn;
    if (this.listCheques != null) {
      data['list_cheques'] = this.listCheques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCheques {
late  String id;
late  String customerId;
late  String chequeDueDate;
late  String drawerName;
late  String bankId;
late  String bankNameEn;
late  String bankNameAr;
late  String branchNameEn;
late  String branchNameAr;

  ListCheques(
      {required this.id,
       required  this.customerId,
       required  this.chequeDueDate,
       required  this.drawerName,
       required  this.bankId,
       required  this.bankNameEn,
       required  this.bankNameAr,
       required  this.branchNameEn,
       required  this.branchNameAr});

  ListCheques.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    chequeDueDate = json['cheque_due_date'];
    drawerName = json['drawer_name'];
    bankId = json['bank_id'];
    bankNameEn = json['bank_name_en'];
    bankNameAr = json['bank_name_ar'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['cheque_due_date'] = this.chequeDueDate;
    data['drawer_name'] = this.drawerName;
    data['bank_id'] = this.bankId;
    data['bank_name_en'] = this.bankNameEn;
    data['bank_name_ar'] = this.bankNameAr;
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
    return data;
  }
}
