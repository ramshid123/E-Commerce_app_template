import 'package:get/get.dart';
import 'details_index.dart';


class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<DetailsController>(DetailsController());
  }
}
