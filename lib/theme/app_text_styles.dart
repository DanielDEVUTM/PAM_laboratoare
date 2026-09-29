import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts {
  AppFonts._();

  static const String googleSans = 'GoogleSans';
  static const String montserrat = 'MontserratAlternates';
}

/// Stilurile de text pentru ecranul Home (font: Google Sans).
class HomeTextStyles {
  HomeTextStyles._();

  static const TextStyle logo = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle category = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 9.5,
    fontWeight: FontWeight.w400,
    color: AppColors.categoryInactive,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle showAll = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.showAll,
  );

  static const TextStyle productName = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle productPrice = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle collectionSubtitle = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 12.5,
    fontWeight: FontWeight.w300,
    color: AppColors.collectionSubtitle,
  );

  static const TextStyle collectionTitleLight = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    height: 1.25,
    color: AppColors.collectionTitle,
  );

  static const TextStyle collectionTitleBold = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.67,
    color: AppColors.collectionTitle,
  );

  static const TextStyle collectionLabel = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 12.5,
    fontWeight: FontWeight.w400,
    color: AppColors.collectionLabel,
  );

  static const TextStyle collectionName = TextStyle(
    fontFamily: AppFonts.googleSans,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.33,
    color: AppColors.textPrimary,
  );
}

/// Stilurile de text pentru ecranul Product (font: Montserrat Alternates).
class ProductTextStyles {
  ProductTextStyles._();

  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 17.5,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle price = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 23.5,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle ratingCount = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.ratingCount,
  );

  static const TextStyle label = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.label,
  );

  static const TextStyle size = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.sizeInactiveText,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 15.5,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.67,
    color: AppColors.textPrimary,
  );

  static const TextStyle readMore = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.67,
    color: AppColors.green,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.green,
  );

  static const TextStyle ratingBig = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 34,
    fontWeight: FontWeight.w500,
    height: 1,
    color: Color(0xFF231F20),
  );

  static const TextStyle outOf = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 10.5,
    fontWeight: FontWeight.w400,
    color: AppColors.ratingOutOf,
  );

  static const TextStyle small = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 10.5,
    fontWeight: FontWeight.w400,
    color: AppColors.reviewsGray,
  );

  static const TextStyle percent = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 10.5,
    fontWeight: FontWeight.w400,
    color: AppColors.percent,
  );

  static const TextStyle writeReview = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: AppColors.reviewsGray,
  );

  static const TextStyle reviewerName = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle reviewTime = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 9.5,
    fontWeight: FontWeight.w400,
    color: AppColors.reviewTime,
  );

  static const TextStyle reviewText = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 10.5,
    fontWeight: FontWeight.w400,
    height: 1.62,
    color: AppColors.reviewText,
  );

  static const TextStyle cardName = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 11.5,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardPrice = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 14.5,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle addToCart = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 15.5,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
