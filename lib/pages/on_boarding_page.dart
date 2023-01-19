import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:word_up/widget/w_image_onboarding.dart';
import 'package:word_up/widget/w_selectable_level.dart';
import 'package:word_up/widget/w_selectable_widget.dart';

import '../widget/w_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController();
  int selectedReason = -1;
  int selectedLevel = -1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (pageController.page == 0) return Future.value(true);
        pageController.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          toolbarHeight: 100,
        ),
        body: Column(children: [
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              _buildFirstPage(),
              _buildSecondPage(),
              _buildThirdPage(),
              _buildForthPage(),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  expansionFactor: 2),
              onDotClicked: (index) {},
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildFirstPage() {
    return WImageOnBoarding(
      image: 'assets/onboarding_1.png',
      question: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'English is my:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              WButton(
                title: 'Native Language',
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
              const SizedBox(height: 5),
              WButton(
                title: 'Secendory Language',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSecondPage() {
    return WImageOnBoarding(
      image: 'assets/onboarding_2.png',
      question: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'My Prefered accent is:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              WButton(
                title: 'American',
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
              const SizedBox(height: 5),
              WButton(
                title: 'Biritish',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildThirdPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Why do you want to learn English?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                mainAxisExtent: 130,
                crossAxisSpacing: 5,
              ),
              children: options
                  .map(
                    (e) => WSelectableItem(
                      model: e,
                      isSelected: selectedReason == options.indexOf(e),
                      onPressed: () {
                        setState(() {
                          selectedReason = options.indexOf(e);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        WButton(
          title: 'Continue',
          onPressed: selectedReason == -1
              ? null
              : () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
        )
      ],
    );
  }

  Widget _buildForthPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Select your level',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 50),
        _buildForthPageBody(),
        WButton(
          title: 'Take a 3min Test',
          onPressed: selectedReason == -1
              ? null
              : () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            text: 'I\'m not sure',
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              decorationThickness: 1,
              decorationStyle: TextDecorationStyle.solid,
              overflow: TextOverflow.ellipsis,
              height: 1.5,
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
              color: Colors.transparent,
              decorationColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildForthPageBody() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              width: 180,
              child: selectedLevel != -1
                  ? Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: min(170, selectedLevel * 60),
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(100),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    levels[selectedLevel].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(levels[selectedLevel].description),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 40,
                    height: 360,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 60,
                        child: WSelectableLevel(
                            isSelected: selectedLevel == index,
                            model: levels[index],
                            onPressed: () {
                              setState(() {
                                selectedLevel = index;
                              });
                            }),
                      );
                    },
                    itemCount: levels.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final levels = [
  LevelModel(
      name: 'Beginner',
      slug: 'A1',
      description:
          'Can understand and use familiar everyday expressions and very basic phrases aimed at the satisfaction of needs of a concrete type.'),
  LevelModel(
      name: 'Elementary',
      slug: 'A2',
      description:
          'Can understand sentences and frequently used expressions related to areas of most immediate relevance (e.g. very basic personal and family information, shopping, local geography, employment).'),
  LevelModel(
      name: 'Intermediate',
      slug: 'B1',
      description:
          'Can understand the main points of clear standard input on familiar matters regularly encountered in work, school, leisure, etc.'),
  LevelModel(
      name: 'Upper-Intermediate',
      slug: 'B2',
      description:
          'Can understand and use familiar everyday expressions and very basic phrases aimed at the satisfaction of needs of a concrete type.'),
  LevelModel(
      name: 'Advanced',
      slug: 'C1',
      description:
          'Can understand and use familiar everyday expressions and very basic phrases aimed at the satisfaction of needs of a concrete type.'),
  LevelModel(
      name: 'Proficiency',
      slug: 'C2',
      description:
          'Can understand and use familiar everyday expressions and very basic phrases aimed at the satisfaction of needs of a concrete type.')
];

final options = [
  SelectableModel(
    label: "Travel",
    image: 'assets/icons/travel.png',
  ),
  SelectableModel(
    label: "Job",
    image: 'assets/icons/job.png',
  ),
  SelectableModel(
    label: "Education",
    image: 'assets/icons/education.png',
  ),
  SelectableModel(
    label: "Communication",
    image: 'assets/icons/communication.png',
  ),
  SelectableModel(
    label: "Hobby",
    image: 'assets/icons/hobby.png',
  ),
  SelectableModel(
    label: "Others",
    image: 'assets/icons/others.png',
  ),
];
