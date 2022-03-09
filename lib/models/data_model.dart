class DataModel {
  List<Categories>? categories;
  List<Data>? data;
  List<Transact>? transacts;
  List<BackgroundImages>? backgroundImages;

  DataModel(
      {this.categories, this.data, this.transacts, this.backgroundImages});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['transacts'] != null) {
      transacts = <Transact>[];
      json['transacts'].forEach((v) {
        transacts!.add(Transact.fromJson(v));
      });
    }
    if (json['background_images'] != null) {
      backgroundImages = <BackgroundImages>[];
      json['background_images'].forEach((v) {
        backgroundImages!.add(BackgroundImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (transacts != null) {
      data['transacts'] = transacts!.map((v) => v.toJson()).toList();
    }
    if (backgroundImages != null) {
      data['background_images'] =
          backgroundImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'DataModel{categories: $categories, data: $data, transacts: $transacts, backgroundImages: $backgroundImages}';
  }
}

class Categories {
  String? name;
  String? slug;
  String? icon;

  Categories({this.name, this.slug, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }

  @override
  String toString() {
    return 'Categories{name: $name, slug: $slug, icon: $icon}';
  }
}

class Data {
  String? type;
  List<Item>? items;
  String? title;
  String? summary;
  int? icon;
  bool? twoLine;
  String? seeAll;

  Data(
      {this.type,
      this.items,
      this.title,
      this.summary,
      this.icon,
      this.twoLine,
      this.seeAll});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    title = json['title'];
    summary = json['summary'];
    icon = json['icon'];
    twoLine = json['two_line'];
    seeAll = json['see_all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['summary'] = summary;
    data['icon'] = icon;
    data['two_line'] = twoLine;
    data['see_all'] = seeAll;
    return data;
  }

  @override
  String toString() {
    return 'Data{type: $type, items: $items, title: $title, summary: $summary, icon: $icon, twoLine: $twoLine, seeAll: $seeAll}';
  }
}

class Item {
  String? title;
  String? image;
  String? link;
  double? minPrice;
  double? price;
  String? listingId;
  String? createdSince;
  String? updatedSince;
  Category? category;
  String? categorySlug;
  String? slug;
  List<Attributes>? attributes;
  String? thumbnail;
  bool? isSpam;
  bool? isPremium;
  bool? isVerified;
  String? expiryDate;
  String? offer;
  bool? isChatAllowed;
  bool? isOffensive;
  bool? isAuction;
  bool? outKashmir;
  int? viewers;
  String? status;
  String? locality;
  String? city;
  int? posted;
  Transact? transact;
  bool? inWishlist;

  Item(
      {this.title,
      this.image,
      this.link,
      this.minPrice,
      this.price,
      this.listingId,
      this.createdSince,
      this.updatedSince,
      this.category,
      this.categorySlug,
      this.slug,
      this.attributes,
      this.thumbnail,
      this.isSpam,
      this.isPremium,
      this.isVerified,
      this.expiryDate,
      this.offer,
      this.isChatAllowed,
      this.isOffensive,
      this.isAuction,
      this.outKashmir,
      this.viewers,
      this.status,
      this.locality,
      this.city,
      this.posted,
      this.transact,
      this.inWishlist});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    link = json['link'];
    minPrice = json['min_price'];
    price = json['price'];
    listingId = json['listing_id'];
    createdSince = json['created_since'];
    updatedSince = json['updated_since'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    categorySlug = json['category_slug'];
    slug = json['slug'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'];
    isSpam = json['is_spam'];
    isPremium = json['is_premium'];
    isVerified = json['is_verified'];
    expiryDate = json['expiry_date'];
    offer = json['offer'];
    isChatAllowed = json['is_chat_allowed'];
    isOffensive = json['is_offensive'];
    isAuction = json['is_auction'];
    outKashmir = json['out_kashmir'];
    viewers = json['viewers'];
    status = json['status'];
    locality = json['locality'];
    city = json['city'];
    posted = json['posted'];
    transact =
        json['transact'] != null ? Transact.fromJson(json['transact']) : null;
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['link'] = link;
    data['min_price'] = minPrice;
    data['price'] = price;
    data['listing_id'] = listingId;
    data['created_since'] = createdSince;
    data['updated_since'] = updatedSince;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['category_slug'] = categorySlug;
    data['slug'] = slug;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['thumbnail'] = thumbnail;
    data['is_spam'] = isSpam;
    data['is_premium'] = isPremium;
    data['is_verified'] = isVerified;
    data['expiry_date'] = expiryDate;
    data['offer'] = offer;
    data['is_chat_allowed'] = isChatAllowed;
    data['is_offensive'] = isOffensive;
    data['is_auction'] = isAuction;
    data['out_kashmir'] = outKashmir;
    data['viewers'] = viewers;
    data['status'] = status;
    data['locality'] = locality;
    data['city'] = city;
    data['posted'] = posted;
    if (transact != null) {
      data['transact'] = transact!.toJson();
    }
    data['in_wishlist'] = inWishlist;
    return data;
  }

  @override
  String toString() {
    return 'Items{title: $title, image: $image, link: $link, minPrice: $minPrice, price: $price, listingId: $listingId, createdSince: $createdSince, updatedSince: $updatedSince, category: $category, categorySlug: $categorySlug, slug: $slug, attributes: $attributes, thumbnail: $thumbnail, isSpam: $isSpam, isPremium: $isPremium, isVerified: $isVerified, expiryDate: $expiryDate, offer: $offer, isChatAllowed: $isChatAllowed, isOffensive: $isOffensive, isAuction: $isAuction, outKashmir: $outKashmir, viewers: $viewers, status: $status, locality: $locality, city: $city, posted: $posted, transact: $transact, inWishlist: $inWishlist}';
  }
}

class Category {
  String? name;
  String? slug;
  int? id;
  String? description;
  String? icon;

  Category({this.name, this.slug, this.id, this.description, this.icon});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['id'] = id;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  @override
  String toString() {
    return 'Category{name: $name, slug: $slug, id: $id, description: $description, icon: $icon}';
  }
}

class Attributes {
  int? id;
  String? key;
  int? keyId;
  String? value;
  bool? required;
  int? ordering;
  String? unit;

  Attributes(
      {this.id,
      this.key,
      this.keyId,
      this.value,
      this.required,
      this.ordering,
      this.unit});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    keyId = json['key_id'];
    value = json['value'];
    required = json['required'];
    ordering = json['ordering'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['key_id'] = keyId;
    data['value'] = value;
    data['required'] = required;
    data['ordering'] = ordering;
    data['unit'] = unit;
    return data;
  }

  @override
  String toString() {
    return 'Attributes{id: $id, key: $key, keyId: $keyId, value: $value, required: $required, ordering: $ordering, unit: $unit}';
  }
}

class Transact {
  String? name;
  int? id;
  String? slug;
  String? labelSeller;
  String? labelBuyer;
  String? icon;
  String? priceUnit;

  Transact(
      {this.name,
      this.id,
      this.slug,
      this.labelSeller,
      this.labelBuyer,
      this.icon,
      this.priceUnit});

  Transact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    labelSeller = json['label_seller'];
    labelBuyer = json['label_buyer'];
    icon = json['icon'];
    priceUnit = json['price_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['slug'] = slug;
    data['label_seller'] = labelSeller;
    data['label_buyer'] = labelBuyer;
    data['icon'] = icon;
    data['price_unit'] = priceUnit;
    return data;
  }

  @override
  String toString() {
    return 'Transact{name: $name, id: $id, slug: $slug, labelSeller: $labelSeller, labelBuyer: $labelBuyer, icon: $icon, priceUnit: $priceUnit}';
  }
}

class BackgroundImages {
  String? title;
  String? image;
  int? id;

  BackgroundImages({this.title, this.image, this.id});

  BackgroundImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'BackgroundImages{title: $title, image: $image, id: $id}';
  }
}
