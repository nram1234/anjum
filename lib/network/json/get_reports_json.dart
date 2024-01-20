class Get_Reports_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_Reports_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_Reports_json.fromJson(Map<String, dynamic> json) {
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
 late Reports reports;

  Result({required this.reports});

  Result.fromJson(Map<String, dynamic> json) {
    reports =
    (json['reports'] != null ? new Reports.fromJson(json['reports']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reports != null) {
      data['reports'] = this.reports.toJson();
    }
    return data;
  }
}

class Reports {
late  String totalInvoice;
late  String totalSales;
late  String totalReturnInvoice;
late  String totalCash;
late  String totalCheque;
late  String totalInvoiceValue;
late  String totalSalesValue;
late  String totalReturnInvoiceValue;
late  String totalCashValue;
late  String totalChequeValue;

  Reports(
      {required this.totalInvoice,
       required  this.totalSales,
       required  this.totalReturnInvoice,
       required  this.totalCash,
       required  this.totalCheque,
       required  this.totalInvoiceValue,
       required  this.totalSalesValue,
       required  this.totalReturnInvoiceValue,
       required  this.totalCashValue,
       required  this.totalChequeValue});

  Reports.fromJson(Map<String, dynamic> json) {
    totalInvoice = json['total_invoice'].toString();
    totalSales = json['total_sales'].toString();
    totalReturnInvoice = json['total_return_invoice'].toString();
    totalCash = json['total_cash'].toString();
    totalCheque = json['total_cheque'].toString();
    totalInvoiceValue = json['total_invoice_value'].toString();
    totalSalesValue = json['total_sales_value'].toString();
    totalReturnInvoiceValue = json['total_return_invoice_value'].toString();
    totalCashValue = json['total_cash_value'].toString();
    totalChequeValue = json['total_cheque_value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_invoice'] = this.totalInvoice;
    data['total_sales'] = this.totalSales;
    data['total_return_invoice'] = this.totalReturnInvoice;
    data['total_cash'] = this.totalCash;
    data['total_cheque'] = this.totalCheque;
    data['total_invoice_value'] = this.totalInvoiceValue;
    data['total_sales_value'] = this.totalSalesValue;
    data['total_return_invoice_value'] = this.totalReturnInvoiceValue;
    data['total_cash_value'] = this.totalCashValue;
    data['total_cheque_value'] = this.totalChequeValue;
    return data;
  }
}
