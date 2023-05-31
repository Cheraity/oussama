class LogementModel {
  int? logmentId;
  String? logmentTitre;
  String? logmentDescription;
  int? logmentPrix;
  String? logmentImage;
  int? logmentNbrPiece;
  String? logmentDate;
  String? logmentEquipment;
  int? logCat;
  int? logUser;
  int? itemsCount;
  int? itemsActive;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  int? favorite;

  LogementModel({
    this.logmentId,
    this.logmentTitre,
    this.logmentDescription,
    this.logmentPrix,
    this.logmentImage,
    this.logmentNbrPiece,
    this.logmentDate,
    this.logmentEquipment,
    this.logCat,
    this.logUser,
    this.itemsCount,
    this.itemsActive,
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.favorite,
  });

  factory LogementModel.fromJson(Map<String, dynamic> json) {
    return LogementModel(
      logmentId: json['logment_id'] as int?,
      logmentTitre: json['logment_titre'] as String?,
      logmentDescription: json['logment_description'] as String?,
      logmentPrix: json['logment_prix'] as int?,
      logmentImage: json['logment_image'] as String?,
      logmentNbrPiece: json['logment_nbrpiece'] as int?,
      logmentDate: json['logment_date'] as String?,
      logmentEquipment: json['logment_equipment'] as String?,
      logCat: json['log_cat'] as int?,
      logUser: json['log_user'] as int?,
      itemsCount: json['items_count'] as int?,
      itemsActive: json['items_active'] as int?,
      categoriesId: json['categories_id'] as int?,
      categoriesName: json['categories_name'] as String?,
      categoriesImage: json['categories_image'] as String? ,
      favorite: json['favorite'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logment_id': logmentId,
      'logment_titre': logmentTitre,
      'logment_description': logmentDescription,
      'logment_prix': logmentPrix,
      'logment_image': logmentImage,
      'logment_nbrpiece': logmentNbrPiece,
      'logment_date': logmentDate,
      'logment_equipment': logmentEquipment,
      'log_cat': logCat,
      'log_user': logUser,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_image': categoriesImage,
      'favorite': favorite,
    };
  }
}
