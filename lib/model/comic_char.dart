class ComicChar {
  int id;
  String name;
  String description;
  String thumbnailUrl;
  List<dynamic> comics;

  ComicChar(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnailUrl,
      required this.comics});

  static ComicChar fromMapToModel(Map<String, dynamic> maps){
    return ComicChar(
        id: maps['id'],
        name: maps['name'],
        description: maps['description'],
        thumbnailUrl: '${maps['thumbnail']['path']}/portrait_xlarge.${maps['thumbnail']['extension']}',
        comics: maps['comics']['items']);
  }
}
