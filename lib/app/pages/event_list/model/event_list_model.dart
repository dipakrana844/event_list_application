import 'dart:convert';

import 'package:flutter/material.dart';

EventListModel? eventDetailModelFromJson(String str) {
  try {
    final jsonData = json.decode(str);
    return EventListModel.fromJson(jsonData);
  } catch (e) {
    debugPrint('Error parsing JSON: $e');
    return null;
  }
}

String eventDetailModelToJson(EventListModel data) =>
    json.encode(data.toJson());

class EventListModel {
  Request? request;
  int? count;
  List<Item>? item;

  EventListModel({
    this.request,
    this.count,
    this.item,
  });

  factory EventListModel.fromJson(Map<String, dynamic> json) => EventListModel(
        request: Request.fromJson(json["request"]),
        count: json["count"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request": request!.toJson(),
        "count": count,
        "item": List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}

class Item {
  String? eventId;
  String? eventname;
  String? eventnameRaw;
  String? ownerId;
  String? thumbUrl;
  String? thumbUrlLarge;
  int? startTime;
  String? startTimeDisplay;
  int? endTime;
  String? endTimeDisplay;
  String? location;
  Venue? venue;
  String? label;
  int? featured;
  String? eventUrl;
  String? shareUrl;
  String? bannerUrl;
  double? score;
  List<String>? categories;
  List<String>? tags;
  Tickets? tickets;
  List<dynamic>? customParams;

  Item({
    this.eventId,
    this.eventname,
    this.eventnameRaw,
    this.ownerId,
    this.thumbUrl,
    this.thumbUrlLarge,
    this.startTime,
    this.startTimeDisplay,
    this.endTime,
    this.endTimeDisplay,
    this.location,
    this.venue,
    this.label,
    this.featured,
    this.eventUrl,
    this.shareUrl,
    this.bannerUrl,
    this.score,
    this.categories,
    this.tags,
    this.tickets,
    this.customParams,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        eventId: json["event_id"],
        eventname: json["eventname"],
        eventnameRaw: json["eventname_raw"],
        ownerId: json["owner_id"],
        thumbUrl: json["thumb_url"],
        thumbUrlLarge: json["thumb_url_large"],
        startTime: json["start_time"],
        startTimeDisplay: json["start_time_display"],
        endTime: json["end_time"],
        endTimeDisplay: json["end_time_display"],
        location: json["location"],
        venue: Venue.fromJson(json["venue"]),
        label: json["label"],
        featured: json["featured"],
        eventUrl: json["event_url"],
        shareUrl: json["share_url"],
        bannerUrl: json["banner_url"],
        score: json["score"].toDouble(),
        categories: List<String>.from(json["categories"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        tickets: Tickets.fromJson(json["tickets"]),
        customParams: List<dynamic>.from(json["custom_params"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "eventname": eventname,
        "eventname_raw": eventnameRaw,
        "owner_id": ownerId,
        "thumb_url": thumbUrl,
        "thumb_url_large": thumbUrlLarge,
        "start_time": startTime,
        "start_time_display": startTimeDisplay,
        "end_time": endTime,
        "end_time_display": endTimeDisplay,
        "location": location,
        "venue": venue!.toJson(),
        "label": label,
        "featured": featured,
        "event_url": eventUrl,
        "share_url": shareUrl,
        "banner_url": bannerUrl,
        "score": score,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "tickets": tickets!.toJson(),
        "custom_params": List<dynamic>.from(customParams!.map((x) => x)),
      };
}

class Tickets {
  bool? hasTickets;
  String? ticketUrl;
  TicketCurrency? ticketCurrency;
  int? minTicketPrice;
  int? maxTicketPrice;

  Tickets({
    this.hasTickets,
    this.ticketUrl,
    this.ticketCurrency,
    this.minTicketPrice,
    this.maxTicketPrice,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        hasTickets: json["has_tickets"],
        ticketUrl: json["ticket_url"],
        ticketCurrency: ticketCurrencyValues.map[json["ticket_currency"]],
        minTicketPrice: json["min_ticket_price"],
        maxTicketPrice: json["max_ticket_price"],
      );

  Map<String, dynamic> toJson() => {
        "has_tickets": hasTickets,
        "ticket_url": ticketUrl,
        "ticket_currency": ticketCurrencyValues.reverse[ticketCurrency],
        "min_ticket_price": minTicketPrice,
        "max_ticket_price": maxTicketPrice,
      };
}

enum TicketCurrency { INR }

final ticketCurrencyValues = EnumValues({"INR": TicketCurrency.INR});

class Venue {
  String? street;
  City? city;
  State? state;
  Country? country;
  double? latitude;
  double? longitude;
  String? fullAddress;

  Venue({
    this.street,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.fullAddress,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        street: json["street"],
        city: cityValues.map[json["city"]],
        state: stateValues.map[json["state"]],
        country: countryValues.map[json["country"]],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        fullAddress: json["full_address"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": cityValues.reverse[city],
        "state": stateValues.reverse[state],
        "country": countryValues.reverse[country],
        "latitude": latitude,
        "longitude": longitude,
        "full_address": fullAddress,
      };
}

enum City { AHMEDABAD }

final cityValues = EnumValues({"Ahmedabad": City.AHMEDABAD});

enum Country { INDIA }

final countryValues = EnumValues({"India": Country.INDIA});

enum State { GUJARAT, GJ, EMPTY }

final stateValues =
    EnumValues({"": State.EMPTY, "GJ": State.GJ, "Gujarat": State.GUJARAT});

class Request {
  String? venue;
  String? ids;
  String? type;
  String? city;
  int? edate;
  int? page;
  String? keywords;
  int? sdate;
  String? category;
  String? cityDisplay;
  int? rows;

  Request({
    this.venue,
    this.ids,
    this.type,
    this.city,
    this.edate,
    this.page,
    this.keywords,
    this.sdate,
    this.category,
    this.cityDisplay,
    this.rows,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        venue: json["venue"],
        ids: json["ids"],
        type: json["type"],
        city: json["city"],
        edate: json["edate"],
        page: json["page"],
        keywords: json["keywords"],
        sdate: json["sdate"],
        category: json["category"],
        cityDisplay: json["city_display"],
        rows: json["rows"],
      );

  Map<String, dynamic> toJson() => {
        "venue": venue,
        "ids": ids,
        "type": type,
        "city": city,
        "edate": edate,
        "page": page,
        "keywords": keywords,
        "sdate": sdate,
        "category": category,
        "city_display": cityDisplay,
        "rows": rows,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
