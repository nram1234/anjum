final String insert_cheque_tabelname="insert_cheque";
final String insert_cheque_Column_user_id="user_id";
final String insert_cheque_Column_searialno="searialno";
final String insert_cheque_Column_employee_id="employee_id";
final String insert_cheque_Column_customer_id="customer_id";
final String insert_cheque_Column_supervisor_id="supervisor_id";
final String insert_cheque_Column_salesmanager_id="salesmanager_id";
final String insert_cheque_Column_payment_type="payment_type";
final String insert_cheque_Column_amount="amount";
final String insert_cheque_Column_customer_name="customer_name";
final String insert_cheque_Column_salesman_name="salesman_name";
final String insert_cheque_Column_payment_date="payment_date";
final String insert_cheque_Column_payment_no="payment_no";
final String insert_cheque_Column_reference_no="reference_no";
final String insert_cheque_Column_bank_id="bank_id";
final String insert_cheque_Column_branch_id="branch_id";
final String insert_cheque_Column_drawer_name="drawer_name";
final String insert_cheque_Column_cheque_no="cheque_no";
final String insert_cheque_Column_due_date="due_date";
final String insert_cheque_Column_note="note";


class Insert_cheque_DB {
late int user_id;
late int employee_id;
late int customer_id;
late int supervisor_id;
late int salesmanager_id;
late String payment_type;
late double amount;
late String customer_name;
late String salesman_name;
late String payment_date;
late String payment_no;
late String reference_no;
late int bank_id;
late int branch_id;
late String drawer_name;
late int cheque_no;
late String due_date;
late String note;
late String searialno;
  Insert_cheque_DB(
      {required this.user_id,
       required  this.employee_id,required this.searialno,
       required  this.customer_id,
       required  this.supervisor_id,
       required  this.salesmanager_id,
       required  this.payment_type,
       required  this.amount,
       required  this.customer_name,
       required  this.salesman_name,
       required  this.payment_date,
       required  this.payment_no,
       required  this.reference_no,
       required  this.bank_id,
       required  this.branch_id,
       required  this.drawer_name,
       required  this.cheque_no,
       required  this.due_date,
       required  this.note});

  Insert_cheque_DB.fromJson(Map<String, dynamic> json) {
    searialno = json['searialno'];
    user_id = json['user_id'];
    employee_id = json['employee_id'];
    customer_id = json['customer_id'];
    supervisor_id = json['supervisor_id'];
    salesmanager_id = json['salesmanager_id'];
    payment_type = json['payment_type'];
    amount = json['amount'];
    customer_name = json['customer_name'];
    salesman_name = json['salesman_name'];
    payment_date = json['payment_date'];
    payment_no = json['payment_no'];
    reference_no = json['reference_no'];
    bank_id = json['bank_id'];
    branch_id = json['branch_id'];
    drawer_name = json['drawer_name'];
    cheque_no = json['cheque_no'];
    due_date = json['due_date'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  data['searialno'] = this.searialno;
    data['user_id'] = this.user_id;
    data['employee_id'] = this.employee_id;
    data['customer_id'] = this.customer_id;
    data['supervisor_id'] = this.supervisor_id;
    data['salesmanager_id'] = this.salesmanager_id;
    data['payment_type'] = this.payment_type;
    data['amount'] = this.amount;
    data['customer_name'] = this.customer_name;
    data['salesman_name'] = this.salesman_name;
    data['payment_date'] = this.payment_date;
    data['payment_no'] = this.payment_no;
    data['reference_no'] = this.reference_no;
    data['bank_id'] = this.bank_id;
    data['branch_id'] = this.branch_id;
    data['drawer_name'] = this.drawer_name;
    data['cheque_no'] = this.cheque_no;
    data['due_date'] = this.due_date;
    data['note'] = this.note;
    return data;
  }
}
