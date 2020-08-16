import 'package:flutter/material.dart';

class OnBoardingInstructions {
  final String image, title, subtitle;

  OnBoardingInstructions(this.image, this.title, this.subtitle);
}

class MyColors {
  static const grey = Color(0xfff3f3f3),
      orange = Color(0xffffb755),
      red = Color(0xffed5568),
      lightGreen = Color(0xffdbf3e8),
      darkGreen = Color(0xff4ac18e),
      blue = Color(0xff40beee);
}

class TempleInfo {
  final String name,
      image,
      type,
      reviewCount,
      about,
      workingHours,
      bookingCount,
      wasbuild,
      certifications;
  final double reviews;

  TempleInfo({
    this.name,
    this.image,
    this.type,
    this.reviews,
    this.reviewCount,
    this.about,
    this.workingHours,
    this.bookingCount,
    this.wasbuild,
    this.certifications,
  });
}

List<TempleInfo> templeInfo = [
  TempleInfo(
    image:
    'assets/icons/mandir.png',
    about:
        "Bhinmal",
    certifications: "10",
    wasbuild: "15",
    name: "Hemant Ke Ghar Ka Mandir",
    bookingCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Main Mandir",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
  TempleInfo(
    image:
        "assets/icons/church.png",
    about:
        "Here We are from Aryan ke Ghar ka Mandir Badi Sadri",
    certifications: "10",
    wasbuild: "15",
    name: "Aryan Ke Ghar Ka Mandir",
    bookingCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Badi Sadri",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
  TempleInfo(
    image:
        "assets/icons/majjid.png",
    about:
        "Here we are from Ali Majjid",
    certifications: "10",
    wasbuild: "15",
    name: "Ali ke Ghar ka mandir",
    bookingCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Udaipur",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
];

List<OnBoardingInstructions> onBoardingInstructions = [
  OnBoardingInstructions(
    "assets/images/onboarding01.png",
    "Jai Shree Ram",
    "Ram MAndir",
  ),
  OnBoardingInstructions(
    "assets/images/onboarding02.png",
    "All is well",
    "jai shree ram",
  ),
];

List<Map<String, dynamic>> categories = [
  {
    'icon': 'assets/icons/mandir.png',
    'title': 'Bada sa mandir',
    'color': MyColors.orange,
  },
  {
    'icon': 'assets/icons/majjid.png',
    'title': 'Bada sa majjid',
    'color': MyColors.lightGreen,
  },
];

String avatar =
    "https://pbs.twimg.com/profile_images/1233356631188082689/qcmTohZh_400x400.jpg";
