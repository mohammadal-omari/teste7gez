import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:e7gez_admin/responsive.dart';
import 'package:e7gez_admin/screens/login/login_page.dart';
import 'package:e7gez_admin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu, color: primaryColor,),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6!.apply(color: primaryColor),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        //Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding/2),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding /2,
        vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        //horizontal: defaultPadding,
        //vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/blank-profile.png",
            height: 38,
          ),
          //if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 4),
              child: Text("Mohammad Al-Omari"),
            ),
            IconButton(
              tooltip: "logout",
              icon: const Icon(Icons.logout_rounded), 
              onPressed: () { 
                authService.logout();
                Navigator.pushNamed(context, LoginPage.routeName);
              },
            ),
            // DropdownButton<Action>(
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   items: [
            //   DropdownMenuItem(child:
            //     IconButton(
            //       tooltip: "logout",
            //       icon: const Icon(Icons.logout_rounded), 
            //       onPressed: () { 
            //         authService.logout();
            //         Navigator.pushNamed(context, LoginPage.routeName);
            //       },
            //     ),
            //   ),
            // ], onChanged: (Object? value) {  },),
           
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
