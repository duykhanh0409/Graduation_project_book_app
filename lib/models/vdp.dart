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
    this.reviews,
    this.image,
    this.address,
    this.type,
    this.host,
    this.facility,
    this.discription,
    this.price,
    this.id,
  });

  List<Review> reviews;
  Image image;
  Address address;
  String type;
  Host host;
  Facility facility;
  String discription;
  Price price;
  String id;

  factory VdpItem.fromJson(Map<String, dynamic> json) => VdpItem(
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        image: Image.fromJson(json["image"]),
        address: Address.fromJson(json["address"]),
        type: json["type"],
        host: Host.fromJson(json["host"]),
        facility: Facility.fromJson(json["facility"]),
        discription: json["discription"],
        price: Price.fromJson(json["price"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "image": image.toJson(),
        "address": address.toJson(),
        "type": type,
        "host": host.toJson(),
        "facility": facility.toJson(),
        "discription": discription,
        "price": price.toJson(),
        "id": id,
      };
}

class Address {
  Address({
    this.ward,
    this.district,
    this.addressNumber,
    this.city,
  });

  String ward;
  String district;
  String addressNumber;
  String city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        ward: json["ward"],
        district: json["district"],
        addressNumber: json["addressNumber"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "ward": ward,
        "district": district,
        "addressNumber": addressNumber,
        "city": city,
      };
}

class Facility {
  Facility({
    this.wife,
    this.bath,
    this.mezzanine,
    this.bedroom,
    this.square,
  });

  String wife;
  String bath;
  String mezzanine;
  String bedroom;
  String square;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        wife: json["wife"],
        bath: json["bath"],
        mezzanine: json["mezzanine"],
        bedroom: json["bedroom"],
        square: json["square"],
      );

  Map<String, dynamic> toJson() => {
        "wife": wife,
        "bath": bath,
        "mezzanine": mezzanine,
        "bedroom": bedroom,
        "square": square,
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
    this.url,
    this.alt,
  });

  List<String> url;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: List<String>.from(json["url"].map((x) => x)),
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "url": List<dynamic>.from(url.map((x) => x)),
        "alt": alt,
      };
}

class Price {
  Price({
    this.room,
    this.electricity,
    this.water,
  });

  String room;
  String electricity;
  String water;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        room: json["room"],
        electricity: json["electricity"],
        water: json["water"],
      );

  Map<String, dynamic> toJson() => {
        "room": room,
        "electricity": electricity,
        "water": water,
      };
}

class Review {
  Review({
    this.comment,
    this.reviewerId,
  });

  String comment;
  String reviewerId;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        comment: json["comment"],
        reviewerId: json["reviewerID"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "reviewerID": reviewerId,
      };
}
