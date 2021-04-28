/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String name;
  String address;
  String mobileNo;
  String customers;
  String time;
  String date;
  String time1;
  String date1;

  FeedbackForm(this.name, this.mobileNo, this.address, this.customers, this.date, this.time, this.date1, this.time1, );

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['mobileNo']}",
        "${json['address']}", "${json['customers']}","${json['date']}","${json['time']}",
      "${json['date1']}", "${json['time1']}",);
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'address': address,
    'mobileNo': mobileNo,
    'customers': customers,
    'date': date,
    'time': time,
    'date1': date1,
    'time1': time1



  };
}