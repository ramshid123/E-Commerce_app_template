import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'home_index.dart';

class HomeController extends GetxController {
  HomeController();
  final state = HomeState();

  void verticalDragControl(DragUpdateDetails details) {
    if (details.delta.direction.isNegative) {
      state.pageController
          .animateToPage(1, duration: 1000.ms, curve: Curves.easeOutSine);
      state.isDraggedUp.value = true;
    } else {
      state.pageController
          .animateToPage(0, duration: 1000.ms, curve: Curves.easeOutSine);
      state.isDraggedUp.value = false;
    }
  }

  void onRiveInit(Artboard artboard) {
    final ctrl =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(ctrl!);
    state.trigger = ctrl.findInput<bool>('Trigger') as SMITrigger;
  }

  void handleTap(TapUpDetails details) {
    // Get the tap position using details.localPosition
    state.tapX = details.globalPosition.dx;
    state.tapY = details.globalPosition.dy;
    update();
    state.trigger!.fire();
  }
}
