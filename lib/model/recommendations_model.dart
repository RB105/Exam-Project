import 'dart:convert';

RecommedationsModel recommedationsModelFromJson(String str) =>
    RecommedationsModel.fromJson(json.decode(str));

class RecommedationsModel {
  Search search;
  List<FlightElement> flights;
  List<String> segmentsComments;
  String healthDeclarationText;
  List<dynamic> predefinedAirlines;
  List<dynamic> excludedAirlines;

  RecommedationsModel({
    required this.search,
    required this.flights,
    required this.segmentsComments,
    required this.healthDeclarationText,
    required this.predefinedAirlines,
    required this.excludedAirlines,
  });

  factory RecommedationsModel.fromJson(Map<String, dynamic> json) =>
      RecommedationsModel(
        search: Search.fromJson(json["search"]),
        flights: json["flights"] != null
            ? List<FlightElement>.from(
                json["flights"].map((x) => FlightElement.fromJson(x)))
            : [],
        segmentsComments: json["segments_comments"] is Map<String, dynamic>
            ? (json["segments_comments"] as Map)
                .values
                .map((e) => e.toString())
                .toList()
            : [],
        healthDeclarationText: json["health_declaration_text"],
        predefinedAirlines: json["segments_comments"] != null
            ? List<dynamic>.from(json["predefined_airlines"].map((x) => x))
            : [],
        excludedAirlines: json["excluded_airlines"] != null
            ? List<dynamic>.from(json["excluded_airlines"].map((x) => x))
            : [],
      );
}

class FlightElement {
  String id;
  bool isTourOperator;
  String tariff;
  String tariffClass;
  String fareFamilyType;
  bool fareFamilyFlag;
  String fareFamilyMarketingName;
  int duration;
  dynamic segmentsCount;
  String type;
  bool isInnerFlight;
  bool isBaggage;
  bool isCharter;
  bool isRefund;
  bool isHideTariff;
  bool isSubsidized;
  String bookUrl;
  dynamic citizenships;
  bool isVtrip;
  Provider provider;
  String officeId;
  FlightPrice price;
  List<dynamic> priceDetails;
  ExtraBaggage extraBaggage;
  List<FlightSegment> segments;
  List<List<int>> segmentsDirection;
  List<Upgrade> upgrades;
  List<dynamic> pricerInfo;
  Map<String, Document> documents;
  dynamic ticketingTimeLimit;
  bool bookingWithPartialDataAllowed;
  dynamic specialTariffType;
  AgeThresholds ageThresholds;
  bool isHealthDeclarationChecked;

  FlightElement({
    required this.id,
    required this.isTourOperator,
    required this.tariff,
    required this.tariffClass,
    required this.fareFamilyType,
    required this.fareFamilyFlag,
    required this.fareFamilyMarketingName,
    required this.duration,
    required this.segmentsCount,
    required this.type,
    required this.isInnerFlight,
    required this.isBaggage,
    required this.isCharter,
    required this.isRefund,
    required this.isHideTariff,
    required this.isSubsidized,
    required this.bookUrl,
    required this.citizenships,
    required this.isVtrip,
    required this.provider,
    required this.officeId,
    required this.price,
    required this.priceDetails,
    required this.extraBaggage,
    required this.segments,
    required this.segmentsDirection,
    required this.upgrades,
    required this.pricerInfo,
    required this.documents,
    required this.ticketingTimeLimit,
    required this.bookingWithPartialDataAllowed,
    required this.specialTariffType,
    required this.ageThresholds,
    required this.isHealthDeclarationChecked,
  });

  factory FlightElement.fromJson(Map<String, dynamic> json) => FlightElement(
        id: json["id"] ?? "",
        isTourOperator: json["is_tour_operator"] ?? false,
        tariff: json["tariff"] ?? "",
        tariffClass: json["tariff_class"] ?? "",
        fareFamilyType: json["fare_family_type"] ?? "",
        fareFamilyFlag: json["fare_family_flag"] ?? false,
        fareFamilyMarketingName: json["fare_family_marketing_name"],
        duration: json["duration"] ?? "",
        segmentsCount: json["segments_count"] ?? "",
        type: json["type"] ?? "",
        isInnerFlight: json["is_inner_flight"] ?? false,
        isBaggage: json["is_baggage"] ?? false,
        isCharter: json["is_charter"] ?? false,
        isRefund: json["is_refund"] ?? false,
        isHideTariff: json["is_hide_tariff"] ?? false,
        isSubsidized: json["is_subsidized"] ?? false,
        bookUrl: json["book_url"] ?? "",
        citizenships: json["citizenships"] ?? "",
        isVtrip: json["is_vtrip"] ?? false,
        provider: json["provider"] is Map<String, dynamic>
            ? Provider.fromJson(json["provider"])
            : Provider(
                gds: 0,
                name: "",
                supplier: Supplier(id: 0, code: "", title: "")),
        officeId: json["office_id"] ?? "",
        price: json["price"] is Map<String, dynamic>
            ? FlightPrice.fromJson(json["price"])
            : FlightPrice(
                rub: FluffyRub(
                    amount: 0,
                    passengersAmounts: PassengersAmounts(adult: ""),
                    agentModePrices: AgentModePrices(
                        totalAmountForActiveAgentMode: "",
                        totalAmountForNonActiveAgentMode: "",
                        totalPartnerAffiliateFee: "",
                        debitFromBalance: "",
                        passengersAmountsDetails: []),
                    comsa: 0,
                    partnerAffiliateFee: 0,
                    startPrice: 0,
                    passengersAmountsDetails: []),
                uzs: json['UZS'] is Map<String, dynamic>
                    ? FluffyUzs.fromJson(json['UZS'])
                    : FluffyUzs(amount: 0)),
        priceDetails: json["price_details"] != null
            ? List<dynamic>.from(json["price_details"].map((x) => x))
            : [],
        extraBaggage: json['extra_bagger'] is Map<String, dynamic>
            ? ExtraBaggage.fromJson(json["extra_baggage"])
            : ExtraBaggage(
                list: [],
                limit: Limit(
                    holdWeight: 0,
                    handWeight: 0,
                    handHeight: 0,
                    handWidth: 0,
                    handLength: 0)),
        segments: json["segments"] != null
            ? List<FlightSegment>.from(
                json["segments"].map((x) => FlightSegment.fromJson(x)))
            : [],
        segmentsDirection: json["segments_direction"] != null
            ? (json["segments_direction"] as List)
                .map((innerList) => (innerList as List).cast<int>())
                .toList()
            : [],
        upgrades: json["upgrades"] != null
            ? List<Upgrade>.from(
                json["upgrades"].map((x) => Upgrade.fromJson(x)))
            : [],
        pricerInfo: json["pricer_info"] != null
            ? List<dynamic>.from(json["pricer_info"].map((x) => x))
            : [],
        documents: Map.from(json["documents"])
            .map((k, v) => MapEntry<String, Document>(k, Document.fromJson(v))),
        ticketingTimeLimit: json["ticketing_time_limit"] ?? "",
        bookingWithPartialDataAllowed:
            json["booking_with_partial_data_allowed"] ?? false,
        specialTariffType: json["special_tariff_type"] ?? "",
        ageThresholds: json["age_thresholds"] is Map<String, dynamic>
            ? AgeThresholds.fromJson(json["age_thresholds"])
            : AgeThresholds(
                infant: Adult(min: 0, max: 0),
                child: Adult(min: 0, max: Adult(min: 0, max: 0)),
                adult: Adult(min: 0, max: 0)),
        isHealthDeclarationChecked:
            json["is_health_declaration_checked"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_tour_operator": isTourOperator,
        "tariff": tariff,
        "tariff_class": tariffClass,
        "fare_family_type": fareFamilyType,
        "fare_family_flag": fareFamilyFlag,
        "fare_family_marketing_name": fareFamilyMarketingName,
        "duration": duration,
        "segments_count": segmentsCount,
        "type": type,
        "is_inner_flight": isInnerFlight,
        "is_baggage": isBaggage,
        "is_charter": isCharter,
        "is_refund": isRefund,
        "is_hide_tariff": isHideTariff,
        "is_subsidized": isSubsidized,
        "book_url": bookUrl,
        "citizenships": citizenships,
        "is_vtrip": isVtrip,
        "provider": provider.toJson(),
        "office_id": officeId,
        "price": price.toJson(),
        "price_details": List<dynamic>.from(priceDetails.map((x) => x)),
        "extra_baggage": extraBaggage.toJson(),
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
        "segments_direction": List<dynamic>.from(
            segmentsDirection.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "upgrades": List<dynamic>.from(upgrades.map((x) => x.toJson())),
        "pricer_info": List<dynamic>.from(pricerInfo.map((x) => x)),
        "documents": Map.from(documents)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "ticketing_time_limit": ticketingTimeLimit,
        "booking_with_partial_data_allowed": bookingWithPartialDataAllowed,
        "special_tariff_type": specialTariffType,
        "age_thresholds": ageThresholds.toJson(),
        "is_health_declaration_checked": isHealthDeclarationChecked,
      };
}

class AgeThresholds {
  Adult infant;
  Adult child;
  Adult adult;

  AgeThresholds({
    required this.infant,
    required this.child,
    required this.adult,
  });

  factory AgeThresholds.fromJson(Map<String, dynamic> json) => AgeThresholds(
        infant: json["infant"] is Map<String, dynamic>
            ? Adult.fromJson(json["infant"])
            : Adult(min: 0, max: 0),
        child: json["child"] is Map<String, dynamic>
            ? Adult.fromJson(json["child"])
            : Adult(min: 0, max: 0),
        adult: json["adult"] is Map<String, dynamic>
            ? Adult.fromJson(json["adult"])
            : Adult(min: 0, max: 0),
      );

  Map<String, dynamic> toJson() => {
        "infant": infant.toJson(),
        "child": child.toJson(),
        "adult": adult.toJson(),
      };
}

class Adult {
  dynamic min;
  dynamic max;

  Adult({
    required this.min,
    required this.max,
  });

  factory Adult.fromJson(Map<String, dynamic> json) => Adult(
        min: json["min"] ?? 0,
        max: json["max"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}

class Document {
  List<String> ru;
  List<String> other;

  Document({
    required this.ru,
    required this.other,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        ru: json["ru"] != null
            ? List<String>.from(json["ru"].map((x) => x))
            : [],
        other: json["other"] != null
            ? List<String>.from(json["other"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ru": List<dynamic>.from(ru.map((x) => x)),
        "other": List<dynamic>.from(other.map((x) => x)),
      };
}

class ExtraBaggage {
  List<ListElement> list;
  Limit limit;

  ExtraBaggage({
    required this.list,
    required this.limit,
  });

  factory ExtraBaggage.fromJson(Map<String, dynamic> json) => ExtraBaggage(
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : [],
        limit: json["limit"] is Map<String, dynamic>
            ? Limit.fromJson(json["limit"])
            : Limit(
                holdWeight: 0,
                handWeight: 0,
                handHeight: 0,
                handWidth: 0,
                handLength: 0),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "limit": limit.toJson(),
      };
}

class Limit {
  int holdWeight;
  int handWeight;
  int handHeight;
  int handWidth;
  int handLength;

  Limit({
    required this.holdWeight,
    required this.handWeight,
    required this.handHeight,
    required this.handWidth,
    required this.handLength,
  });

  factory Limit.fromJson(Map<String, dynamic> json) => Limit(
        handWeight: json["hand_weight"] ?? 0,
        holdWeight: json["hold_weight"] ?? 0,
        handHeight: json["hand_height"] ?? 0,
        handWidth: json["hand_width"] ?? 0,
        handLength: json["hand_length"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "hold_weight": holdWeight,
        "hand_weight": handWeight,
        "hand_height": handHeight,
        "hand_width": handWidth,
        "hand_length": handLength,
      };
}

class ListElement {
  dynamic count;
  ListPrice price;

  ListElement({
    required this.count,
    required this.price,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        count: json["count"] ?? 0,
        price: json["price"] is Map<String, dynamic>
            ? ListPrice.fromJson(json["price"])
            : ListPrice(rub: PurpleRub(amount: 0)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "price": price.toJson(),
      };
}

class ListPrice {
  PurpleRub rub;

  ListPrice({
    required this.rub,
  });

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        rub: json["RUB"] is Map<String, dynamic>
            ? PurpleRub.fromJson(json["RUB"])
            : PurpleRub(amount: 0),
      );

  Map<String, dynamic> toJson() => {
        "RUB": rub.toJson(),
      };
}

class PurpleRub {
  dynamic amount;

  PurpleRub({
    required this.amount,
  });

  factory PurpleRub.fromJson(Map<String, dynamic> json) => PurpleRub(
        amount: json["amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class FlightPrice {
  FluffyRub rub;
  FluffyUzs uzs;

  FlightPrice({required this.rub, required this.uzs});

  factory FlightPrice.fromJson(Map<String, dynamic> json) => FlightPrice(
        rub: json["RUB"] is Map<String, dynamic>
            ? FluffyRub.fromJson(json["RUB"])
            : FluffyRub(
                amount: 0,
                passengersAmounts: PassengersAmounts(adult: 0),
                agentModePrices: AgentModePrices(
                    totalAmountForActiveAgentMode: "",
                    totalAmountForNonActiveAgentMode: "",
                    totalPartnerAffiliateFee: "",
                    debitFromBalance: "",
                    passengersAmountsDetails: []),
                comsa: "",
                partnerAffiliateFee: "",
                startPrice: 0.0,
                passengersAmountsDetails: []),
        uzs: json['UZS'] is Map<String, dynamic>
            ? FluffyUzs.fromJson(json['UZS'])
            : FluffyUzs(amount: 0),
      );

  Map<String, dynamic> toJson() => {
        "RUB": rub.toJson(),
      };
}

class FluffyRub {
  dynamic amount;
  PassengersAmounts? passengersAmounts;
  AgentModePrices agentModePrices;
  dynamic comsa;
  dynamic partnerAffiliateFee;
  double startPrice;
  List<RubPassengersAmountsDetail> passengersAmountsDetails;

  FluffyRub({
    required this.amount,
    required this.passengersAmounts,
    required this.agentModePrices,
    required this.comsa,
    required this.partnerAffiliateFee,
    required this.startPrice,
    required this.passengersAmountsDetails,
  });

  factory FluffyRub.fromJson(Map<String, dynamic> json) => FluffyRub(
        amount: json["amount"] ?? "",
        passengersAmounts: json['passengers_amounts'] is Map<String, dynamic>
            ? PassengersAmounts.fromJson(json["passengers_amounts"])
            : PassengersAmounts(adult: 0),
        agentModePrices: json["agent_mode_prices"] is Map<String, dynamic>
            ? AgentModePrices.fromJson(json["agent_mode_prices"])
            : AgentModePrices(
                totalAmountForActiveAgentMode: "",
                totalAmountForNonActiveAgentMode: "",
                totalPartnerAffiliateFee: "",
                debitFromBalance: "",
                passengersAmountsDetails: []),
        comsa: json["comsa"] ?? "0",
        partnerAffiliateFee: json["partner_affiliate_fee"] ?? "0",
        startPrice: json["start_price"]?.toDouble() ?? "0",
        passengersAmountsDetails: json["passengers_amounts_details"] != null
            ? (json["passengers_amounts_details"] as List)
                .map((x) => RubPassengersAmountsDetail.fromJson(x))
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "passengers_amounts": passengersAmounts!.toJson(),
        "agent_mode_prices": agentModePrices.toJson(),
        "comsa": comsa,
        "partner_affiliate_fee": partnerAffiliateFee,
        "start_price": startPrice,
        "passengers_amounts_details":
            List<dynamic>.from(passengersAmountsDetails.map((x) => x.toJson())),
      };
}

class AgentModePrices {
  dynamic totalAmountForActiveAgentMode;
  dynamic totalAmountForNonActiveAgentMode;
  dynamic totalPartnerAffiliateFee;
  dynamic debitFromBalance;
  List<AgentModePricesPassengersAmountsDetail> passengersAmountsDetails;

  AgentModePrices({
    required this.totalAmountForActiveAgentMode,
    required this.totalAmountForNonActiveAgentMode,
    required this.totalPartnerAffiliateFee,
    required this.debitFromBalance,
    required this.passengersAmountsDetails,
  });

  factory AgentModePrices.fromJson(Map<String, dynamic> json) =>
      AgentModePrices(
        totalAmountForActiveAgentMode:
            json["total_amount_for_active_agent_mode"] ?? "",
        totalAmountForNonActiveAgentMode:
            json["total_amount_for_non_active_agent_mode"] ?? "",
        totalPartnerAffiliateFee: json["total_partner_affiliate_fee"] ?? "",
        debitFromBalance: json["debit_from_balance"] ?? "",
        passengersAmountsDetails: json["passengers_amounts_details"] != null
            ? List<AgentModePricesPassengersAmountsDetail>.from(
                json["passengers_amounts_details"].map(
                    (x) => AgentModePricesPassengersAmountsDetail.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "total_amount_for_active_agent_mode": totalAmountForActiveAgentMode,
        "total_amount_for_non_active_agent_mode":
            totalAmountForNonActiveAgentMode,
        "total_partner_affiliate_fee": totalPartnerAffiliateFee,
        "debit_from_balance": debitFromBalance,
        "passengers_amounts_details":
            List<dynamic>.from(passengersAmountsDetails.map((x) => x.toJson())),
      };
}

class AgentModePricesPassengersAmountsDetail {
  String type;
  dynamic serviceAmountForActiveAgentMode;
  dynamic serviceAmountForNonActiveAgentMode;

  AgentModePricesPassengersAmountsDetail({
    required this.type,
    required this.serviceAmountForActiveAgentMode,
    required this.serviceAmountForNonActiveAgentMode,
  });

  factory AgentModePricesPassengersAmountsDetail.fromJson(
          Map<String, dynamic> json) =>
      AgentModePricesPassengersAmountsDetail(
        type: json["type"] ?? "",
        serviceAmountForActiveAgentMode:
            json["service_amount_for_active_agent_mode"] ?? "",
        serviceAmountForNonActiveAgentMode:
            json["service_amount_for_non_active_agent_mode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "service_amount_for_active_agent_mode": serviceAmountForActiveAgentMode,
        "service_amount_for_non_active_agent_mode":
            serviceAmountForNonActiveAgentMode,
      };
}

class PassengersAmounts {
  dynamic adult;

  PassengersAmounts({
    required this.adult,
  });

  factory PassengersAmounts.fromJson(Map<String, dynamic> json) =>
      PassengersAmounts(
        adult: json["adult"] ?? "0",
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
      };
}

class RubPassengersAmountsDetail {
  String type;
  dynamic amount;
  dynamic tax;
  double tariff;
  double fee;
  dynamic partnerAffiliateFee;
  dynamic comsa;

  RubPassengersAmountsDetail({
    required this.type,
    required this.amount,
    required this.tax,
    required this.tariff,
    required this.fee,
    required this.partnerAffiliateFee,
    required this.comsa,
  });

  factory RubPassengersAmountsDetail.fromJson(Map<String, dynamic> json) =>
      RubPassengersAmountsDetail(
        type: json["type"] ?? "0",
        amount: json["amount"] ?? "0",
        tax: json["tax"] ?? "0",
        tariff: json["tariff"]?.toDouble() ?? "0",
        fee: json["fee"]?.toDouble() ?? "0",
        partnerAffiliateFee: json["partner_affiliate_fee"] ?? "0",
        comsa: json["comsa"] ?? "0",
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "tax": tax,
        "tariff": tariff,
        "fee": fee,
        "partner_affiliate_fee": partnerAffiliateFee,
        "comsa": comsa,
      };
}

class FluffyUzs {
  dynamic amount;

  FluffyUzs({this.amount});

  FluffyUzs.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    return data;
  }
}

class Provider {
  int gds;
  String name;
  Supplier supplier;

  Provider({
    required this.gds,
    required this.name,
    required this.supplier,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        gds: json["gds"] ?? 0,
        name: json["name"] ?? "",
        supplier: json["supplier"] is Map<String, dynamic>
            ? Supplier.fromJson(json["supplier"])
            : Supplier(id: 0, code: "", title: ""),
      );

  Map<String, dynamic> toJson() => {
        "gds": gds,
        "name": name,
        "supplier": supplier.toJson(),
      };
}

class Supplier {
  int id;
  String code;
  String title;
  String? shortTitle;

  Supplier({
    required this.id,
    required this.code,
    required this.title,
    this.shortTitle,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"] ?? 0,
        code: json["code"] ?? "",
        title: json["title"] ?? "",
        shortTitle: json["short_title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "title": title,
        "short_title": shortTitle,
      };
}

class FlightSegment {
  Arr arr;
  Arr dep;
  dynamic seats;
  String flightNumber;
  dynamic direction;
  FlightDuration duration;
  int routeDuration;
  bool isBaggage;
  Baggage baggage;
  String comment;
  String commentHash;
  Cbaggage cbaggage;
  bool isRefund;
  bool isChange;
  bool refund;
  bool change;
  Class segmentClass;
  bool first;
  bool last;
  String fareCode;
  Supplier carrier;
  Aircraft aircraft;
  List<dynamic> stops;
  String miles;
  String changeMiles;
  bool isMiniRulesExists;
  bool isOnlineCheckinRequired;
  List<dynamic> brands;
  Provider provider;
  String type;

  FlightSegment({
    required this.arr,
    required this.dep,
    required this.seats,
    required this.flightNumber,
    required this.direction,
    required this.duration,
    required this.routeDuration,
    required this.isBaggage,
    required this.baggage,
    required this.comment,
    required this.commentHash,
    required this.cbaggage,
    required this.isRefund,
    required this.isChange,
    required this.refund,
    required this.change,
    required this.segmentClass,
    required this.first,
    required this.last,
    required this.fareCode,
    required this.carrier,
    required this.aircraft,
    required this.stops,
    required this.miles,
    required this.changeMiles,
    required this.isMiniRulesExists,
    required this.isOnlineCheckinRequired,
    required this.brands,
    required this.provider,
    required this.type,
  });

  factory FlightSegment.fromJson(Map<String, dynamic> json) => FlightSegment(
        arr: json["arr"] is Map<String, dynamic>
            ? Arr.fromJson(json["arr"])
            : Arr(
                date: "",
                time: "",
                datetime: "",
                ts: "",
                terminal: "",
                airport: Supplier(id: 0, code: "", title: ""),
                city: Supplier(id: 0, code: "", title: ""),
                region: Supplier(id: 0, code: "", title: ""),
                country: Supplier(id: 0, code: "", title: "")),
        dep: json["dep"] is Map<String, dynamic>
            ? Arr.fromJson(json["dep"])
            : Arr(
                date: "",
                time: "",
                datetime: "",
                ts: "",
                terminal: "",
                airport: Supplier(id: 0, code: "", title: ""),
                city: Supplier(id: 0, code: "", title: ""),
                region: Supplier(id: 0, code: "", title: ""),
                country: Supplier(id: 0, code: "", title: "")),
        seats: json["seats"] ?? "",
        flightNumber: json["flight_number"] ?? "",
        direction: json["direction"] ?? "",
        duration: json["duration"] is Map<String, dynamic>
            ? FlightDuration.fromJson(json["duration"])
            : FlightDuration(
                flight: TransferClass(common: 0, hour: 0, minute: 0),
                transfer: TransferClass(common: 0, hour: 0, minute: 0)),
        routeDuration: json["route_duration"] ?? "",
        isBaggage: json["is_baggage"] ?? false,
        baggage: Baggage.fromJson(json["baggage"]),
        comment: json["comment"] ?? "",
        commentHash: json["comment_hash"] ?? "",
        cbaggage: Cbaggage.fromJson(json["cbaggage"]),
        isRefund: json["is_refund"] ?? false,
        isChange: json["is_change"] ?? false,
        refund: json["refund"] ?? false,
        change: json["change"] ?? false,
        segmentClass: json["class"] is Map<String, dynamic>
            ? Class.fromJson(json["class"])
            : Class(typeId: "", name: "", service: ""),
        first: json["first"] ?? false,
        last: json["last"] ?? false,
        fareCode: json["fare_code"] ?? "",
        carrier: json["carrier"] is Map<String, dynamic>
            ? Supplier.fromJson(json["carrier"])
            : Supplier(id: 0, code: "", title: ""),
        aircraft: json["aircraft"] is Map<String, dynamic>
            ? Aircraft.fromJson(json["aircraft"])
            : Aircraft(code: "", title: ""),
        stops: List<dynamic>.from(json["stops"].map((x) => x)),
        miles: json["miles"] ?? "",
        changeMiles: json["change_miles"] ?? "",
        isMiniRulesExists: json["is_mini_rules_exists"] ?? false,
        isOnlineCheckinRequired: json["is_online_checkin_required"] ?? false,
        brands: List<dynamic>.from(json["brands"].map((x) => x)),
        provider: Provider.fromJson(json["provider"]),
        type: json["type"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "arr": arr.toJson(),
        "dep": dep.toJson(),
        "seats": seats,
        "flight_number": flightNumber,
        "direction": direction,
        "duration": duration.toJson(),
        "route_duration": routeDuration,
        "is_baggage": isBaggage,
        "baggage": baggage.toJson(),
        "comment": comment,
        "comment_hash": commentHash,
        "cbaggage": cbaggage.toJson(),
        "is_refund": isRefund,
        "is_change": isChange,
        "refund": refund,
        "change": change,
        "class": segmentClass.toJson(),
        "first": first,
        "last": last,
        "fare_code": fareCode,
        "carrier": carrier.toJson(),
        "aircraft": aircraft.toJson(),
        "stops": List<dynamic>.from(stops.map((x) => x)),
        "miles": miles,
        "change_miles": changeMiles,
        "is_mini_rules_exists": isMiniRulesExists,
        "is_online_checkin_required": isOnlineCheckinRequired,
        "brands": List<dynamic>.from(brands.map((x) => x)),
        "provider": provider.toJson(),
        "type": type,
      };
}

class Aircraft {
  String code;
  String title;

  Aircraft({
    required this.code,
    required this.title,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json["code"] ?? "",
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
      };
}

class Arr {
  String date;
  String time;
  String datetime;
  dynamic ts;
  String terminal;
  Supplier airport;
  Supplier city;
  Supplier region;
  Supplier country;

  Arr({
    required this.date,
    required this.time,
    required this.datetime,
    required this.ts,
    required this.terminal,
    required this.airport,
    required this.city,
    required this.region,
    required this.country,
  });

  factory Arr.fromJson(Map<String, dynamic> json) => Arr(
        date: json["date"] ?? "",
        time: json["time"] ?? "",
        datetime: json["datetime"] ?? "",
        ts: json["ts"] ?? "",
        terminal: json["terminal"] ?? "",
        airport: json["airport"] is Map<String, dynamic>
            ? Supplier.fromJson(json["airport"])
            : Supplier(id: 0, code: "", title: ""),
        city: json["city"] is Map<String, dynamic>
            ? Supplier.fromJson(json["city"])
            : Supplier(id: 0, code: "", title: ""),
        region: json["region"] is Map<String, dynamic>
            ? Supplier.fromJson(json["region"])
            : Supplier(id: 0, code: "", title: ""),
        country: json["country"] is Map<String, dynamic>
            ? Supplier.fromJson(json["country"])
            : Supplier(id: 0, code: "", title: ""),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "datetime": datetime,
        "ts": ts,
        "terminal": terminal,
        "airport": airport.toJson(),
        "city": city.toJson(),
        "region": region.toJson(),
        "country": country.toJson(),
      };
}

class Baggage {
  dynamic piece;
  dynamic weight;

  Baggage({
    required this.piece,
    required this.weight,
  });

  factory Baggage.fromJson(Map<String, dynamic> json) => Baggage(
        piece: json["piece"] ?? "",
        weight: json["weight"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "piece": piece,
        "weight": weight,
      };
}

class Cbaggage {
  dynamic piece;
  dynamic weight;
  Dimensions dimensions;
  String weightUnit;

  Cbaggage({
    required this.piece,
    required this.weight,
    required this.dimensions,
    required this.weightUnit,
  });

  factory Cbaggage.fromJson(Map<String, dynamic> json) => Cbaggage(
        piece: json["piece"],
        weight: json["weight"],
        dimensions: json["dimensions"] is Map<String, dynamic>
            ? Dimensions.fromJson(json["dimensions"])
            : Dimensions(width: 0, length: 0, height: 0),
        weightUnit: json["weight_unit"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "piece": piece,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "weight_unit": weightUnit,
      };
}

class Dimensions {
  dynamic width;
  dynamic length;
  dynamic height;

  Dimensions({
    required this.width,
    required this.length,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"] ?? "",
        length: json["length"] ?? "",
        height: json["height"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "length": length,
        "height": height,
      };
}

class FlightDuration {
  TransferClass flight;
  TransferClass? transfer;

  FlightDuration({
    required this.flight,
    this.transfer,
  });

  factory FlightDuration.fromJson(Map<String, dynamic> json) => FlightDuration(
        flight: json["flight"] is Map<String, dynamic>
            ? TransferClass.fromJson(json["flight"])
            : TransferClass(common: 0, hour: 0, minute: 0),
        transfer: json["transfer"] is Map<String, dynamic>
            ? TransferClass.fromJson(json["transfer"])
            : TransferClass(common: 0, hour: 0, minute: 0),
      );

  Map<String, dynamic> toJson() => {
        "flight": flight.toJson(),
        "transfer": transfer?.toJson(),
      };
}

class TransferClass {
  int common;
  int hour;
  int minute;

  TransferClass({
    required this.common,
    required this.hour,
    required this.minute,
  });

  factory TransferClass.fromJson(Map<String, dynamic> json) => TransferClass(
        common: json["common"] ?? 0,
        hour: json["hour"] ?? 0,
        minute: json["minute"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "hour": hour,
        "minute": minute,
      };
}

class Class {
  dynamic typeId;
  String name;
  String service;

  Class({
    required this.typeId,
    required this.name,
    required this.service,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        typeId: json["type_id"] ?? "",
        name: json["name"] ?? "",
        service: json["service"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "name": name,
        "service": service,
      };
}

class Upgrade {
  String id;
  dynamic key;
  bool isBaggage;
  bool isRefund;
  IncreasePrice increasePrice;

  Upgrade({
    required this.id,
    required this.key,
    required this.isBaggage,
    required this.isRefund,
    required this.increasePrice,
  });

  factory Upgrade.fromJson(Map<String, dynamic> json) => Upgrade(
        id: json["id"] ?? "",
        key: json["key"] ?? "",
        isBaggage: json["is_baggage"] ?? false,
        isRefund: json["is_refund"] ?? false,
        increasePrice: json["increase_price"] is Map<String, dynamic>
            ? IncreasePrice.fromJson(json["increase_price"])
            : IncreasePrice(rub: ""),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "is_baggage": isBaggage,
        "is_refund": isRefund,
        "increase_price": increasePrice.toJson(),
      };
}

class IncreasePrice {
  dynamic rub;

  IncreasePrice({
    required this.rub,
  });

  factory IncreasePrice.fromJson(Map<String, dynamic> json) => IncreasePrice(
        rub: json["RUB"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "RUB": rub,
      };
}

class Search {
  List<dynamic> inclusionCarriers;
  List<dynamic> exclusionCarriers;
  dynamic adt;
  String channel;
  int chd;
  String searchClass;
  int inf;
  String partner;
  List<SearchSegment> segments;
  int src;
  String token;
  String type;
  int yth;
  int ins;

  Search({
    required this.inclusionCarriers,
    required this.exclusionCarriers,
    required this.adt,
    required this.channel,
    required this.chd,
    required this.searchClass,
    required this.inf,
    required this.partner,
    required this.segments,
    required this.src,
    required this.token,
    required this.type,
    required this.yth,
    required this.ins,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        inclusionCarriers:
            List<dynamic>.from(json["inclusion_carriers"].map((x) => x) ?? []),
        exclusionCarriers:
            List<dynamic>.from(json["exclusion_carriers"].map((x) => x) ?? []),
        adt: json["adt"] ?? 0,
        channel: json["channel"] ?? "",
        chd: json["chd"] ?? 0,
        searchClass: json["class"] ?? "",
        inf: json["inf"] ?? 0,
        partner: json["partner"] ?? "",
        segments: json["segments"] != null
            ? List<SearchSegment>.from(
                json["segments"].map((x) => SearchSegment.fromJson(x)))
            : [],
        src: json["src"] ?? 0,
        token: json["token"] ?? "",
        type: json["type"] ?? "",
        yth: json["yth"] ?? 0,
        ins: json["ins"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "inclusion_carriers":
            List<dynamic>.from(inclusionCarriers.map((x) => x)),
        "exclusion_carriers":
            List<dynamic>.from(exclusionCarriers.map((x) => x)),
        "adt": adt,
        "channel": channel,
        "chd": chd,
        "class": searchClass,
        "inf": inf,
        "partner": partner,
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
        "src": src,
        "token": token,
        "type": type,
        "yth": yth,
        "ins": ins,
      };
}

class SearchSegment {
  From from;
  From to;
  String date;

  SearchSegment({
    required this.from,
    required this.to,
    required this.date,
  });

  factory SearchSegment.fromJson(Map<String, dynamic> json) => SearchSegment(
        from: json["from"] is Map<String, dynamic>
            ? From.fromJson(json["from"])
            : From(
                name: "",
                iata: "",
                country: Country(name: "", iata: ""),
                region: ""),
        to: json["to"] is Map<String, dynamic>
            ? From.fromJson(json["to"])
            : From(
                name: "",
                iata: "",
                country: Country(name: "", iata: ""),
                region: ""),
        date: json["date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
        "date": date,
      };
}

class From {
  String name;
  String iata;
  Country country;
  String region;

  From({
    required this.name,
    required this.iata,
    required this.country,
    required this.region,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        name: json["name"] ?? "",
        iata: json["iata"] ?? "",
        country: json["country"] is Map<String, dynamic>
            ? Country.fromJson(json["country"])
            : Country(name: "", iata: ""),
        region: json["region"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "iata": iata,
        "country": country.toJson(),
        "region": region,
      };
}

class Country {
  String name;
  String iata;

  Country({
    required this.name,
    required this.iata,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] ?? "",
        iata: json["iata"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "iata": iata,
      };
}

class SegmentsComments {
  String da39A3Ee5E6B4B0D3255Bfef95601890Afd80709;
  String the130A80C193E45Cc693F58Bfcfea79A3C28E79D6E;

  SegmentsComments({
    required this.da39A3Ee5E6B4B0D3255Bfef95601890Afd80709,
    required this.the130A80C193E45Cc693F58Bfcfea79A3C28E79D6E,
  });

  factory SegmentsComments.fromJson(Map<String, dynamic> json) =>
      SegmentsComments(
        da39A3Ee5E6B4B0D3255Bfef95601890Afd80709:
            json["da39a3ee5e6b4b0d3255bfef95601890afd80709"] ?? "",
        the130A80C193E45Cc693F58Bfcfea79A3C28E79D6E:
            json["130a80c193e45cc693f58bfcfea79a3c28e79d6e"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "da39a3ee5e6b4b0d3255bfef95601890afd80709":
            da39A3Ee5E6B4B0D3255Bfef95601890Afd80709,
        "130a80c193e45cc693f58bfcfea79a3c28e79d6e":
            the130A80C193E45Cc693F58Bfcfea79A3C28E79D6E,
      };
}
