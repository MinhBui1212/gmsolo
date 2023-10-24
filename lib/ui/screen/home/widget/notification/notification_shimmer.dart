import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmer extends StatefulWidget {
  const NotificationShimmer({super.key});
  static int id = 3;

  @override
  State<NotificationShimmer> createState() => _NotificationShimmerState();
}

class _NotificationShimmerState extends State<NotificationShimmer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: colorWhite,
        body: SafeArea(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Container(
                height: width * 0.2 + 2 * kDefaultPaddingHeightWidget,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPaddingWidget),
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(kSecondBorderRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPaddingScreen),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[200]!,
                              child: SizedBox(
                                  width: width * 0.7,
                                  height: 14,
                                  child: Container(
                                      decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kSecondBorderRadius),
                                    color: Colors.grey[200]!,
                                  ))),
                            ),
                            SizedBox(height: 5.h),
                            Expanded(
                                child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[200]!,
                                  child: SizedBox(
                                      width: width * 0.7,
                                      height: 40,
                                      child: Container(
                                          decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kSecondBorderRadius),
                                        color: Colors.grey[200]!,
                                      ))),
                                ),
                              ],
                            )),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[200]!,
                              child: SizedBox(
                                  width: width * 0.3,
                                  height: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kSecondBorderRadius),
                                    color: Colors.grey[200]!,
                                  ))),
                            ),
                          ],
                        ),
                      )),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width * 0.2,
                              height: width * 0.2,
                              child: Container(
                                  decoration: BoxDecoration(
                                color: Colors.grey[200]!,
                                borderRadius:
                                    BorderRadius.circular(kSecondBorderRadius),
                              )),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
