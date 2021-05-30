// To parse this JSON data, do
//
//     final hospitals = hospitalsFromJson(jsonString);

import 'dart:convert';

List<Hospitals> hospitalsFromJson(String str) => List<Hospitals>.from(json.decode(str).map((x) => Hospitals.fromJson(x)));

String hospitalsToJson(List<Hospitals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospitals {
    Hospitals({
        this.srNo,
        this.tahsil,
        this.hospital,
        this.hospitalContactNo,
        this.administrativeOfficer,
        this.contactNo,
        this.icuBeds,
        this.wardBeds,
        this.totalRegisteredBeds,
        this.totalOccupancy,
        this.allotedBeds,
        this.vacantBeds,
        this.total,
    });

    String srNo;
    String tahsil;
    String hospital;
    String hospitalContactNo;
    String administrativeOfficer;
    String contactNo;
    String icuBeds;
    String wardBeds;
    String totalRegisteredBeds;
    String totalOccupancy;
    String allotedBeds;
    String vacantBeds;
    String total;

    factory Hospitals.fromJson(Map<String, dynamic> json) => Hospitals(
        srNo: json["Sr No"],
        tahsil: json["Tahsil"],
        hospital: json["Hospital"],
        hospitalContactNo: json["Hospital Contact No"],
        administrativeOfficer: json["Administrative Officer"],
        contactNo: json["Contact No"],
        icuBeds: json["ICU Beds"],
        wardBeds: json["Ward Beds"],
        totalRegisteredBeds: json["Total Registered Beds"],
        totalOccupancy: json["Total Occupancy"],
        allotedBeds: json["Alloted Beds"],
        vacantBeds: json["Vacant Beds"],
        total: json["Total"],
    );

    Map<String, dynamic> toJson() => {
        "Sr No": srNo,
        "Tahsil": tahsil,
        "Hospital": hospital,
        "Hospital Contact No": hospitalContactNo,
        "Administrative Officer": administrativeOfficer,
        "Contact No": contactNo,
        "ICU Beds": icuBeds,
        "Ward Beds": wardBeds,
        "Total Registered Beds": totalRegisteredBeds,
        "Total Occupancy": totalOccupancy,
        "Alloted Beds": allotedBeds,
        "Vacant Beds": vacantBeds,
        "Total": total,
    };
}
