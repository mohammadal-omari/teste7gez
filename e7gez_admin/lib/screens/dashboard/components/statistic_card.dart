
import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/models/card_info.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StatisticCard extends StatelessWidget {
  const StatisticCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CardInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // boxShadow: [BoxShadow(
        //             color: Color(0xFFC7C7C7),//.withOpacity(0.5),
        //             spreadRadius: 5,
        //             blurRadius: 7,
        //             offset: Offset(0, 3),
        //           )],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color:cardBackColor,
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.25),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(info.color!).withOpacity(0.05),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: SvgPicture.asset(
                    info.svgSrc!,
                    color: Color(info.color!),
                  ),
                )
              ),
              Text(
                "${info.value}\n${info.unit}",
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              // FittedBox(
              //   fit: BoxFit.fitWidth, 
              //   child: Text(
              //   "${info.value} ${info.unit}",
              //    style: const TextStyle(fontSize: 15),//Theme.of(context)
              //   //     .textTheme
              //   //     .caption!
              //   //     .copyWith(color: Colors.white70),
              //   ), 
              // ),
            ],
          ),
            //const Icon(Icons.person, size: 24, color:Colors.blueAccent),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(info.color!).withOpacity(0.8),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
            ),
            padding: const EdgeInsets.all(8),
            child: 
            Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                    fit: BoxFit.fitWidth, 
                    child: Text(
                            info.title!,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          )
                    ),
                  ],
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}



// return Container(
//       padding: const EdgeInsets.all(defaultPadding),
//       decoration: const BoxDecoration(
//         color: secondaryColor,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         boxShadow: [BoxShadow(
//                     color: Color(0xFFC7C7C7),//.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   )],
//           ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [Card(
//               color:cardBackColor,
//               child: Container(
//                 padding: const EdgeInsets.all(defaultPadding * 0.75),
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   color: Color(info.color!).withOpacity(0.05),
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                 ),
//                 child: SvgPicture.asset(
//                   info.svgSrc!,
//                   color: Color(info.color!),
//                 ),
//               )),
//                FittedBox(
//                   fit: BoxFit.fitWidth, 
//                   child: Text(
//                           info.title!,
//                           maxLines: 1,
//                           style: const TextStyle(fontSize: 12),
//                           overflow: TextOverflow.ellipsis,
//                         )
//               ),
//               // Text(
//               //   info.title!,
//               //   maxLines: 1,
//               //   overflow: TextOverflow.visible,
//               // ),
//               //Icon(Icons.more_vert, color: Colors.white54)
//             ],
//           ),
//           Text(
//             info.title!,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           ProgressLine(
//             color: Color(info.color!),
//             percentage: info.percentage,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "${info.value} ${info.unit}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .caption!
//                     .copyWith(color: Colors.white70),
//               ),
//             ],
//           )
//         ],
//       ),
//     );