import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReturnController extends GetxController {

  final reasons = [
    "Damaged Product",
    "Wrong Size",
    "Wrong Product",
    "Quality Issue",
    "Other"
  ];

  RxString selectedReason = "".obs;
  RxList<File> images = <File>[].obs;
  RxString details = "".obs;

  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      images.add(File(picked.path));
    }
  }

  void removeImage(int index){
    images.removeAt(index);
  }

  void submitReturn() {
    if(selectedReason.value.isEmpty){
      Get.snackbar("Error", "Please select return reason");
      return;
    }

    Get.snackbar("Success", "Return request submitted");
  }

}