class AstroListResModel {
  List<RecordList>? recordList;
  int? status;
  int? totalCount;

  AstroListResModel({this.recordList, this.status, this.totalCount});

  AstroListResModel.fromJson(Map<String, dynamic> json) {
    if (json['recordList'] != null) {
      recordList = <RecordList>[];
      json['recordList'].forEach((v) {
        recordList!.add(new RecordList.fromJson(v));
      });
    }
    status = json['status'];
    totalCount = json['totalCount'];
  }
}

class RecordList {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? contactNo;
  String? gender;
  String? birthDate;
  String? primarySkill;
  String? allSkill;
  String? languageKnown;
  String? profileImage;
  int? charge;
  int? experienceInYears;
  int? dailyContribution;
  String? hearAboutAstroguru;
  int? isWorkingOnAnotherPlatform;
  String? whyOnBoard;
  String? interviewSuitableTime;
  String? currentCity;
  String? mainSourceOfBusiness;
  String? highestQualification;
  String? degree;
  String? college;
  String? learnAstrology;
  String? astrologerCategoryId;
  String? instaProfileLink;
  String? facebookProfileLink;
  String? linkedInProfileLink;
  String? youtubeChannelLink;
  String? websiteProfileLink;
  int? isAnyBodyRefer;
  int? minimumEarning;
  int? maximumEarning;
  String? loginBio;
  String? noofforeignCountriesTravel;
  String? currentlyworkingfulltimejob;
  String? goodQuality;
  String? biggestChallenge;
  String? whatwillDo;
  int? isVerified;
  int? totalOrder;
  String? country;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? modifiedBy;
  String? nameofplateform;
  String? monthlyEarning;
  String? referedPerson;
  String? chatStatus;
  String? chatWaitTime;
  String? callStatus;
  String? callWaitTime;
  int? videoCallRate;
  int? reportRate;
  String? astrologerCategory;
  bool? isFreeAvailable;
  double? rating;

  RecordList(
      {this.id,
      this.userId,
      this.name,
      this.email,
      this.contactNo,
      this.gender,
      this.birthDate,
      this.primarySkill,
      this.allSkill,
      this.languageKnown,
      this.profileImage,
      this.charge,
      this.experienceInYears,
      this.dailyContribution,
      this.hearAboutAstroguru,
      this.isWorkingOnAnotherPlatform,
      this.whyOnBoard,
      this.interviewSuitableTime,
      this.currentCity,
      this.mainSourceOfBusiness,
      this.highestQualification,
      this.degree,
      this.college,
      this.learnAstrology,
      this.astrologerCategoryId,
      this.instaProfileLink,
      this.facebookProfileLink,
      this.linkedInProfileLink,
      this.youtubeChannelLink,
      this.websiteProfileLink,
      this.isAnyBodyRefer,
      this.minimumEarning,
      this.maximumEarning,
      this.loginBio,
      this.noofforeignCountriesTravel,
      this.currentlyworkingfulltimejob,
      this.goodQuality,
      this.biggestChallenge,
      this.whatwillDo,
      this.isVerified,
      this.totalOrder,
      this.country,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.modifiedBy,
      this.nameofplateform,
      this.monthlyEarning,
      this.referedPerson,
      this.chatStatus,
      this.chatWaitTime,
      this.callStatus,
      this.callWaitTime,
      this.videoCallRate,
      this.reportRate,
      this.astrologerCategory,
      this.isFreeAvailable,
      this.rating});

  RecordList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    contactNo = json['contactNo'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    primarySkill = json['primarySkill'];
    allSkill = json['allSkill'];
    languageKnown = json['languageKnown'];
    profileImage = json['profileImage'];
    charge = json['charge'];
    experienceInYears = json['experienceInYears'];
    dailyContribution = json['dailyContribution'];
    hearAboutAstroguru = json['hearAboutAstroguru'];
    isWorkingOnAnotherPlatform = json['isWorkingOnAnotherPlatform'];
    whyOnBoard = json['whyOnBoard'];
    interviewSuitableTime = json['interviewSuitableTime'];
    currentCity = json['currentCity'];
    mainSourceOfBusiness = json['mainSourceOfBusiness'];
    highestQualification = json['highestQualification'];
    degree = json['degree'];
    college = json['college'];
    learnAstrology = json['learnAstrology'];
    astrologerCategoryId = json['astrologerCategoryId'];
    instaProfileLink = json['instaProfileLink'];
    facebookProfileLink = json['facebookProfileLink'];
    linkedInProfileLink = json['linkedInProfileLink'];
    youtubeChannelLink = json['youtubeChannelLink'];
    websiteProfileLink = json['websiteProfileLink'];
    isAnyBodyRefer = json['isAnyBodyRefer'];
    minimumEarning = json['minimumEarning'];
    maximumEarning = json['maximumEarning'];
    loginBio = json['loginBio'];
    noofforeignCountriesTravel = json['NoofforeignCountriesTravel'];
    currentlyworkingfulltimejob = json['currentlyworkingfulltimejob'];
    goodQuality = json['goodQuality'];
    biggestChallenge = json['biggestChallenge'];
    whatwillDo = json['whatwillDo'];
    isVerified = json['isVerified'];
    totalOrder = json['totalOrder'];
    country = json['country'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    nameofplateform = json['nameofplateform'];
    monthlyEarning = json['monthlyEarning'];
    referedPerson = json['referedPerson'];
    chatStatus = json['chatStatus'];
    chatWaitTime = json['chatWaitTime'];
    callStatus = json['callStatus'];
    callWaitTime = json['callWaitTime'];
    videoCallRate = json['videoCallRate'];
    reportRate = json['reportRate'];
    astrologerCategory = json['astrologerCategory'];
    isFreeAvailable = json['isFreeAvailable'];
    rating = json['rating'] != null ? json['rating'].toDouble() : 0.0;
  }
}
