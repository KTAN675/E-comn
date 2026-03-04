import 'package:get/get.dart';
import '../../data/models/address/address_model.dart';

class AddressController extends GetxController {

  List<AddressModel> addresses = [
    AddressModel(
      title: "Home",
      building: "Mata Rani Apartment",
      addressLine: "samar pally Rd.SA Block",
      city: "samarpually, krishna",
    ),
    AddressModel(
      title: "Office",
      building: "Mata Rani Apartment",
      addressLine: "samar pally Rd.SA Block",
      city: "samarpually, krishna",
    ),
    AddressModel(
      title: "Other",
      building: "Mata Rani Apartment",
      addressLine: "samar pally Rd.SA Block",
      city: "samarpually, krishna",
    ),
  ];

  void addAddress(AddressModel address) {
    addresses.add(address);
    update();
  }

}