import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'rewards_controller.dart';

class RewardsView extends StatelessWidget {
  RewardsView({super.key});

  final RewardsController controller = Get.put(RewardsController());

  @override
  Widget build(BuildContext context) {
    Get.find<RewardsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Redeem Your Points And\nEnjoy Instant Savings.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Accumulate Points",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              /// Email Verification
              rewardTask(
                icon: Icons.email,
                title: "Email Verification",
                subtitle: "Earn 100 Points",
                button: "Go",
              ),

              const SizedBox(height: 10),

              /// Purchase
              rewardTask(
                icon: Icons.shopping_bag,
                title: "Make A Purchase",
                subtitle: "Earn Points",
                button: "Shop Now",
              ),

              const SizedBox(height: 25),

              const Text(
                "Your Rewards",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              /// GRID
              GridView.builder(
                shrinkWrap: true, // IMPORTANT
                physics: const NeverScrollableScrollPhysics(), // IMPORTANT
                itemCount: controller.rewards.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {

                  final reward = controller.rewards[index];

                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xffF6EFEA),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          children: [
                            Text(
                              reward["title"]!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              reward["subtitle"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text("Redeem"),
                        )
                      ],
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  /// reward tile widget
  Widget rewardTask({
    required IconData icon,
    required String title,
    required String subtitle,
    required String button,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF6EFEA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [

          Icon(icon, color: Colors.orange),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text(button),
          )

        ],
      ),
    );
  }
}