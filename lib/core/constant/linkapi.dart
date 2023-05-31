class AppLink {

  static const String linkServerName = "http://10.0.2.2/ikrilli";
  static const String linkSignUp = "$linkServerName/auth/signup.php";
  static const String linkLogin = "$linkServerName/auth/login.php";
  //static const String home="http://localhost:3000/home.php";
  static const String home= "$linkServerName/home.php";
  //static const String home= "localhost/ikrilli/home.php";
  //static const String home= "http://localhost/ikrilli/home.php";
  static const String imagesstatic= "$linkServerName/upload";
  static const String imagesCategories="$imagesstatic/categories";
  static const String imagesItems="$imagesstatic/items";
  static const String items = "$linkServerName/items/items.php"  ;
  static const String searchitems = "$linkServerName/items/search.php"  ;

}