class Coffee {
  final String name;
  final int price;
  final String image;
  int sweetnessLevel;
  int quantity;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    this.sweetnessLevel = 0,
    this.quantity = 1,
  });

  void setSweetnessLevel(int level) {
    sweetnessLevel = level;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'sweetnessLevel': sweetnessLevel,
      'quantity': quantity,
    };
  }

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      name: json['name'],
      price: json['price'],
      image: json['image'],
      sweetnessLevel: json['sweetnessLevel'] ?? 0,
      quantity: json['quantity'] ?? 1,
    );
  }
}
