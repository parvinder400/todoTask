import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';
import 'package:yockettask/app/shared_widgets/custom_grid_view.dart';
import 'package:yockettask/app/shared_widgets/custom_list_widget.dart';

class HomeTabScreen extends GetView<DashboardScreenController> {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (controller.isListViewSelected.value == false)
                              controller.isListViewSelected.value = true;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'List View',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: controller.isListViewSelected.value
                                    ? Colors.orange
                                    : Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 2,
                        color: Colors.blueGrey,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (controller.isListViewSelected.value == true)
                              controller.isListViewSelected.value = false;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Grid View',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: controller.isListViewSelected.value
                                    ? Colors.grey.withOpacity(0.5)
                                    : Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<DashboardScreenController>(builder: (_) {
                  return controller.isListViewSelected.value
                      ? CustomListView()
                      : CustomGridView();
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
