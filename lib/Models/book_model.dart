class BookModel {
  String fullName;
  String date;
  String total;


  BookModel({required this.fullName, required this.date, required this.total});

  //receiving  data from server
  factory BookModel.fromMap(map) {
    return BookModel(
      fullName: map['fullName'],
      date: map['date'],
      total: map['total'],
    );
  }

  //sending or pushing data into server
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'date': date,
        'total': total,
      };
}
