
import 'package:data_table_2/data_table_2.dart';
import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:e7gez_admin/responsive.dart';
import 'package:e7gez_admin/screens/dashboard/components/chart.dart';
import 'package:e7gez_admin/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'components/header.dart';
import 'components/cards_field.dart';
import 'components/recent_reservations.dart';

class DashboardScreen extends StatelessWidget {
static const routeName = '/dashbord';
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
              flex: 5,
              child:DashboardScreenPage()
            )
          ],
        ),
      ),
    );
  }
}

class DashboardScreenPage extends StatelessWidget {
  const DashboardScreenPage({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
   return SafeArea(
    child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children:  const [
             Header(),
            //  SizedBox(height: defaultPadding),
            //  Chart(),
             SizedBox(height: defaultPadding),
             CardsField(),
             SizedBox(height: defaultPadding),
             RecentReservations(),
           
            //RecentReservations(),
            // SizedBox(height: defaultPadding),
            // RecentReservations()
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       flex: 5,
            //       child: Column(
            //         children: const [
            //           CardsField(),
            //           SizedBox(height: defaultPadding),
            //           RecentReservations()
            //           // if (Responsive.isMobile(context))
            //           //   SizedBox(height: defaultPadding),
            //           // if (Responsive.isMobile(context)) StarageDetails(),
            //         ],
            //       ),
            //     ),
            //     // if (!Responsive.isMobile(context))
            //     //   SizedBox(width: defaultPadding),
            //     // On Mobile means if the screen is less than 850 we dont want to show it
            //     // if (!Responsive.isMobile(context))
            //     //   Expanded(
            //     //     flex: 2,
            //     //     child: StarageDetails(),
            //     //   ),
            //   ],
            // )
          ],
        ),
      ),
   );
  }
}
 

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<MenuController>().scaffoldKey,
//       drawer: SideMenu(),
//       body: SafeArea(
//       child: Row(
//           children: [
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 // flex: 1, (default)
//                 child: SideMenu(),
//               ),
//               Expanded(
//                 flex: 5,
//                 child:SingleChildScrollView(
//                 primary: false,
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Column(
//                   children: [
//                     Header(),
//                     SizedBox(height: defaultPadding),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 5,
//                           child: Column(
//                             children: [
//                               CardsField(),
//                               SizedBox(height: defaultPadding),
//                               RecentReservations(),
//                               if (Responsive.isMobile(context))
//                                 SizedBox(height: defaultPadding),
//                               // if (Responsive.isMobile(context)) StarageDetails(),
//                             ],
//                           ),
//                         ),
//                         if (!Responsive.isMobile(context))
//                           SizedBox(width: defaultPadding),
//                         // On Mobile means if the screen is less than 850 we dont want to show it
//                         // if (!Responsive.isMobile(context))
//                         //   Expanded(
//                         //     flex: 2,
//                         //     child: StarageDetails(),
//                         //   ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
