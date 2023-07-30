import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'details_index.dart';

class DetailsController extends GetxController {
  DetailsController();
  final state = DetailsState();

  void onRiveInit(Artboard artboard) {
    final ctrl =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(ctrl!);
    state.trigger = ctrl.findInput<bool>('Trigger') as SMITrigger;
  }

  void handleTap(TapDownDetails details) {
    // Get the tap position using details.localPosition
    state.tapX = details.globalPosition.dx;
    state.tapY = details.globalPosition.dy;
    update();
    state.trigger!.fire();
  }
}
