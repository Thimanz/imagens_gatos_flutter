class ImageModel {
  late String url;
  late String alt;

  ImageModel(this.url, this.alt);

  ImageModel.fromJSON(Map<String, dynamic> decodedJSON) {
    url = decodedJSON['url'];
  }

  @override
  String toString() {
    return 'url: $url';
  }
}
