class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categories_id'] as int?,
      categoriesName: json['categories_name'] as String?,
      categoriesImage: json['categories_image'] as String?,
      categoriesDatetime: json['categories_datetime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
