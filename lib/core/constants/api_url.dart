class ApiUrl {


  static const String baseURL = "http://192.168.8.100:5000/api/v1/";


  static const signup = '${baseURL}auth/signup';
  static const signin = '${baseURL}auth/signin';
   static const trendingMovies = '${baseURL}movie/trending';
   static const nowPlayingMovies = '${baseURL}movie/nowplaying';
  // static const popularTV = '${apiV}tv/popular';
  // static const movie = '${apiV}movie/';
  // static const tv = '${apiV}tv/';
  // static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}