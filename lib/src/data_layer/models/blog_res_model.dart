class BlogResModel {
  List<Banner>? banner;
  List<Blog>? blog;
  List<ProductCategory>? productCategory;
  List<AstrotalkInNews>? astrotalkInNews;
  List<AstrologyVideo>? astrologyVideo;
  int? status;

  BlogResModel(
      {this.banner,
      this.blog,
      this.productCategory,
      this.astrotalkInNews,
      this.astrologyVideo,
      this.status});

  BlogResModel.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
    if (json['blog'] != null) {
      blog = <Blog>[];
      json['blog'].forEach((v) {
        blog!.add(Blog.fromJson(v));
      });
    }
    if (json['productCategory'] != null) {
      productCategory = <ProductCategory>[];
      json['productCategory'].forEach((v) {
        productCategory!.add(ProductCategory.fromJson(v));
      });
    }
    if (json['astrotalkInNews'] != null) {
      astrotalkInNews = <AstrotalkInNews>[];
      json['astrotalkInNews'].forEach((v) {
        astrotalkInNews!.add(AstrotalkInNews.fromJson(v));
      });
    }
    if (json['astrologyVideo'] != null) {
      astrologyVideo = <AstrologyVideo>[];
      json['astrologyVideo'].forEach((v) {
        astrologyVideo!.add(AstrologyVideo.fromJson(v));
      });
    }
    status = json['status'];
  }
}

class Banner {
  int? id;
  String? bannerImage;
  String? fromDate;
  String? toDate;
  int? bannerTypeId;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? modifiedBy;
  String? bannerType;

  Banner(
      {this.id,
      this.bannerImage,
      this.fromDate,
      this.toDate,
      this.bannerTypeId,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy,
      this.bannerType});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImage = json['bannerImage'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    bannerTypeId = json['bannerTypeId'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    bannerType = json['bannerType'];
  }
}

class Blog {
  int? id;
  String? title;
  String? blogImage;
  Null? blogCategoryId;
  String? description;
  int? viewer;
  String? author;
  String? postedOn;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? modifiedBy;
  String? extension;
  String? previewImage;

  Blog(
      {this.id,
      this.title,
      this.blogImage,
      this.blogCategoryId,
      this.description,
      this.viewer,
      this.author,
      this.postedOn,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy,
      this.extension,
      this.previewImage});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    blogImage = json['blogImage'].toString().replaceAll(r'\', '');
    blogCategoryId = json['blogCategoryId'];
    description = json['description'];
    viewer = json['viewer'];
    author = json['author'];
    postedOn = json['postedOn'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    extension = json['extension'];
    previewImage = json['previewImage'];
  }
}

class ProductCategory {
  int? id;
  String? name;
  Null? displayOrder;
  String? categoryImage;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? modifiedBy;

  ProductCategory(
      {this.id,
      this.name,
      this.displayOrder,
      this.categoryImage,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayOrder = json['displayOrder'];
    categoryImage = json['categoryImage'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }
}

class AstrotalkInNews {
  int? id;
  String? newsDate;
  String? channel;
  String? link;
  String? bannerImage;
  String? description;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? modifiedBy;

  AstrotalkInNews(
      {this.id,
      this.newsDate,
      this.channel,
      this.link,
      this.bannerImage,
      this.description,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy});

  AstrotalkInNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsDate = json['newsDate'];
    channel = json['channel'];
    link = json['link'];
    bannerImage = json['bannerImage'];
    description = json['description'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }
}

class AstrologyVideo {
  int? id;
  String? youtubeLink;
  String? coverImage;
  String? videoTitle;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? modifiedBy;

  AstrologyVideo(
      {this.id,
      this.youtubeLink,
      this.coverImage,
      this.videoTitle,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy});

  AstrologyVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    youtubeLink = json['youtubeLink'];
    coverImage = json['coverImage'];
    videoTitle = json['videoTitle'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }
}
