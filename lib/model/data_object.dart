class DataObject {
  String? copyright;
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  DataObject(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

  DataObject.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'] ?? '';
    date = json['date'] ?? '';
    explanation = json['explanation'] ?? '';
    hdurl = json['hdurl'];
    mediaType = json['media_type'] ?? '';
    serviceVersion = json['service_version'] ?? '';
    title = json['title'] ?? '';
    url = json['url'] ?? '';
  }
}
