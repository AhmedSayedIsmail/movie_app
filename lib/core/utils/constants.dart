class Constants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "d10f9728c172b35fba2f259716f2a763";
  static const nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const populerMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static movieDetailsPath({required int movieId}) => "$baseUrl/movie/$movieId?api_key=$apiKey";
// https://api.themoviedb.org/3/movie/980489/recommendations?api_key=d10f9728c172b35fba2f259716f2a763
  static movieRecommendationPath({required int movieId}) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  static const baseImageUrl = "https://image.tmdb.org/t/p";
  static String imageUrl({required String imagePath}) =>
      "$baseImageUrl/original$imagePath";
}
