import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateVerses extends ConsumerStatefulWidget {
  final String keywId;
  const CreateVerses({required this.keywId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateVersesState();
}

class _CreateVersesState extends ConsumerState<CreateVerses> {
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
    final VerseState checkState = ref.watch(verseProvider);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Verse'),
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  hintText: " Enter Bible verse",
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
                TextArea(
                  maxLines: 3,
                  hintText: 'Enter passage',
                  onSaved: (value) {
                    verse = verse.copyWith(passage: value!);
                  },
                ),
                TextArea(
                  maxLines: 2,
                  hintText: 'Enter Explanation',
                  onSaved: (value) {
                    verse = verse.copyWith(explanation: value!);
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Create',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      await ref
                          .read(verseProvider.notifier)
                          .perfromCreateVerseRequest(
                              widget.keywId, verse.toJson());

                      debugPrint(verse.toJson().toString());
                      message();
                      if (ref.watch(errorMessageProvider) == "") {
                        Future.delayed(const Duration(seconds: 5), () {
                          // context.go('/admin/verses/${widget.keywId}');
                          Navigator.of(context).pop();
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
