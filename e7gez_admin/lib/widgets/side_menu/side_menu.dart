import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  color:const Color(0xFF0C9869),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          // const Card(
          //   child: ListTile(
          //     leading: FlutterLogo(),
          //     title: Text('One-line with leading widget'),
          //   ),
          // ),
          
          const Divider(color: cardBackColor),
          Card(
            color: cardBackColor,
            child: DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dashbord');
              },
            )
          ),
          Card(
            color:cardBackColor,
            child: DrawerListTile(
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {Navigator.pushNamed(context, '/second');},
            )
          ),
          Card(
            color:cardBackColor,
            child: DrawerListTile(
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {},
            )
          ),
          Card(
            color:cardBackColor,
            child:  DrawerListTile(
              title: "Documents",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            )
          ),
          // Card(
          //   color:cardBackColor,
          //   child: DrawerListTile(
          //     title: "Store",
          //     svgSrc: "assets/icons/menu_store.svg",
          //     press: () {},
          //   )
          // ),
          Card(
            color:cardBackColor,
            child: DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            )
          ),
          Card(
            color:cardBackColor,
            child:  DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            )
          ),
          Card(
            color:cardBackColor,
            child: DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            )
          ),
          Card(
            color:Colors.white.withOpacity(0),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: context.read<MenuController>().closeControlMenu,
              child: const ListTile(
                leading: Icon(Icons.arrow_back, color: Colors.white),
              ),
              //title: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      //decoration:const BoxDecoration(boxShadow: [BoxShadow(color: Color.fromARGB(255, 255, 0, 0))])
      leading: SvgPicture.asset(
        svgSrc,
        color: cardTextColor,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: cardTextColor),
      ),
    );
  }
}
// class MenuItem{
//  late String title, svgSrc;
//  late VoidCallback press;
//  MenuItem(this.title, this.svgSrc,  press);
// }
// final List<MenuItem> menuItems = <MenuItem>[
//   new MenuItem{
//     title: "Settings",
//             svgSrc: "assets/icons/menu_setting.svg",
//             press: () {},
//   }
// ];