import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/models/reservation.model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:data_table_2/data_table_2.dart';



class RecentReservations extends StatelessWidget {
  const RecentReservations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:defaultPadding/2,bottom: defaultPadding),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  Recent Reservations",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            //ignore: sort_child_properties_last
            child: DataTable(
              dataTextStyle : const TextStyle(fontSize: 10),
              columnSpacing: defaultPadding/4,
              decoration:const BoxDecoration(
                color: testColor,
              ),
              // minWidth: 600,
              columns: const [
                DataColumn(label: Text("User Name",style: TextStyle(fontSize: 12))),
                DataColumn(label: Text("Visitor",style: TextStyle(fontSize: 12))),
                DataColumn(label: Text("Table",style: TextStyle(fontSize: 12))),
                DataColumn(label: Text("Reserv Date",style: TextStyle(fontSize: 12)))
              ],
              rows: List.generate(
                demoRecentReservations.length,
                (index) => recentReservationDataRow(
                  demoRecentReservations[index],index
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentReservationDataRow(Reservation reservInfo,int index) {
  final Color dataColor=(index % 2 == 0)?Colors.black:Colors.white;
  return DataRow(
    color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (index % 2 == 0) {
          return const Color.fromARGB(255, 255, 255, 255);//.withOpacity(0.3);
        }
        return const Color.fromARGB(255, 172, 170, 172).withOpacity(0.3);
      }
    ),
    cells: [
      DataCell(Text(reservInfo.userName!,style: TextStyle(color: dataColor))),
      DataCell(Text(reservInfo.visitorNumber!.toString(),style: TextStyle(color: dataColor))),
      DataCell(Text(reservInfo.tableNumber!.toString(),style: TextStyle(color: dataColor))),
      DataCell(Text(reservInfo.reservDate!.toString(),style: TextStyle(color: dataColor))),
    ],
  );
}
