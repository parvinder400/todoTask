import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';

class CustomGridView extends GetView<DashboardScreenController> {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: controller.asd.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    controller.asd[index]['title'].toString(),
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: Text(
                    controller.asd[index]['discription'].toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      controller.timeToShow.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
