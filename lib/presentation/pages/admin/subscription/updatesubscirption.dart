import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminUpdateSubscriprion extends ConsumerStatefulWidget {
  final String subId;
  const AdminUpdateSubscriprion(this.subId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateSubscriprionState();
}

class _UpdateSubscriprionState extends ConsumerState<AdminUpdateSubscriprion> {
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
    // final UserState checkState = ref.watch(loginProvider);
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

    final dynamic subsfuturesingle =
        Future.delayed(const Duration(seconds: 2), () {
      final subscalled = ref
          .read(subProvider.notifier)
          .perfromGetSingleSubRequest(widget.subId);
      return subscalled;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Subscription'),
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
          child: FutureBuilder<SubscriptionState>(
            future: subsfuturesingle,
            builder: (BuildContext context,
                AsyncSnapshot<SubscriptionState> snapshot) {
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
                        initialValue: fulldata['type'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['type'].toString(),
                        // ),
                        hintText: "Enter Sub Name",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          sub = sub.copyWith(type: value!);
                        },
                      ),
                      InputField(
                        initialValue: fulldata['amount'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['amount'].toString(),
                        // ),
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
                      const HorizontalSpace(),
                      const Text(
                        "Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const HorizontalSpace(),
                      SelectField(
                        items: _items,
                        label: 'Status',
                        initialValue: fulldata['status'].toString(),
                        onSaved: (value) {
                          sub = sub.copyWith(
                              status: value?.toLowerCase() == 'true');
                        },
                      ),
                      ThemeButton(
                        text: checkState!.isLoading ? "loading..." : 'Update',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            await ref
                                .read(subProvider.notifier)
                                .perfromUpdateSubRequest(
                                    sub.toJson(), widget.subId);
                            await ref
                                .refresh(subProvider.notifier)
                                .perfromGetSingleSubRequest(widget.subId);

                            // debugPrint(user.toJson().toString());

                            message();
                            if (ref.watch(errorMessageProvider) == "") {
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context).pop();
                              });
                            }
                          }
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
