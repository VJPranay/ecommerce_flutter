class Product {
  String title;
  String description;
  String price;
  List<String> colors;
  String category;
  String image;

  Product(
      {this.title,
        this.description,
        this.price,
        this.colors,
        this.category,
        this.image});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    colors = json['colors'].cast<String>();
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['colors'] = this.colors;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}