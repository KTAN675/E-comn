class OrderModel {
  final String status;
  final String date;
  final double amount;
  final List<String> images;

  OrderModel({
    required this.status,
    required this.date,
    required this.amount,
    required this.images,
  });
}