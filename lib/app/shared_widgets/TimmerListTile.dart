import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yockettask/app/controllers/dashboardcontroller.dart';

class TimmerListTile extends StatefulWidget {
  int? listIndex;
  int? minutes;
  int? seconds;
  TimmerListTile(
      {Key? key, required this.listIndex, required this.minutes, this.seconds})
      : super(key: key);

  @override
  _TimmerListTileState createState() => _TimmerListTileState();
}

class _TimmerListTileState extends State<TimmerListTile>
    with TickerProviderStateMixin {
  final dashboardContriller = Get.find<DashboardScreenController>();
  late AnimationController controller;

  bool isPlaying = false;
  bool isFirstTime = true;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  void notify() {
    print('notify called');
    if (countText == '0:00:00' && isFirstTime == true) {
      dashboardContriller.deleteTask(removeIndex: widget.listIndex);
      isFirstTime = false;
      // FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
          minutes: (widget.minutes!).toInt(),
          seconds: (widget.seconds!).toInt()),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20),
      leading: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.amber,
        ),
        child: IconButton(
            onPressed: () {
              if (controller.isAnimating) {
                controller.stop();
                setState(() {
                  isPlaying = false;
                });
              } else {
                controller.reverse(
                    from: controller.value == 0 ? 1.0 : controller.value);
                setState(() {
                  isPlaying = true;
                });
              }
            },
            icon: Icon(isPlaying == true ? Icons.pause : Icons.play_arrow)),
      ),
      title: GetBuilder<DashboardScreenController>(builder: (_) {
        return Text(_.asd[widget.listIndex!]['title'].toString());
      }),
      subtitle: GetBuilder<DashboardScreenController>(builder: (_) {
        return Text(_.asd[widget.listIndex!]['discription'].toString());
      }),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child:

            //  CustomTimer(),
            AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Text(
            countText,
          ),
        ),
      ),
    );
  }
}
