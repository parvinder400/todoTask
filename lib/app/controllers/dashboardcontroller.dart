import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yockettask/data/local/local_storage.dart';

class DashboardScreenController extends GetxController {
  final LocalStorage storage;
  DashboardScreenController(this.storage);
  var selindex = 0.obs;
  var isListViewSelected = true.obs;
  var isTimerClicked = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  List<dynamic> asd = [].obs;
  List<dynamic> oldList = [].obs;
  List<dynamic> completedList = [].obs;
  int counter = 600;

  var timeToShow = ''.obs;
  int selectedIndex = -1.obs;

  int? minutes;
  int? seconds;

  @override
  void onInit() {
    // storage.remove('completedTask');
    // storage.remove('tasks');
    asd = storage.read('tasks') ?? [];
    completedList = storage.read('completedTask') ?? [];

    super.onInit();
  }

  addTask() {
    oldList = storage.read('tasks') ?? [];
    var temp = {
      'title': titleController.text,
      'discription': discriptionController.text,
      'idDone': false,
      'minutes': minutes,
      'seconds': seconds,
    };
    oldList.add(temp);
    storage.write('tasks', oldList); // storage initialize
    asd = storage.read('tasks');
    print(temp);
    update();
    titleController.clear();
    discriptionController.clear();
  }

  completedTask({int? fnindex}) {
    var completedTemp = {
      'title': asd[fnindex!]['title'].toString(),
      'discription': asd[fnindex]['discription'].toString(),
    };
    completedList = storage.read('completedTask') ?? [];
    completedList.add(completedTemp);
    storage.write('completedTask', completedList); // completed task
    completedList = storage.read('completedTask');
    update();
  }

  deleteTask({int? removeIndex}) {
    completedTask(fnindex: removeIndex);
    oldList = storage.read('tasks') ?? [];
    asd.removeAt(removeIndex!);
    storage.write('tasks', asd); // storage initialize
    asd = storage.read('tasks');
    update();
  }
}
