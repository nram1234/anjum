class Login_json {
late  User  user;
late  Permissions  permissions;
late  String  token;

  Login_json({required this.user,required this.permissions,required this.token});

  Login_json.fromJson(Map<String, dynamic> json) {
    user =   User.fromJson(json['user']) ;
    permissions =  Permissions.fromJson(json['permissions']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
late  int id;
late  int userId;
late  String refId;
late  String employeeNameEn;
late  String employeeNameAr;
late  String phoneNo;
late  String username;
late  String password;
late  String email;
late  int type;
late  String customerId;
late  int businessUnitId;
late  String appDeviceId;
late  String groupType;
late  String reference;
late  String vehicle;
late  String collectPercent;
late  String salesCommission;
late  String salary;
late  String insurance;
late  String socialSecurity;
late  String cashBoxAccount;
late  String debitAmount;
late  String storeId;
late  int supervisorId;
late  int salesmanagerId;
late  String address;
late  String image;
late  String status;
late  String onlineStatus;

  User(
      {required this.id,
       required this.userId,
       required this.refId,
       required this.employeeNameEn,
       required this.employeeNameAr,
       required this.phoneNo,
       required this.username,
       required this.password,
       required this.email,
       required this.type,
       required this.customerId,
       required this.businessUnitId,
       required this.appDeviceId,
       required this.groupType,
       required this.reference,
       required this.vehicle,
       required this.collectPercent,
       required this.salesCommission,
       required this.salary,
       required this.insurance,
       required this.socialSecurity,
       required this.cashBoxAccount,
       required this.debitAmount,
       required this.storeId,
       required this.supervisorId,
       required this.salesmanagerId,
       required this.address,
       required this.image,
       required this.status,
       required this.onlineStatus});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    refId = json['ref_id'];
    employeeNameEn = json['employee_name_en'];
    employeeNameAr = json['employee_name_ar'];
    phoneNo = json['phone_no'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    type = json['type'];
    customerId = json['customer_id'];
    businessUnitId = json['business_unit_id'];
    appDeviceId = json['app_device_id'];
    groupType = json['group_type'];
    reference = json['reference'];
    vehicle = json['vehicle'];
    collectPercent = json['collect_percent'];
    salesCommission = json['sales_commission'];
    salary = json['salary'];
    insurance = json['insurance'];
    socialSecurity = json['social_security'];
    cashBoxAccount = json['cash_box_account'];
    debitAmount = json['debit_amount'];
    storeId = json['store_id'];
    supervisorId = json['supervisor_id'];
    salesmanagerId = json['salesmanager_id'];
    address = json['address'];
    image = json['image'];
    status = json['status'];
    onlineStatus = json['online_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ref_id'] = this.refId;
    data['employee_name_en'] = this.employeeNameEn;
    data['employee_name_ar'] = this.employeeNameAr;
    data['phone_no'] = this.phoneNo;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['type'] = this.type;
    data['customer_id'] = this.customerId;
    data['business_unit_id'] = this.businessUnitId;
    data['app_device_id'] = this.appDeviceId;
    data['group_type'] = this.groupType;
    data['reference'] = this.reference;
    data['vehicle'] = this.vehicle;
    data['collect_percent'] = this.collectPercent;
    data['sales_commission'] = this.salesCommission;
    data['salary'] = this.salary;
    data['insurance'] = this.insurance;
    data['social_security'] = this.socialSecurity;
    data['cash_box_account'] = this.cashBoxAccount;
    data['debit_amount'] = this.debitAmount;
    data['store_id'] = this.storeId;
    data['supervisor_id'] = this.supervisorId;
    data['salesmanager_id'] = this.salesmanagerId;
    data['address'] = this.address;
    data['image'] = this.image;
    data['status'] = this.status;
    data['online_status'] = this.onlineStatus;
    return data;
  }
}

class Permissions {
late String invoice;
late String returnInvoice;
late String order;
late String payment;
late String stockTaking;
late String loadItems;
late String unloadItems;
late String takePhoto;
late String beforeAfterPhoto;
late String note;
late String survey;
late String loadRequestAcceptReject;
late String unloadRequestAcceptReject;
late String salesOrderRequestAcceptReject;
late String salesOrderToPrice;
late String requestToExceedCustomerCreditLimit;
late String requestToExceedChequeDueDateLimit;
late String requestToReturnInvoice;
late String requestToOrdersApproval;
late String requestToChangeInvoicePaymentType;
late String requestToExceedCustomerInvoiceNumber;
late String requestToVisitCustomerNotInRoute;
late String requestForCustomerLoginWithoutVerification;
late String employeeAddDrawersFromApp;
late String addBonus;
late String addItemDiscount;
late String addVoucherDiscount;
late String addCustomer;
late String displayProductQuantity;
late String displayStores;

  Permissions(
      {required this.invoice,
       required  this.returnInvoice,
       required  this.order,
       required  this.payment,
       required  this.stockTaking,
       required  this.loadItems,
       required  this.unloadItems,
       required  this.takePhoto,
       required  this.beforeAfterPhoto,
       required  this.note,
       required  this.survey,
       required  this.loadRequestAcceptReject,
       required  this.unloadRequestAcceptReject,
       required  this.salesOrderRequestAcceptReject,
       required  this.salesOrderToPrice,
       required  this.requestToExceedCustomerCreditLimit,
       required  this.requestToExceedChequeDueDateLimit,
       required  this.requestToReturnInvoice,
       required  this.requestToOrdersApproval,
       required  this.requestToChangeInvoicePaymentType,
       required  this.requestToExceedCustomerInvoiceNumber,
       required  this.requestToVisitCustomerNotInRoute,
       required  this.requestForCustomerLoginWithoutVerification,
       required  this.employeeAddDrawersFromApp,
       required  this.addBonus,
       required  this.addItemDiscount,
       required  this.addVoucherDiscount,
       required  this.addCustomer,
       required  this.displayProductQuantity,
       required  this.displayStores});

  Permissions.fromJson(Map<dynamic, dynamic> json) {
    invoice = json['invoice'];
    returnInvoice = json['return_invoice'];
    order = json['order'];
    payment = json['payment'];
    stockTaking = json['stock_taking'];
    loadItems = json['load_items'];
    unloadItems = json['unload_items'];
    takePhoto = json['take_photo'];
    beforeAfterPhoto = json['before_after_photo'];
    note = json['note'];
    survey = json['survey'];
    loadRequestAcceptReject = json['load_request_accept_reject'];
    unloadRequestAcceptReject = json['unload_request_accept_reject'];
    salesOrderRequestAcceptReject = json['sales_order_request_accept_reject'];
    salesOrderToPrice = json['sales_order_to_price'];
    requestToExceedCustomerCreditLimit =
    json['request_to_exceed_customer_credit_limit'];
    requestToExceedChequeDueDateLimit =
    json['request_to_exceed_cheque_due_date_limit'];
    requestToReturnInvoice = json['request_to_return_invoice'];
    requestToOrdersApproval = json['request_to_orders_approval'];
    requestToChangeInvoicePaymentType =
    json['request_to_change_invoice_payment_type'];
    requestToExceedCustomerInvoiceNumber =
    json['request_to_exceed_customer_invoice_number'];
    requestToVisitCustomerNotInRoute =
    json['request_to_visit_customer_not_in_route'];
    requestForCustomerLoginWithoutVerification =
    json['request_for_customer_login_without_verification'];
    employeeAddDrawersFromApp = json['employee_add_drawers_from_app'];
    addBonus = json['add_bonus'];
    addItemDiscount = json['add_item_discount'];
    addVoucherDiscount = json['add_voucher_discount'];
    addCustomer = json['add_customer'];
    displayProductQuantity = json['display_product_quantity'];
    displayStores = json['Display Stores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice'] = this.invoice;
    data['return_invoice'] = this.returnInvoice;
    data['order'] = this.order;
    data['payment'] = this.payment;
    data['stock_taking'] = this.stockTaking;
    data['load_items'] = this.loadItems;
    data['unload_items'] = this.unloadItems;
    data['take_photo'] = this.takePhoto;
    data['before_after_photo'] = this.beforeAfterPhoto;
    data['note'] = this.note;
    data['survey'] = this.survey;
    data['load_request_accept_reject'] = this.loadRequestAcceptReject;
    data['unload_request_accept_reject'] = this.unloadRequestAcceptReject;
    data['sales_order_request_accept_reject'] =
        this.salesOrderRequestAcceptReject;
    data['sales_order_to_price'] = this.salesOrderToPrice;
    data['request_to_exceed_customer_credit_limit'] =
        this.requestToExceedCustomerCreditLimit;
    data['request_to_exceed_cheque_due_date_limit'] =
        this.requestToExceedChequeDueDateLimit;
    data['request_to_return_invoice'] = this.requestToReturnInvoice;
    data['request_to_orders_approval'] = this.requestToOrdersApproval;
    data['request_to_change_invoice_payment_type'] =
        this.requestToChangeInvoicePaymentType;
    data['request_to_exceed_customer_invoice_number'] =
        this.requestToExceedCustomerInvoiceNumber;
    data['request_to_visit_customer_not_in_route'] =
        this.requestToVisitCustomerNotInRoute;
    data['request_for_customer_login_without_verification'] =
        this.requestForCustomerLoginWithoutVerification;
    data['employee_add_drawers_from_app'] = this.employeeAddDrawersFromApp;
    data['add_bonus'] = this.addBonus;
    data['add_item_discount'] = this.addItemDiscount;
    data['add_voucher_discount'] = this.addVoucherDiscount;
    data['add_customer'] = this.addCustomer;
    data['display_product_quantity'] = this.displayProductQuantity;
    data['Display Stores'] = this.displayStores;
    return data;
  }
}
