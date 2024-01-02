import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bible_compass_app/data/remote/aibible.dart';
import 'package:bible_compass_app/domain/providers/bibleprovider.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BibleApi extends ConsumerStatefulWidget {
  const BibleApi({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleApiState();
}

class _BibleApiState extends ConsumerState<BibleApi> {
  @override
  Widget build(BuildContext context) {
    final passage = ref.watch(passageprovider);
    String tim2;
    if (passage == "") {
      tim2 = "";
    } else {
      tim2 = "?passage=$passage";
    }
    final bibleapi = ref.watch(bibleApiProvider(tim2));
    // debugPrint(bibleapi.toString());
    return Scaffold(
      appBar: const Header(
        title: 'Bible',
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
        child: SizedBox(
          height: 1200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BibleAccordion(),
                const CallBibleApi(),
                const SizedBox(
                  height: 15,
                ),
                bibleapi.when(
                  data: (bible) {
                    // debugPrint(user['data'].toString());
                    // debugPrint(bibleapi.asData?.value['message'].toString());

                    // dynamic book = bible['data']?['book'] ?? [];
                    dynamic book = bible['data']?['verses'] ?? [];
                    // debugPrint(bible['data']?['verses'].toString());

                    return book == null || book.isEmpty
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                                "Invalid Format or Bible reference, Cross check your input to make sure it exists or matches with the given format above"),
                          ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                // "Book: ${bible['data']?['book_name'].toString()}",
                                "Book: ${bible['data']?['ref'][0].toString()}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: book.map<Widget>((dynamic item) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(
                                            0xFF0BA37F), // Set the color of the border
                                        width:
                                            2.0, // Set the width of the border
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Chapter: ${item['chapter'].toString()}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Verse: ${item['verse'].toString()}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(item["text"].toString()),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          );
                    // Render the data when available
                  },
                  loading: () => const Center(
                    child: CupertinoActivityIndicator(
                      radius: 50,
                    ),
                  ),
                  error: (error, stackTrace) =>
                      Text('Error: ${error.toString()}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CallBibleApi extends ConsumerWidget {
  const CallBibleApi({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? passage;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF0BA37F)), // Set the desired outline color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 3, 46,
                        36)), // Set the desired outline color when focused
              ),
              contentPadding: EdgeInsets.all(
                8,
              ),
            ),
            onChanged: (value) {
              passage = value.trim();
            },
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF0BA37F)),
          ),
          onPressed: () {
            // debugPrint(passage);
            ref.read(passageprovider.notifier).state = passage!;
            final tim = ref.watch(passageprovider);
            final tim2 = "?passage=$tim";
            // debugPrint(tim2);
            ref.read(bibleApiProvider(tim2));
          },
          child: const Text("Find"),
        ),
      ],
    );
  }
}

class BibleAccordion extends StatelessWidget {
  const BibleAccordion({
    super.key,
  });

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.bold);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 16, fontWeight: FontWeight.normal);
  final _loremIpsum = ''' 
  This bible works by the user inputing the correct bible passage they are searching for by following the correct input format.

  The following formats are allowed:
    - 1kings1:2-5
    - 2kings1:2
    - jn3:18
    - john3:19
    - jn3:16
    - john3:16
    - john3:16-17
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
          header: Text('Introduction', style: _headerStyle),
          content: Text(_loremIpsum, style: _contentStyle),
          contentHorizontalPadding: 20,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
      ],
    );
  }
}
