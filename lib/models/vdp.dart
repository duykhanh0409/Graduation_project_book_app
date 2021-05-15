import 'dart:convert';

class VdpItem {
  VdpItem({
    this.image,
    this.type,
    this.host,
    this.discription,
    this.price,
    this.reviews,
    this.facility,
    this.address,
    this.id,
  });

  List<Image> image;
  String type;
  Host host;
  String discription;
  Price price;
  List<Review> reviews;
  Facility facility;
  Address address;
  String id;

  factory VdpItem.fromJson(Map<String, dynamic> json) => VdpItem(
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        type: json["type"],
        host: Host.fromJson(json["host"]),
        discription: json["discription"],
        price: Price.fromJson(json["price"]),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        facility: Facility.fromJson(json["facility"]),
        address: Address.fromJson(json["address"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "type": type,
        "host": host.toJson(),
        "discription": discription,
        "price": price.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "facility": facility.toJson(),
        "address": address.toJson(),
        "id": id,
      };
}

class Address {
  Address({
    this.addressNumber,
    this.district,
    this.ward,
    this.city,
  });

  String addressNumber;
  String district;
  String ward;
  String city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressNumber: json["addressNumber"],
        district: json["district"],
        ward: json["ward"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "addressNumber": addressNumber,
        "district": district,
        "ward": ward,
        "city": city,
      };
}

class Facility {
  Facility({
    this.mezzanine,
    this.bath,
    this.square,
    this.bedroom,
    this.wife,
  });

  String mezzanine;
  String bath;
  String square;
  String bedroom;
  String wife;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        mezzanine: json["mezzanine"],
        bath: json["bath"],
        square: json["square"],
        bedroom: json["bedroom"],
        wife: json["wife"],
      );

  Map<String, dynamic> toJson() => {
        "mezzanine": mezzanine,
        "bath": bath,
        "square": square,
        "bedroom": bedroom,
        "wife": wife,
      };
}

class Host {
  Host({
    this.hostId,
  });

  String hostId;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        hostId: json["host_id"],
      );

  Map<String, dynamic> toJson() => {
        "host_id": hostId,
      };
}

class Image {
  Image({
    this.alt,
    this.img,
  });

  String alt;
  String img;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        alt: json["alt"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "alt": alt,
        "img": img,
      };
}

class Price {
  Price({
    this.water,
    this.electricity,
    this.room,
  });

  String water;
  String electricity;
  String room;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        water: json["water"],
        electricity: json["electricity"],
        room: json["room"],
      );

  Map<String, dynamic> toJson() => {
        "water": water,
        "electricity": electricity,
        "room": room,
      };
}

class Review {
  Review({
    this.reviewerId,
    this.comment,
  });

  String reviewerId;
  String comment;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewerId: json["reviewerID"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "reviewerID": reviewerId,
        "comment": comment,
      };
}
