class Categories {
  bool? success;
  String? message;
  List<Category>? categories;

  Categories({this.success, this.message, this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      categories = <Category>[];
      json['data'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.categories != null) {
      data['data'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  var id;
  String? name;
  String? description;
  String? image;

  Category({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

// class Category {
//   int? id;
//   String? name;
//   String? description;
//   String? createdAt;
//   String? updatedAt;
//   List<int>? customFields;
//   bool? hasMedia;
//   List<Media>? media;

//   Category({
//     this.id,
//     this.name,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//     this.customFields,
//     this.hasMedia,
//     this.media,
//   });

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     customFields = json['custom_fields'].cast<int>();
//     hasMedia = json['has_media'];
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(Media.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['custom_fields'] = customFields;
//     data['has_media'] = hasMedia;
//     if (media != null) {
//       data['media'] = media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Media {
//   int? id;
//   String? modelType;
//   String? modelId;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   String? size;
//   List<int>? manipulations;
//   CustomProperties? customProperties;
//   List<int>? responsiveImages;
//   String? orderColumn;
//   String? createdAt;
//   String? updatedAt;
//   String? url;
//   String? thumb;
//   String? icon;
//   String? formatedSize;

//   Media({
//     this.id,
//     this.modelType,
//     this.modelId,
//     this.collectionName,
//     this.name,
//     this.fileName,
//     this.mimeType,
//     this.disk,
//     this.size,
//     this.manipulations,
//     this.customProperties,
//     this.responsiveImages,
//     this.orderColumn,
//     this.createdAt,
//     this.updatedAt,
//     this.url,
//     this.thumb,
//     this.icon,
//     this.formatedSize,
//   });

//   Media.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     modelType = json['model_type'];
//     modelId = json['model_id'];
//     collectionName = json['collection_name'];
//     name = json['name'];
//     fileName = json['file_name'];
//     mimeType = json['mime_type'];
//     disk = json['disk'];
//     size = json['size'];
//     manipulations = json['manipulations'].cast<int>();
//     customProperties = json['custom_properties'] != null
//         ? CustomProperties.fromJson(json['custom_properties'])
//         : null;
//     responsiveImages = json['responsive_images'].cast<int>();
//     orderColumn = json['order_column'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     url = json['url'];
//     thumb = json['thumb'];
//     icon = json['icon'];
//     formatedSize = json['formated_size'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['model_type'] = modelType;
//     data['model_id'] = modelId;
//     data['collection_name'] = collectionName;
//     data['name'] = name;
//     data['file_name'] = fileName;
//     data['mime_type'] = mimeType;
//     data['disk'] = disk;
//     data['size'] = size;
//     data['manipulations'] = manipulations;
//     if (customProperties != null) {
//       data['custom_properties'] = customProperties!.toJson();
//     }
//     data['responsive_images'] = responsiveImages;
//     data['order_column'] = orderColumn;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['url'] = url;
//     data['thumb'] = thumb;
//     data['icon'] = icon;
//     data['formated_size'] = formatedSize;
//     return data;
//   }
// }

// class CustomProperties {
//   String? uuid;
//   int? userId;
//   GeneratedConversions? generatedConversions;

//   CustomProperties({this.uuid, this.userId, this.generatedConversions});

//   CustomProperties.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     userId = json['user_id'];
//     generatedConversions = json['generated_conversions'] != null
//         ? GeneratedConversions.fromJson(json['generated_conversions'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['uuid'] = uuid;
//     data['user_id'] = userId;
//     if (generatedConversions != null) {
//       data['generated_conversions'] = generatedConversions!.toJson();
//     }
//     return data;
//   }
// }

// class GeneratedConversions {
//   bool? thumb;
//   bool? icon;

//   GeneratedConversions({this.thumb, this.icon});

//   GeneratedConversions.fromJson(Map<String, dynamic> json) {
//     thumb = json['thumb'];
//     icon = json['icon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['thumb'] = thumb;
//     data['icon'] = icon;
//     return data;
//   }
// }
