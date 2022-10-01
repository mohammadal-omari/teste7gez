import 'dart:async';
import 'dart:convert';
import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/models/card_info.model.dart';
import 'package:e7gez_admin/responsive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'statistic_card.dart';

class CardsField extends StatelessWidget {
  const CardsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Statistic's",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: InfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
          ),
          tablet: const InfoCardGridView(),
          desktop: InfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InfoCardGridView extends StatefulWidget {
  const InfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  // ignore: no_logic_in_create_state
  State<InfoCardGridView> createState() => _InfoCardGridViewState(crossAxisCount,childAspectRatio);
}
  

class _InfoCardGridViewState extends State<InfoCardGridView>{
  //int crossAxisCount =2;
  //double childAspectRatio =1;
  late Future<List<CardInfo>> _postList;
  
  final int crossAxisCount;
  final double childAspectRatio;

  _InfoCardGridViewState(this.crossAxisCount, this.childAspectRatio);

  @override
  void initState() {
    super.initState();
    _postList = fetchPost();
  }
  

  Future<List<CardInfo> > fetchPost() async {
    final response =
    await http.get(Uri.parse('https://rebel-jade-creator.glitch.me/statistic'),headers: {
  "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS"
});
List<CardInfo> getList =<CardInfo>[];
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values=<dynamic>[];
      values = json.decode(response.body);
      if(values.isNotEmpty){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            getList.add(CardInfo.fromJson(map));

            //debugPrint('Id-------${map['id']}');
          }
        }
      }
      //print(_postList);
      return getList;

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

 @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _postList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) => StatisticCard(info: snapshot.data[index]),
          );
        } else if (snapshot.hasError) {
          // If something went wrong
          return const Text('Something went wrong...');
        }

        // While fetching, show a loading spinner.
        return const CircularProgressIndicator();
      }
    );
  }
}