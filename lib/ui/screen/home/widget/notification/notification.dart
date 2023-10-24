import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/data/model/notification/notification.dart';
import 'package:cuemate/ui/screen/home/widget/notification/cubit/notification_cubit.dart';
import 'package:cuemate/ui/screen/home/widget/notification/cubit/notification_state.dart';
import 'package:cuemate/ui/screen/home/widget/notification/notification_shimmer.dart';
import 'package:intl/intl.dart';

class CustomNotification extends StatefulWidget {
  const CustomNotification({super.key});
  static int id = 3;

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: BlocProvider(
            create: (_) => NotificationCubit()..getListNotification(),
            child: BlocConsumer<NotificationCubit, NotificationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = context.read<NotificationCubit>();
                  if (cubit.state.isLoading) {
                    return const NotificationShimmer();
                  }
                  var listNotifications = cubit.state.listNotification;
                  return Scaffold(
                      resizeToAvoidBottomInset: true,
                      body: SafeArea(
                        child: ListView.builder(
                            itemCount: listNotifications.length,
                            itemBuilder: ((context, index) {
                              NotificationResponse item =
                                  listNotifications[index];
                              return Container(
                                height: width * 0.2 +
                                    2 * kDefaultPaddingHeightWidget,
                                margin: const EdgeInsets.fromLTRB(
                                    kDefaultMarginWidth,
                                    kDefaultMarginWidth,
                                    kDefaultMarginWidth,
                                    0),
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      kDefaultPaddingWidget),
                                  decoration: BoxDecoration(
                                      color: item.isReaded == 0
                                          ? Colors.grey.withOpacity(0.2)
                                          : colorWhite,
                                      borderRadius: BorderRadius.circular(
                                          kSecondBorderRadius)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultPaddingWidth),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.title ?? '',
                                              style: primaryTitleStyle,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(height: 4.h),
                                            Expanded(
                                              child: Text(item.content ?? '',
                                                  style: textNomalStyle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2),
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yyyy')
                                                  .format(item.time!),
                                              style: label10TextStyle,
                                            ),
                                          ],
                                        ),
                                      )),
                                      Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: width * 0.2,
                                            height: width * 0.2,
                                            child: Container(
                                                decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    item.imagePath!,
                                                  ),
                                                  fit: BoxFit.cover),
                                            )),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ));
                })));
  }
}
