import 'dart:async';

import 'package:astro_app/src/business_layer/network/api_constants.dart';
import 'package:astro_app/src/business_layer/providers/home_provider.dart';
import 'package:astro_app/src/business_layer/util/helper/device_info_helper.dart';
import 'package:astro_app/src/business_layer/util/helper/util_helper.dart';
import 'package:astro_app/src/data_layer/models/astro_list_res_model.dart';
import 'package:astro_app/src/data_layer/models/blog_res_model.dart';
import 'package:astro_app/src/data_layer/res/app_colors.dart';
import 'package:astro_app/src/ui_layer/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider _homeProvider;
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchData();
      _changeBanner();
      _startTimer();
    });
  }

  /// call api for home page data
  void _fetchData() async {
    _homeProvider.loading = true;
    await _homeProvider.getBannerList();
    await _homeProvider.getAstroList();
    await _homeProvider.getBlogList();
    _homeProvider.loading = false;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: _appBar(),
      body: _homeProvider.loading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.orange,
            ))
          : _body(),
      bottomSheet: _bottomButton(),
    );
  }

  /// home page app bar widget
  _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: const Icon(
        Icons.menu,
        color: AppColors.blackColor,
        size: 28,
      ),
      title: const Text(
        "AstroFuse",
        style: TextStyle(color: AppColors.blackColor),
      ),
      actions: const [
        Icon(
          Icons.account_balance_wallet_outlined,
          color: AppColors.blackColor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.language,
          color: AppColors.blackColor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.support_agent,
          color: AppColors.blackColor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  /// body returns main content
  _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_homeProvider.bannerResModel.banner != null) _bannerCarousel(),
          _titleRow("Astrologers"),
          _astrologerListWidget(),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 5,
            width: DeviceInfo.width,
            color: Colors.black.withOpacity(0.1),
          ),
          const SizedBox(
            height: 8,
          ),
          _titleRow("Latest from blog"),
          _blogListWidget(),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  /// top banner carousel widget
  _bannerCarousel() {
    return _shadowCard(
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          height: 150,
          margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _homeProvider.bannerResModel.banner?.length ?? 0,
                  onPageChanged: (page) {
                    if (page ==
                        _homeProvider.bannerResModel.banner!.length - 1) {
                      Future.delayed(const Duration(seconds: 1), () {
                        _pageController.jumpToPage(0);
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          ApiConstants.imageBaseUrl +
                              _homeProvider
                                  .bannerResModel.banner![index].bannerImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _homeProvider.bannerResModel.banner!
                    .asMap()
                    .entries
                    .map((entry) {
                  final int index = entry.key;
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }

  /// common shadow card widget
  _shadowCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 4,
      child: Center(child: child),
    );
  }

  /// scroll banner to next page after 3 sec with 1 sec animation duration
  void _startTimer() {
    const sec = const Duration(seconds: 3);
    _timer = Timer.periodic(sec, (Timer timer) async {
      await _pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
    });
  }

  /// astrologers horizontal list view
  _astrologerListWidget() {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          ...List.generate(
              _homeProvider.astroListResModel.recordList?.length ?? 0,
              (index) => _astroCard(
                  _homeProvider.astroListResModel.recordList![index]))
        ],
      ),
    );
  }

  /// astrologers card design
  _astroCard(RecordList recordList) {
    return _shadowCard(
        child: Container(
      margin: const EdgeInsets.only(top: 15),
      width: 155,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: recordList.profileImage != null
                  ? Image.network(
                      "${ApiConstants.imageBaseUrl}${recordList.profileImage}",
                      height: 60,
                      width: 60,
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              recordList.name ?? "",
              style: const TextStyle(color: AppColors.blackColor),
            ),
          ),
          Text(
            "₹${recordList.charge}/min",
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          CommonBorderButton(
            label: "Connect",
          )
        ],
      ),
    ));
  }

  _titleRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColors.blackColor, fontSize: 21),
          ),
          const Text("View All")
        ],
      ),
    );
  }

  /// blog list view
  _blogListWidget() {
    return SizedBox(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          ...List.generate(_homeProvider.blogResModel.blog?.length ?? 0,
              (index) => _blogCard(_homeProvider.blogResModel.blog![index]))
        ],
      ),
    );
  }

  /// blog card design
  _blogCard(Blog blog) {
    return _shadowCard(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.network(
                  "${ApiConstants.imageBaseUrl}${blog.previewImage}",
                  height: 120,
                  width: 220,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      children: [
                        const Icon(Icons.remove_red_eye),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          blog.viewer.toString(),
                          style: const TextStyle(color: AppColors.blackColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            blog.title ?? "",
            style: const TextStyle(color: AppColors.blackColor),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                blog.author ?? "",
                style: const TextStyle(
                    color: AppColors.hintTextColor, fontSize: 12),
              ),
              const SizedBox(
                width: 100,
              ),
              Text(UtilHelper.instance.dateFormat(blog.postedOn!),
                  style: const TextStyle(
                      color: AppColors.hintTextColor, fontSize: 12))
            ],
          ),
        ),
      ],
    ));
  }

  /// bottom chat and call button
  _bottomButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: DeviceInfo.width / 2.2,
            child: CommonButton(
              icon: const Icon(
                Icons.chat,
                size: 15,
              ),
              label: "Chat with Astrologers",
            ),
          ),
          SizedBox(
            width: DeviceInfo.width / 2.2,
            child: CommonButton(
              icon: const Icon(
                Icons.call,
                size: 15,
              ),
              label: "Call with Astrologers",
            ),
          ),
        ],
      ),
    );
  }

  void _changeBanner() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }
}
