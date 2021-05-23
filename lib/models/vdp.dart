// To parse this JSON data, do
//
//     final vdpItem = vdpItemFromJson(jsonString);

import 'dart:convert';

List<VdpItem> vdpItemFromJson(String str) =>
    List<VdpItem>.from(json.decode(str).map((x) => VdpItem.fromJson(x)));

String vdpItemToJson(List<VdpItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VdpItem {
  VdpItem({
    this.type,
    this.facility,
    this.reviews,
    this.price,
    this.image,
    this.address,
    this.discription,
    this.host,
  });

  String type;
  Facility facility;
  List<Review> reviews;
  Price price;
  Image image;
  Address address;
  String discription;
  Host host;

  factory VdpItem.fromJson(Map<String, dynamic> json) => VdpItem(
        type: json["type"],
        facility: Facility.fromJson(json["facility"]),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        price: Price.fromJson(json["price"]),
        image: Image.fromJson(json["image"]),
        address: Address.fromJson(json["address"]),
        discription: json["discription"],
        host: Host.fromJson(json["host"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "facility": facility.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "price": price.toJson(),
        "image": image.toJson(),
        "address": address.toJson(),
        "discription": discription,
        "host": host.toJson(),
      };
}

class Address {
  Address({
    this.city,
    this.district,
    this.addressNumber,
    this.ward,
  });

  String city;
  String district;
  String addressNumber;
  String ward;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        district: json["district"],
        addressNumber: json["addressNumber"],
        ward: json["ward"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "district": district,
        "addressNumber": addressNumber,
        "ward": ward,
      };
}

class Facility {
  Facility({
    this.bath,
    this.square,
    this.mezzanine,
    this.bedroom,
    this.wife,
  });

  String bath;
  String square;
  String mezzanine;
  String bedroom;
  String wife;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        bath: json["bath"],
        square: json["square"],
        mezzanine: json["mezzanine"],
        bedroom: json["bedroom"],
        wife: json["wife"],
      );

  Map<String, dynamic> toJson() => {
        "bath": bath,
        "square": square,
        "mezzanine": mezzanine,
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
    this.url,
  });

  String alt;
  List<String> url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        alt: json["alt"],
        url: List<String>.from(json["url"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "alt": alt,
        "url": List<dynamic>.from(url.map((x) => x)),
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
