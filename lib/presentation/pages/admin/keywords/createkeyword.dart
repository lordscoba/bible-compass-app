import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Createkeyword extends ConsumerStatefulWidget {
  final String catId;
  const Createkeyword({required this.catId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatekeywordState();
}

class _CreatekeywordState extends ConsumerState<Createkeyword> {
  late KeywordModel keyword;
  late KeywordState keywordstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    keyword = KeywordModel();
    keywordstate = const KeywordState();
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

  final List<Map<String, dynamic>> _itemsF = [
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
    final KeywordState checkState = ref.watch(keywordProvider);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Keywords'),
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
                  hintText: "Enter keyword",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    keyword = keyword.copyWith(keyword: value!);
                  },
                ),
                SelectField(
                  items: _items,
                  label: 'For Subscribers',
                  initialValue: 'false',
                  onSaved: (value) {
                    keyword = keyword.copyWith(
                        forSubscribers: value?.toLowerCase() == 'true');
                  },
                ),
                SelectField(
                  items: _itemsF,
                  label: 'Favourite',
                  initialValue: 'false',
                  onSaved: (value) {
                    keyword = keyword.copyWith(
                        favorite: value?.toLowerCase() == 'true');
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Create',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      await ref
                          .read(keywordProvider.notifier)
                          .perfromCreateKeywordRequest(
                              keyword.toJson(), widget.catId);
                    }
                    // debugPrint(user.toJson().toString());
                    message();
                    if (ref.watch(errorMessageProvider) == "") {
                      Future.delayed(const Duration(seconds: 5), () {
                        context.go('/admin/keywords/${widget.catId}');
                      });
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
