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
        padding: EdgeInsets.only(bottom: 100),
        shrinkWrap: true,
        itemCount: controller.asd.length,
        itemBuilder: (BuildContext context, int index) {
          int passMints = (controller.asd[index]['minutes'] ?? 10).toInt();
          int passSec = (controller.asd[index]['seconds'] ?? 00).toInt();

          return TimmerListTile(
            listIndex: index,
            minutes: (passMints).toInt(),
            seconds: passSec,
          );
        });
  }
}
