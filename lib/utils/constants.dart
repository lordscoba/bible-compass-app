// const String url = "://localhost:8080";
// const String url = "s://bible-compass.onrender.com";
const String url = "s://bible-compass-backend-production.up.railway.app";
// https://bible-compass.onrender.com/api/v1/health
// https://bible-compass-backend-production.up.railway.app/api/v1/health

class EnvironmentUserConfig {
  // authentication
  static const String signUpUrl = "http$url/api/v1/signup";
  static const String loginUpUrl = "http$url/api/v1/login";

  // admin user
  static const String adminCreateUsersUrl = "http$url/api/v1/admin/createuser";
  static const String adminUpdateUsersUrl =
      "http$url/api/v1/admin/updateuser/"; //id
  static const String adminGetUsersUrl = "http$url/api/v1/admin/getusers";
  static const String adminGetUsersByIdUrl =
      "http$url/api/v1/admin/getuser/"; //id
  static const String adminGetUsersInfoUrl = "http$url/api/v1/admin/usersinfo";
  static const String adminDeleteUserByIdUrl =
      "http$url/api/v1/admin/deleteuser/"; //id
  static const String adminVerifyUserUrl = "http$url/api/v1/admin/verifyuser";

  // user profile
  static const String updateProfilByIdUrl =
      "http$url/api/v1/profile/"; //user id
  static const String getProfileByIdUrl =
      "http$url/api/v1/profiledetails/"; //user id
}

class EnvironmentCategoryConfig {
  // category
  static const String adminCreateCategoryUrl =
      "http$url/api/v1/admin/createcategory";
  static const String adminUpdateCategoryUrl =
      "http$url/api/v1/admin/updatecategory/"; //categoryId
  static const String adminDeleteCategoryUrl =
      "http$url/api/v1/admin/deletecategory/"; //categoryId
  static const String adminGetCategoriesUrl =
      "http$url/api/v1/admin/getcategory";
  static const String adminGetCategoryByIdUrl =
      "http$url/api/v1/admin/getcategoryid/"; //categoryId
  static const String adminGetCategoryInfoUrl =
      "http$url/api/v1/admin/categoryinfo";
}

class EnvironmentHealthConfig {
  //health
  static const String adminGetHealthUrl = "http$url/api/v1/health";
  static const String adminCreateHealthUrl = "http$url/api/v1/health";
}

class EnvironmentKeywordConfig {
  // keywords
  static const String adminCreateKeywordUrl =
      "http$url/api/v1/admin/createkeywords/"; //categoryId
  static const String adminUpdateKeywordUrl =
      "http$url/api/v1/admin/updatekeywords/"; //keywordId
  static const String adminDeleteKeywordUrl =
      "http$url/api/v1/admin/deletekeywords/"; //keywordId
  static const String adminGetKeywordsUrl =
      "http$url/api/v1/admin/getkeywords/"; //category Id
  static const String adminGetKeywordByIdUrl =
      "http$url/api/v1/admin/getkeywordsid/"; //keywordId
  static const String adminGetKeywordsInfoUrl =
      "http$url/api/v1/admin/keywordsinfo";
}

class EnvironmentSubConfig {
  //subscription
  static const String adminCreateSubscriptionUrl =
      "http$url/api/v1/admin/createsubscription/"; //user id
  static const String adminUpdateSubscriptionUrl =
      "http$url/api/v1/admin/updatesubscription/"; // subscription id
  static const String adminDeleteSubscriptionByIdUrl =
      "http$url/api/v1/admin/deletesubscription/"; // subscription id
  static const String adminGetSubscriptionsUrl =
      "http$url/api/v1/admin/getsubscription";
  static const String adminGetSubscriptionByIdUrl =
      "http$url/api/v1/admin/getsubscriptionid/"; // subscription id
  static const String adminGetSubscriptionInfoUrl =
      "http$url/api/v1/admin/subscriptioninfo";
  static const String adminGetUserSubscriptions =
      "http$url/api/v1/admin/getusersub/"; //userid
  static const String adminGetUserSubscriptionsStats =
      "http$url/api/v1/admin/getusersubstats/"; //userid

  //for paystack
  static const String paystackSubInit =
      "http$url/api/v1/user/initialize/"; //userid
  static const String paystackSubVerify =
      "http$url/api/v1/user/paystack/verify/"; //reference id
}

class EnvironmentVerseConfig {
  // verses
  static const String adminCreateVerseUrl =
      "http$url/api/v1/admin/createverse/"; //keyword id
  static const String adminUpdateVerseByIdUrl =
      "http$url/api/v1/admin/updateverse/"; //keyword id && Bible Verse Id
  static const String adminGetVersesUrl =
      "http$url/api/v1/admin/getverses/"; //keyword id
  static const String adminGetVerseByIdUrl =
      "http$url/api/v1/admin/getverse/"; //keyword id && Bible Verse Id
  static const String adminGetVerseInfoUrl =
      "http$url/api/v1/admin/verseinfo/"; //keyword id
  static const String adminDeleteVerseByIdUrl =
      "http$url/api/v1/admin/deleteverse/"; //keyword id && Bible Verse Id
  // ai bible
  static const String aiBible = "http$url/api/v1/aibible"; //query
}

class EnvironmentFavConfig {
  // verses
  static const String userLikeKeyword =
      "http$url/api/v1/like/"; //keyword && email
  static const String userUnlikeKeyword =
      "http$url/api/v1/unlike/"; //keyword && email
  static const String userGetFavStatus =
      "http$url/api/v1/favstatus/"; //keyword && email
  static const String userGetKeywords = "http$url/api/v1/getfavs/"; //email
}
