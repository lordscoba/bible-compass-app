class EnvironmentUserConfig {
  // authentication
  static const String signUpUrl = "http://localhost:3000/api/v1/signup";
  static const String loginUpUrl = "http://localhost:3000/api/v1/login";

  // admin user
  static const String adminCreateUsersUrl =
      "http://localhost:3000/api/v1/admin/createuser";
  static const String adminUpdateUsersUrl =
      "http://localhost:3000/api/v1/admin/updateuser/"; //id
  static const String adminGetUsersUrl =
      "http://localhost:3000/api/v1/admin/getusers";
  static const String adminGetUsersByIdUrl =
      "http://localhost:3000/api/v1/admin/getuser/"; //id
  static const String adminGetUsersInfoUrl =
      "http://localhost:3000/api/v1/admin/usersinfo";
  static const String adminDeleteUserByIdUrl =
      "http://localhost:3000/api/v1/admin/deleteuser/"; //id
  static const String adminVerifyUserUrl =
      "http://localhost:3000/api/v1/admin/verifyuser";

  // user profile
  static const String getProfilByIdUrl =
      "http://localhost:3000/api/v1/profile/"; //user id
  static const String updateProfileByIdUrl =
      "http://localhost:3000/api/v1/profiledetails/"; //user id
}

class EnvironmentCategoryConfig {
  // category
  static const String adminCreateCategoryUrl =
      "http://localhost:3000/api/v1/admin/createcategory";
  static const String adminUpdateCategoryUrl =
      "http://localhost:3000/api/v1/admin/updatecategory/"; //categoryId
  static const String adminDeleteCategoryUrl =
      "http://localhost:3000/api/v1/admin/deletecategory/"; //categoryId
  static const String adminGetCategoriesUrl =
      "http://localhost:3000/api/v1/admin/getcategory";
  static const String adminGetCategoryByIdUrl =
      "http://localhost:3000/api/v1/admin/getcategoryid/"; //categoryId
  static const String adminGetCategoryInfoUrl =
      "http://localhost:3000/api/v1/admin/categoryinfo";
}

class EnvironmentHealthConfig {
  //health
  static const String adminGetHealthUrl = "http://localhost:3000/api/v1/health";
  static const String adminCreateHealthUrl =
      "http://localhost:3000/api/v1/health";
}

class EnvironmentKeywordConfig {
  // keywords
  static const String adminCreateKeywordUrl =
      "http://localhost:3000/api/v1/admin/createkeywords/"; //categoryId
  static const String adminUpdateKeywordUrl =
      "http://localhost:3000/api/v1/admin/updatekeywords/"; //keywordId
  static const String adminDeleteKeywordUrl =
      "http://localhost:3000/api/v1/admin/deletekeywords/"; //keywordId
  static const String adminGetKeywordsUrl =
      "http://localhost:3000/api/v1/admin/getkeywords/"; //category Id
  static const String adminGetKeywordByIdUrl =
      "http://localhost:3000/api/v1/admin/getkeywordsid/"; //keywordId
  static const String adminGetKeywordsInfoUrl =
      "http://localhost:3000/api/v1/admin/keywordsinfo";
}

class EnvironmentSubConfig {
  //subscription
  static const String adminCreateSubscriptionUrl =
      "http://localhost:3000/api/v1/admin/createsubscription/"; //user id
  static const String adminUpdateSubscriptionUrl =
      "http://localhost:3000/api/v1/admin/updatesubscription/"; // subscription id
  static const String adminDeleteSubscriptionByIdUrl =
      "http://localhost:3000/api/v1/admin/deletesubscription/"; // subscription id
  static const String adminGetSubscriptionsUrl =
      "http://localhost:3000/api/v1/admin/getsubscription";
  static const String adminGetSubscriptionByIdUrl =
      "http://localhost:3000/api/v1/admin/getsubscriptionid/"; // subscription id
  static const String adminGetSubscriptionInfoUrl =
      "http://localhost:3000/api/v1/admin/subscriptioninfo";
}

class EnvironmentVerseConfig {
  // verses
  static const String adminCreateVerseUrl =
      "http://localhost:3000/api/v1/admin/createverse/"; //keyword id
  static const String adminUpdateVerseByIdUrl =
      "http://localhost:3000/api/v1/admin/updateverse/"; //keyword id && Bible Verse Id
  static const String adminGetVersesUrl =
      "http://localhost:3000/api/v1/admin/getverses/"; //keyword id
  static const String adminGetVerseByIdUrl =
      "http://localhost:3000/api/v1/admin/getverse/"; //keyword id && Bible Verse Id
  static const String adminGetVerseInfoUrl =
      "http://localhost:3000/api/v1/admin/verseinfo/"; //keyword id
  static const String adminDeleteVerseByIdUrl =
      "http://localhost:3000/api/v1/admin/deleteverse/"; //keyword id && Bible Verse Id
}
