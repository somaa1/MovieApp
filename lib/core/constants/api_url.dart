class ApiUrl {
  static const String baseURL = "http://192.168.8.100:5000/api/v1/";

  static const signup = '${baseURL}auth/signup';
  static const signin = '${baseURL}auth/signin';
  static const trendingMovies = '${baseURL}movie/trending';
  static const nowPlayingMovies = '${baseURL}movie/nowplaying';
  static const popularTV = '${baseURL}tv/popular';
  static const movie = '${baseURL}movie/';

   static const tv = '${baseURL}tv/';
  // static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
