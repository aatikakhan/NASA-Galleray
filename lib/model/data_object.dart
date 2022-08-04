
import 'package:json_annotation/json_annotation.dart';

part 'data_object.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class DataObject{
  factory DataObject.fromJson(Map<String, dynamic> json) => _$DataObjectFromJson(json);


  String? copyright;
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  DataObject(
      {this.copyright ,
      this.date,
      this.explanation,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

}

