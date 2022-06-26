import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';

class CompletedTabScreen extends GetView<DashboardScreenController> {
  const CompletedTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.completedList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            leading: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.5),
              ),
            ),
            title: Text(controller.completedList[index]['title'].toString()),
            subtitle: Text(controller.completedList[index]['title'].toString()),
            trailing: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        });
  }
}
