import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';
import 'package:yockettask/app/shared_widgets/TimmerListTile.dart';

class CustomListView extends GetView<DashboardScreenController> {
  const CustomListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.asd.length,
        itemBuilder: (BuildContext context, int index) {
          int passMints =
              int.parse(controller.asd[index]['minutes'].toString());
          int passSec = int.parse(controller.asd[index]['seconds'].toString());
          return InkWell(
              onTap: () {
                controller.completedTask(fnindex: index);
                controller.deleteTask(removeIndex: index);
              },
              child: TimmerListTile(
                listIndex: index,
                minutes: passMints,
                seconds: passSec,
              ));
        });
  }
}
