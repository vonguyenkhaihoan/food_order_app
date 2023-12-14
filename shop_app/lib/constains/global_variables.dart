import 'package:flutter/material.dart';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://nvhphunu.vn/wp-content/uploads/2023/10/Com-Tam-Suon-Bi-Cha-Huong-Dan-Cach-Lam-Tuyet-Ngon-Bat-Vi.jpeg',
    'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
    'https://cdn.nhathuoclongchau.com.vn/unsafe/https://cms-prod.s3-sgn09.fptcloud.com/cach_lam_banh_pizza_thom_ngon_chuan_nha_hang_u_B_Cu_H_1680490692_2481182f2e.png',
    'https://cdn.tgdd.vn/Files/2022/01/25/1412805/cach-nau-pho-bo-nam-dinh-chuan-vi-thom-ngon-nhu-hang-quan-202201250230038502.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  // static const List<Map<String, String>> categoryImages = [
  //   {
  //     'title': 'Mobiles',
  //     'image': 'assets/images/mobiles.jpeg',
  //   },
  //   {
  //     'title': 'Essentials',
  //     'image': 'assets/images/essentials.jpeg',
  //   },
  //   {
  //     'title': 'Appliances',
  //     'image': 'assets/images/appliances.jpeg',
  //   },
  //   {
  //     'title': 'Books',
  //     'image': 'assets/images/books.jpeg',
  //   },
  //   {
  //     'title': 'Fashion',
  //     'image': 'assets/images/fashion.jpeg',
  //   },
  //   {
  //     'title': 'test',
  //     'image': 'assets/images/fashion.jpeg',
  //   },
  //   {
  //     'title': 'test1',
  //     'image': 'assets/images/fashion.jpeg',
  //   },
  //   {
  //     'title': 'test2',
  //     'image': 'assets/images/fashion.jpeg',
  //   },
  // ];
}
