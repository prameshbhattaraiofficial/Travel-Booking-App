class BookModel {

  String fullName;
  String date;
  String total;
  String currentAddress;
  String destinationAddress;
  String phoneNumber;

  BookModel(
      {
      required this.fullName,
      required this.date,
      required this.total,
      required this.currentAddress,
      required this.destinationAddress,
      required this.phoneNumber});

  //receiving  data from server
  factory BookModel.fromMap(map) {
    return BookModel(

        fullName: map['fullName'],
        date: map['date'],
        total: map['total'],
        phoneNumber: map['phoneNumber'],
        destinationAddress: map['destinationAddress'],
        currentAddress: map['currentAddress']);
  }

  //sending or pushing data into server
  Map<String, dynamic> toJson() => {

        'fullName': fullName,
        'date': date,
        'total': total,
        'destinationAddress': destinationAddress,
        'currentAddress': currentAddress,
        'phoneNumber': phoneNumber,
      };
}
