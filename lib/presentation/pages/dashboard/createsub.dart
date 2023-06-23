import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateSub extends ConsumerStatefulWidget {
  const CreateSub({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateSubState();
}

class _CreateSubState extends ConsumerState<CreateSub> {
  late SubscriptionModel sub;
  late SubscriptionState substate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    sub = SubscriptionModel();
    substate = const SubscriptionState();
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
    final SubscriptionState checkState = ref.watch(subProvider);

    ref.listen(subProvider, (prev, next) {
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

    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activate Subcription'),
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
                  hintText: "Enter Sub Name",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    sub = sub.copyWith(type: value!);
                    sub = sub.copyWith(username: authData['username']);
                    sub = sub.copyWith(userId: authData['id']);
                  },
                ),
                InputField(
                  hintText: "Enter Amount",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    sub = sub.copyWith(amount: double.parse(value!));
                  },
                ),
                SelectField(
                  items: _items,
                  label: 'Status',
                  initialValue: 'false',
                  onSaved: (value) {
                    sub = sub.copyWith(status: value?.toLowerCase() == 'true');
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Create',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      debugPrint(sub.toJson().toString());
                      await ref
                          .read(subProvider.notifier)
                          .perfromCreateSubRequest(
                              sub.toJson(), authData['id']);
                      await ref
                          .refresh(subProvider.notifier)
                          .perfromGetUserSubsRequests(authData['id']);
                    }
                    // debugPrint(user.toJson().toString());
                    message();
                    if (ref.watch(errorMessageProvider) == "") {
                      Future.delayed(const Duration(seconds: 5), () {
                        // context.go('/admin/category');
                        Navigator.of(context).pop();
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
