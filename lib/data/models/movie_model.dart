class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath
  });

  // Convert JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path']
    );
  }

  // Convert MovieModel into JSON
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

}