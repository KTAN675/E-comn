
import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';

class ProductCard extends StatefulWidget {
final ProductModel product;

final Color accent;
final Color discountColor;
final Color cardBackground;

final VoidCallback? onFavorite;
final bool showShadow;

const ProductCard({
super.key,
required this.product,
required this.accent,
required this.discountColor,
this.cardBackground = const Color(0xFFEFEFEF),
this.showShadow = true,
this.onFavorite,
});

@override
State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

int quantity = 0;
bool isFavorite = false;

@override
Widget build(BuildContext context) {

final product = widget.product;

/// 🔹 TOTAL PRICE CALCULATION
double totalPrice =
quantity == 0 ? product.price : product.price * quantity;

return Container(
width: 190,
decoration: BoxDecoration(
color: widget.cardBackground,
borderRadius: BorderRadius.circular(28),
boxShadow: widget.showShadow
? [
BoxShadow(
color: Colors.black.withValues(alpha: 0.08),
blurRadius: 16,
offset: const Offset(0, 10),
),
]
    : [],
),
child: Padding(
padding: const EdgeInsets.all(14),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

/// IMAGE
Stack(
children: [

ClipRRect(
borderRadius: BorderRadius.circular(22),
child: Image.asset(
product.image,
height: 130,
width: double.infinity,
fit: BoxFit.cover,
),
),

/// ❤️ FAVORITE
Positioned(
top: 8,
left: 8,
child: GestureDetector(
onTap: () {
setState(() {
isFavorite = !isFavorite;
});
widget.onFavorite?.call();
},
child: Container(
width: 36,
height: 36,
decoration: BoxDecoration(
color: widget.accent,
borderRadius: BorderRadius.circular(12),
),
child: Icon(
isFavorite
? Icons.favorite
    : Icons.favorite_border,
color: Colors.white,
size: 20,
),
),
),
),

/// DISCOUNT
if (product.discount != null)
Positioned(
top: 8,
right: 8,
child: Container(
padding: const EdgeInsets.symmetric(
horizontal: 8,
vertical: 4,
),
decoration: BoxDecoration(
color: widget.discountColor,
borderRadius: BorderRadius.circular(10),
),
child: Text(
"${product.discount}%",
style: AppTextStyles.caption.copyWith(
color: Colors.white,
fontWeight: FontWeight.w600,
),
),
),
),
],
),

const SizedBox(height: 14),

/// TITLE
Text(
product.title,
style: AppTextStyles.bodyLarge.copyWith(
fontWeight: FontWeight.w700,
),
maxLines: 2,
overflow: TextOverflow.ellipsis,
),

const SizedBox(height: 4),

/// WEIGHT
Text(
product.weight,
style: AppTextStyles.bodyGrey,
),

const SizedBox(height: 8),

/// PRICE + ADD
Row(
children: [

/// 🔹 UPDATED PRICE
Text(
"\$${totalPrice.toStringAsFixed(2)}",
style: AppTextStyles.price,
),

const Spacer(),

/// ADD / REMOVE BUTTON
quantity == 0
? GestureDetector(
onTap: () {
setState(() {
quantity = 1;
});
},
child: Container(
width: 28,
height: 28,
decoration: BoxDecoration(
color: widget.accent,
borderRadius: BorderRadius.circular(8),
),
child: const Icon(
Icons.add,
color: Colors.white,
size: 18,
),
),
)
    : Container(
padding: const EdgeInsets.symmetric(horizontal: 6),
decoration: BoxDecoration(
color: widget.accent,
borderRadius: BorderRadius.circular(8),
),
child: Row(
children: [

/// REMOVE
GestureDetector(
onTap: () {
setState(() {
if (quantity > 0) quantity--;
});
},
child: const Icon(
Icons.remove,
color: Colors.white,
size: 18,
),
),

Padding(
padding:
const EdgeInsets.symmetric(horizontal: 6),
child: Text(
quantity.toString(),
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold),
),
),

/// ADD
GestureDetector(
onTap: () {
setState(() {
quantity++;
});
},
child: const Icon(
Icons.add,
color: Colors.white,
size: 18,
),
),
],
),
),
],
),
],
),
),
);
}
}
