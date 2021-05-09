import 'package:flutter_api/User.dart';

class Users {
    Users({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<User> data;
    Support support;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<User>.from(json["data"].map((user) => User.fromJson(user))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((user) => user.toJson())),
        "support": support.toJson(),
    };
}

class Support {
    Support({
        this.url,
        this.text,
    });

    String url;
    String text;

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
