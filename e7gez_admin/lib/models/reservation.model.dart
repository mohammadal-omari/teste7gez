class Reservation {
  final String? userName, phone, reserveStatus;
  final int?reserveId, restaurantId, visitorNumber, tableNumber;
  final DateTime? creatDate,reservDate;
  Reservation({
    this.reserveId,
    this.restaurantId,
    this.userName,
    this.phone,
    this.visitorNumber,
    this.tableNumber,
    this.reserveStatus,
    this.creatDate,
    this.reservDate
  });

//NOTE:
//reserveStatus:"NEW","APPROVED","DISAPPROVED","CANCELLED","ENDED"

  // static Reservation fromJson(Map<String, dynamic> map) {
  //   return new Reservation(
  //   title: map['title'].toString(),
  //   value: int.tryParse(map['value']),
  //   svgSrc: map['svgSrc'].toString(),
  //   color: int.tryParse(map['color']),
  //   percentage: int.tryParse(map['percentage'])
  // );
  // }
}

List<Reservation> demoRecentReservations= [
  Reservation(
    reserveId:1,
    restaurantId:1,
    userName:"mohammad alomari",
    phone:"0792877948",
    visitorNumber:5,
    tableNumber:1,
    reserveStatus:"NEW",
    creatDate:DateTime.now(),
    reservDate:DateTime.now()
  ),
  Reservation(
    reserveId:2,
    restaurantId:1,
    userName:"mohammad alomari",
    phone:"0792877948",
    visitorNumber:8,
    tableNumber:2,
    reserveStatus:"NEW",
    creatDate:DateTime.now(),
    reservDate:DateTime.now()
  ),
  Reservation(
    reserveId:3,
    restaurantId:1,
    userName:"mohammad alomari",
    phone:"0792877948",
    visitorNumber:5,
    tableNumber:1,
    reserveStatus:"NEW",
    creatDate:DateTime.now(),
    reservDate:DateTime.now()
  ),
  Reservation(
    reserveId:4,
    restaurantId:1,
    userName:"mohammad alomari",
    phone:"0792877948",
    visitorNumber:8,
    tableNumber:2,
    reserveStatus:"NEW",
    creatDate:DateTime.now(),
    reservDate:DateTime.now()
  )
 ]; 