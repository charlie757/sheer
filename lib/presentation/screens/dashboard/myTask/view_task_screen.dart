import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            divider(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: getTranslated('taskFeed', context)!,
                      color: ColorHelper.pinkColor,
                      fontFamily: FontfamilyHelper.interBold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: CustomText(
                        title: 'You Need to Perform 5 Exercise Today ',
                        fontsize: 18,
                        fontFamily: FontfamilyHelper.interBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomText(
                        title:
                            'Bench press, Dumbble flyes, Cable crossover, Machine Fly, Wide Pushups, Bench press, Dumbble flyes, Cable crossover, Machine Fly, Wide Pushups.',
                        fontsize: 11,
                        color: ColorHelper.whiteColor.withOpacity(.9),
                        fontFamily: FontfamilyHelper.interRegular,
                      ),
                    ),
                    // uploadButtonWidget(),
                    uploadedPhotoWidget(),
                    participateWidget(),
                    taskDetailsWidget(),
                    Padding(padding:const EdgeInsets.only(top: 50),
                    child: CustomButton(title: getTranslated('taskCompleted', context)!),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

uploadButtonWidget(){
return Padding(
  padding: const EdgeInsets.only(top: 45,bottom: 20),
  child: Column(
    children: [
      uploadRow(title: getTranslated('uploadTaskPhoto', context)!, img: ImageHelper.uploadIcon),
      ScreenSize.height(29),
      uploadRow(title: getTranslated('uploadVideo', context)!, img: ImageHelper.uploadVideo)
    ],
  ),
);
}
  uploadRow({required String title, required String img}){
    return Row(
      children: [
        dot(),
        ScreenSize.width(8),
        CustomText(title: title,
        fontsize: 12,fontFamily: FontfamilyHelper.interSemiBold,
        ),
        ScreenSize.width(32),
        Image.asset(img,height: 24,)
      ],
    );
  }

  uploadedPhotoWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              dot(),
              ScreenSize.width(5),
              CustomText(
                title: getTranslated('uploadedPhotos', context)!,
                fontsize: 10,
                fontFamily: FontfamilyHelper.interSemiBold,
              )
            ],
          ),
          ScreenSize.height(10),
          Stack(
            children: [
              SizedBox(
                height: 168,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/dummy/gym.png',
                            height: 168.0,
                            width: double.infinity,
                            // isAnotherColorOfLodingIndicator: true,
                          )),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                      // enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      autoPlayCurve: Curves.ease,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 400),
                      autoPlayInterval: const Duration(seconds: 2),
                      onPageChanged: (val, _) {
                        currentIndex = val;
                        setState(() {});
                        // provider.updateSliderIndex(val);
                      }),
                ),
              ),
              Positioned(
                bottom: 0 + 15,
                left: MediaQuery.sizeOf(context).width * .4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return currentIndex == index
                          ? indicator(true)
                          : indicator(false);
                    })),
              )
            ],
          ),
        ],
      ),
    );
  }

  participateWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/dummy/Mask group.png',
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'assets/dummy/Mask group (2).png',
                  height: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/dummy/Mask group (1).png',
                  height: 22,
                ),
              )
            ],
          ),
          ScreenSize.width(6),
          CustomText(
            title: '25+ participants',
            fontsize: 13,
            fontFamily: FontfamilyHelper.interSemiBold,
          ),
        ],
      ),
    );
  }

  taskDetailsWidget(){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailsRow(title: getTranslated('taskCreatedDate', context)!, subTitle: '26/10/24'),
          ScreenSize.height(10),
          detailsRow(title: getTranslated('taskEndDate', context)!, subTitle: '28/10/24'),
          ScreenSize.height(10),
          detailsRow(title: getTranslated('createdBy', context)!, subTitle: 'Omar Abdallah'),
          ScreenSize.height(10),
          detailsRow(title: getTranslated('status', context)!, subTitle: 'Pending',subTitleColor: ColorHelper.pinkColor),
        ],
      ),
    );
  }

  detailsRow({required String title, required String subTitle, Color subTitleColor =ColorHelper.whiteColor}){
    return Row(
      children: [
        SizedBox(
          width: 105,
          child: CustomText(title: title,fontsize: 10,color: ColorHelper.whiteColor.withOpacity(.6),),
        ),
        CustomText(title: subTitle,fontsize: 10,color: subTitleColor,),
      ],
    );
  }

  Widget indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        height: 7.0,
        width: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? ColorHelper.pinkColor : ColorHelper.whiteColor,
        ),
      ),
    );
  }

  dot() {
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: ColorHelper.pinkColor),
    );
  }

  divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: ColorHelper.whiteColor,
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorHelper.appTheme,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      title: Row(
        children: [
          Image.asset(
            'assets/dummy/Mask group.png',
            height: 40,
          ),
          ScreenSize.width(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Jack Henry',
                fontsize: 17,
                fontFamily: FontfamilyHelper.interBold,
              ),
              CustomText(
                title: '15 min',
                fontsize: 10,
                fontFamily: FontfamilyHelper.interMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
