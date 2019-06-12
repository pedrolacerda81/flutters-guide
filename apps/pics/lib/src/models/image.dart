class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  /* ImageModel.fromJson(Map<String, dynamic> parcedJson) {
    id = parcedJson['id'];
    url = parcedJson['url'];
    title = parcedJson['title'];
  } SE FOR USAR, USA ESSA! */

  ImageModel.fromJson(Map<String, dynamic> parcedJson)
      : id = parcedJson['id'],
        url = parcedJson['url'],
        title = parcedJson['title'];
}
