// To parse this JSON data, do
//
//     final thali = thaliFromJson(jsonString);

import 'dart:convert';

List<Thali> thaliFromJson(String str) => List<Thali>.from(json.decode(str).map((x) => Thali.fromJson(x)));

String thaliToJson(List<Thali> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Thali {
    Thali({
        this.sno,
        this.districtName,
        this.eateryName,
        this.address,
        this.existingPlatesLimit,
    });

    String sno;
    String districtName;
    String eateryName;
    String address;
    String existingPlatesLimit;

    factory Thali.fromJson(Map<String, dynamic> json) => Thali(
        sno: json["SNO"],
        districtName: json["District Name"],
        eateryName: json["Eatery Name"] == null ? null : json["Eatery Name"],
        address: json["Address"] == null ? null : json["Address"],
        existingPlatesLimit: json["Existing Plates Limit"] == null ? null : json["Existing Plates Limit"],
    );

    Map<String, dynamic> toJson() => {
        "SNO": sno,
        "District Name": districtName,
        "Eatery Name": eateryName == null ? null : eateryName,
        "Address": address == null ? null : address,
        "Existing Plates Limit": existingPlatesLimit == null ? null : existingPlatesLimit,
    };
}
