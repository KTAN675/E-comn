//import 'package:e_comm/modules/profile/rewards/reward_details.dart';
import 'package:get/get.dart';
import 'package:realtime_user/modules/profile/rewards/reward_details.dart';

class RewardsController extends GetxController {

  List<Map<String, String>> rewards = [

    {
      "title": "₹200 OFF",
      "subtitle": "On Your First Purchase Above ₹999"
    },

    {
      "title": "₹150 OFF",
      "subtitle": "Applicable On Orders Above ₹799"
    },

    {
      "title": "20% OFF",
      "subtitle": "Festival Special Shop & Save Today"
    },

    {
      "title": "₹100 OFF",
      "subtitle": "Redeem Using Your Points"
    },

  ];

  void openReward(Map<String,String> reward){
    Get.to(() => RewardDetailsView(reward: reward));
  }

}