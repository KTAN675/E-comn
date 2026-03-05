class ReviewModel {
  final String id;
  final String name;
  final String avatar;
  final String review;
  final String date;
  final int rating;

  int likes;
  int dislikes;

  bool isLiked;
  bool isDisliked;

  ReviewModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.review,
    required this.date,
    required this.rating,
    this.likes = 0,
    this.dislikes = 0,
    this.isLiked = false,
    this.isDisliked = false,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      name: json['user_name'] ?? '',
      avatar: json['user_avatar'] ?? '',
      review: json['review_text'] ?? '',
      rating: json['rating'] ?? 0,
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0,
      date: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_name": name,
      "user_avatar": avatar,
      "review_text": review,
      "rating": rating,
      "likes": likes,
      "dislikes": dislikes,
      "created_at": date,
    };
  }
}