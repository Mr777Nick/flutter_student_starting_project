import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIStep2Page extends StatefulWidget {
  const DummyUIStep2Page({super.key});

  @override
  State<DummyUIStep2Page> createState() => _DummyUIStep2PageState();
}

class _DummyUIStep2PageState extends State<DummyUIStep2Page> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'ListView'),
    Tab(text: 'GridView'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        title: const Text(
          'Dummy UI',
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: UIHelper.padding(vertical: 10, horizontal: 15),
              child: NewsCard(
                  imgSrc: Constants.dummyImg,
                  title: 'How can I be Flutter Developer Expert 1?',
                  desc: 'Jill Lepore \u2022 23 May 2023'),
            ),
            itemCount: 10,
          ),
          Padding(
              padding: UIHelper.padding(horizontal: 15, vertical: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.4,
                children: List.generate(
                  9,
                  (index) => RowCard(imgSrc: Constants.dummyImg, title: 'Image'),
                ),
              ))
        ],
      ),
    );
  }
}
