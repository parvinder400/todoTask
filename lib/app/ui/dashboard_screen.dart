import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';
import 'package:yockettask/app/ui/completed_tab_screen.dart';
import 'package:yockettask/app/ui/home_tab_screen.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({Key? key}) : super(key: key);

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomeTabScreen(),
  //   CompletedTabScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Yocket TODO App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => controller.selindex.value == 0
              ? FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Column(
                              children: [
                                const Text('Enter the Task'),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: controller.titleController,
                                  decoration: InputDecoration(
                                    hintText: "Task Title",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controller.discriptionController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Task Discription",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            content: Row(
                              children: [
                                const Text('Time'),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: SizedBox(
                                    height: 100,
                                    width: 200,
                                    child: CupertinoTimerPicker(
                                      mode: CupertinoTimerPickerMode.ms,
                                      initialTimerDuration: const Duration(
                                          minutes: 10, seconds: 0),
                                      onTimerDurationChanged: (time) {
                                        controller.minutes = time.inMinutes;
                                        controller.seconds = time.inSeconds;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            elevation: 2.0,
                            actions: <Widget>[
                              FlatButton(
                                color: Colors.red,
                                textColor: Colors.white,
                                child: Text('CANCEL'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: const Text('Add'),
                                onPressed: () async {
                                  if (controller.titleController.text.length !=
                                          0 &&
                                      controller.discriptionController.text
                                              .length !=
                                          0) {
                                    await controller.addTask();

                                    Get.back();

                                    Get.snackbar(
                                      'Task Added',
                                      'Your Task display on Screen',
                                      duration: Duration(seconds: 1),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orangeAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Completed',
                backgroundColor: Colors.green,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: controller.selindex.value,
            selectedItemColor: Colors.white,
            iconSize: 30,
            onTap: (val) {
              controller.selindex.value = val;
            },
            elevation: 5,
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: controller.selindex.value == 0
                ? HomeTabScreen()
                : CompletedTabScreen(),
          ),
        ),
      ),
    );
  }
}
