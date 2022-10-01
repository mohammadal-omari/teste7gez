import 'package:e7gez_admin/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 50,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                SvgPicture.asset(
                  "assets/icons/drop_box.svg",
                  color: primaryColor,
                ),
                
                const Text("Likes")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: primaryColor,
    value: 75,
    showTitle: true,
    title: 'Like',
    radius: 20,
  ),
  PieChartSectionData(
    color: const Color.fromARGB(255, 255, 71, 38),
    value: 25,
    showTitle: true,
    title: 'DesLike',
    radius: 20,
  )
];
