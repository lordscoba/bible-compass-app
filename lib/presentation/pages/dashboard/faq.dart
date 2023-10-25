import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FaqPage extends ConsumerWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const Header(
        title: 'F.A.Q',
      ),
      drawer: const Draw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {
          context.go("/home");
        },
        child: const Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFFF6F8FF),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        height: double.infinity,
        width: double.infinity,
        child: const SizedBox(
          height: 1200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: FaqAccordion1(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FaqAccordion1 extends StatelessWidget {
  const FaqAccordion1({
    super.key,
  });

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.bold);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 16, fontWeight: FontWeight.normal);
  final _loremIpsum = ''' 
  With Bible Compass, you can search the categories and keywords for Related bible verses for your sermon topics, it also has other features like bookmarking your favorites keywords and online bible, which are made to ease your scripture navigation.
      ''';
  final _loremIpsum2 = ''' 
  - The home page consists the features like categories, favorites, Read Bible.
  - Scroll to each feature and choose by clicking the feature to enjoy the functional features of the app.
      ''';
  final _loremIpsum3 = ''' 
  - The Bible Compasss divides the bible topics into Categories, which are further divided into keywords and to their corresponding bible verses.
  - Click on the bible category and search for the keyword which you are looking for, which will now list the corresponding bible verses.
      ''';
  final _loremIpsum4 = ''' 
  - The favorites page is normally empty unless you have a favorite keyword already bookmarked.
  - You have to be logged in to use the favorite feature, if you are not click on the menu and click on the login button to login.
  - Go to the keyword page and select your favorite keyword for later use.
  - When you want to access the favorite keyword click on the favorites button on the menu side bar.
  - You will see your favorite keywords. you can now proceed to use.
      ''';
  final _loremIpsum5 = ''' 
  - At the Menu bar click the login button, Click on "Sign Up"
  - Fill in the required details, read and agree with out "Terms and condition"
  - Then Click create account
      ''';
  final _loremIpsum6 = ''' 
  - To upgrade to premium package you have to be logged in, if you are not logged in proceed to do so following the processes.
  - At the Menu side bar click on the Upgrade button.
  - Click on the cross button on the "want to add subscription" tab to continue.
  - click on "initialize" button.
  - Choose any payment channel of your choice.
  - proceed to make payment according to the payment channel you selected.
  - Click the "verify" button at the end of the subscription then proceed to enjoy the premium features offered by the app.
      ''';
  final _loremIpsum7 = ''' 
  - Simply repeat the process found in "How do I make payment for premium package"
      ''';
  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text('Brief App Description', style: _headerStyle),
          content: Text(_loremIpsum, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text('What If I don\'t have an account yet?',
              style: _headerStyle),
          content: Text(_loremIpsum5, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text('How do I access the features?', style: _headerStyle),
          content: Text(_loremIpsum2, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header:
              Text('How does The Category feature work?', style: _headerStyle),
          content: Text(_loremIpsum3, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text('How do I access the Favorites?', style: _headerStyle),
          content: Text(_loremIpsum4, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text('How do I make payment for premium package?',
              style: _headerStyle),
          content: Text(_loremIpsum6, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: const Color.fromARGB(255, 2, 40, 31),
          headerBackgroundColorOpened: const Color(0xFF0BA37F),
          header: Text(
              'If I am directed from the keyword section to the subscription section what do I do?',
              style: _headerStyle),
          content: Text(_loremIpsum7, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
      ],
    );
  }
}
