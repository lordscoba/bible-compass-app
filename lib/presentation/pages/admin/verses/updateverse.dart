import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateVerse extends ConsumerStatefulWidget {
  final String? vId;
  final String keyId;
  const UpdateVerse({required this.keyId, required this.vId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateVerseState();
}

class _UpdateVerseState extends ConsumerState<UpdateVerse> {
  late VerseModel verse;
  late VerseState versestate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    verse = VerseModel();
    versestate = const VerseState();
    // Initialize the variable in initState
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'true',
      'label': 'True',
    },
    {
      'value': 'false',
      'label': 'False',
    },
  ];

  void message() {
    final String message;
    final bool error;
    final sucessmessage = ref.watch(successMessageProvider);
    final errormessage = ref.watch(errorMessageProvider);
    if (errormessage.isEmpty) {
      message = sucessmessage;
      error = false;
    } else {
      message = errormessage;
      error = true;
    }
    var displaymessage = SnackBarClass();
    // ignore: use_build_context_synchronously
    displaymessage.snackBarMade(context, message, error);
  }

  @override
  Widget build(BuildContext context) {
    // final UserState checkState = ref.watch(loginProvider);

    ref.listen(verseProvider, (prev, next) {
      if (next.error.isNotEmpty) {
        ref.read(errorMessageProvider.notifier).state = next.error.toString();
        // debugPrint(next.error);
      }
      if (!next.data['message'].toString().contains("null")) {
        ref.read(successMessageProvider.notifier).state =
            next.data['message'].toString();
        // debugPrint(next.data['message'].toString());
      }
    });
    final dynamic vfuturesingle =
        Future.delayed(const Duration(seconds: 2), () {
      final vcalled = ref
          .read(verseProvider.notifier)
          .perfromGetSingleVerseRequest(widget.keyId, widget.vId!);
      return vcalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Verse'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<VerseState>(
            future: vfuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<VerseState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final checkState = snapshot.data;
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                debugPrint(fulldata.toString());
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputField(
                        controller: TextEditingController(
                          text: fulldata['bible_verse'].toString(),
                        ),
                        hintText: " Enter bible verse",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          verse = verse.copyWith(bibleVerse: value!);
                        },
                      ),
                      SelectField(
                        items: _items,
                        label: 'Like',
                        initialValue: fulldata['like'].toString(),
                        onSaved: (value) {
                          verse = verse.copyWith(
                              like: value?.toLowerCase() == 'true');
                        },
                      ),
                      TextArea(
                        controller: TextEditingController(
                          text: fulldata['passage'].toString(),
                        ),
                        maxLines: 3,
                        hintText: 'Enter passage',
                        onSaved: (value) {
                          verse = verse.copyWith(passage: value!);
                        },
                      ),
                      TextArea(
                        controller: TextEditingController(
                          text: fulldata['explanation'].toString(),
                        ),
                        maxLines: 2,
                        hintText: 'Enter Explanation',
                        onSaved: (value) {
                          verse = verse.copyWith(explanation: value!);
                        },
                      ),
                      ThemeButton(
                        text: checkState!.isLoading ? "loading..." : 'Update',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            await ref
                                .read(verseProvider.notifier)
                                .perfromUpdateVerseRequest(
                                    widget.keyId, verse.toJson(), widget.vId!);
                          }
                          // debugPrint(user.toJson().toString());

                          message();
                          if (ref.watch(errorMessageProvider) == "") {
                            Future.delayed(const Duration(seconds: 5), () {
                              // context.go('/admin/keywords');
                              Navigator.of(context).pop();
                            });
                          }
                          await ref
                              .read(verseProvider.notifier)
                              .perfromGetSingleVerseRequest(
                                  widget.keyId, widget.vId!);
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
