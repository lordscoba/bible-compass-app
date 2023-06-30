import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateKeyword extends ConsumerStatefulWidget {
  final String keyId;
  const UpdateKeyword({required this.keyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateKeywordState();
}

class _UpdateKeywordState extends ConsumerState<UpdateKeyword> {
  late KeywordModel keyw;
  late KeywordState keywstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    keyw = KeywordModel();
    keywstate = const KeywordState();
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

    ref.listen(keywordProvider, (prev, next) {
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

    final dynamic keywfuturesingle =
        Future.delayed(const Duration(seconds: 2), () {
      final keywcalled = ref
          .read(keywordProvider.notifier)
          .perfromGetSingleKeywordRequest(widget.keyId);
      return keywcalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Keywords'),
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
          child: FutureBuilder<KeywordState>(
            future: keywfuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<KeywordState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final checkState = snapshot.data;
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                // debugPrint(fulldata.toString());
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputField(
                        controller: TextEditingController(
                          text: fulldata['keyword'].toString(),
                        ),
                        hintText: " Enter Keyword name",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          keyw = keyw.copyWith(keyword: value!);
                        },
                      ),
                      const HorizontalSpace(),
                      const Text(
                        "For Subscribers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const HorizontalSpace(),
                      SelectField(
                        items: _items,
                        label: 'For Subscribers',
                        initialValue: fulldata['for_subscribers'].toString(),
                        onSaved: (value) {
                          keyw = keyw.copyWith(
                              forSubscribers: value?.toLowerCase() == 'true');
                        },
                      ),
                      ThemeButton(
                        text: checkState!.isLoading ? "loading..." : 'Update',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            await ref
                                .read(keywordProvider.notifier)
                                .perfromUpdateKeywordRequest(
                                    keyw.toJson(), widget.keyId);
                            await ref
                                .refresh(keywordProvider.notifier)
                                .perfromGetSingleKeywordRequest(widget.keyId);
                            message();
                            if (ref.watch(errorMessageProvider) == "") {
                              Future.delayed(const Duration(seconds: 5), () {
                                // context.go('/admin/keywords');
                                Navigator.of(context).pop();
                              });
                            }
                          }
                          // debugPrint(user.toJson().toString());
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
