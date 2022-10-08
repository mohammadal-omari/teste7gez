import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:e7gez_admin/responsive.dart';
import 'package:e7gez_admin/screens/dashboard/components/header.dart';
import 'package:e7gez_admin/screens/dashboard/components/recent_reservations.dart';
import 'package:e7gez_admin/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class SecondScreen extends StatelessWidget {
  static const routeName = '/second';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 4,
              child:SecondScreenPage()
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreenPage extends StatelessWidget {
  const SecondScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final device =Responsive.isMobile(context)?'yes':'no';
   return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        
        child: Column(
          children: const [
            Header(),
            SizedBox(height: defaultPadding),
            RecentReservations(),
            // Text(
            //   'hhhhhhhhhhhhhhhhhhhhhhhhh${Responsive.isMobile(context)?'yes':'no'}',
            //   style: const TextStyle(color: Color.fromARGB(255, 255, 30, 0))
            // )

          ],
        ),
      ),
    );
  }
}

// ${Responsive.isMobile(context)}

// Text(
//             "Recent Reservations",
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//            DataTable2(
//               columnSpacing: defaultPadding,
//               minWidth: 600,
//               columns: const [
//                 DataColumn(label: Text("User Name")),
//                 DataColumn(label: Text("Visitor")),
//                 DataColumn(label: Text("Table")),
//                 DataColumn(label: Text("Reserv Date"))
//               ], rows: const [],
//               // rows: List.generate(
//               //   demoRecentReservations.length,
//               //   (index) => recentReservationDataRow(demoRecentReservations[index]),
//               // ),
//             ),