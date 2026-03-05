class PaymentMethodModel {
  final String title;
  final String? subtitle;
  final String image;

  PaymentMethodModel({
    required this.title,
    this.subtitle,
    required this.image,
  });
}