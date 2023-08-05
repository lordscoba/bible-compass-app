import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/verifysub.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateSub extends ConsumerStatefulWidget {
  const CreateSub({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateSubState();
}

class _CreateSubState extends ConsumerState<CreateSub> {
  late PaystackModel sub;
  late SubscriptionState substate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    sub = PaystackModel();
    substate = const SubscriptionState();
    // Initialize the variable in initState
  }

  void message() {
    final String message;
    final bool error;
    final sucessmessage = ref.watch(successSubMessageProvider);
    final errormessage = ref.watch(errorSubMessageProvider);
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

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final SubscriptionState checkState = ref.watch(subProvider);

    ref.listen(subProvider, (prev, next) {
      if (next.error.isNotEmpty) {
        ref.read(errorSubMessageProvider.notifier).state =
            next.error.toString();
        // debugPrint(next.error);
      }
      if (!next.data['message'].toString().contains("null")) {
        ref.read(successSubMessageProvider.notifier).state =
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
                const SizedBox(height: 200, child: CompassTop()),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "You are about to make a Payment of \$2 for your Upgrade, Click Initialize to continue",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                InputField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: authData['email'],
                  ),
                  hintText: "Enter Email",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    if (!validateEmail(value.trim())) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    sub = sub.copyWith(email: authData['email']);
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Initialize',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // debugPrint(sub.toJson().toString());
                      await ref
                          .read(paystackProvider.notifier)
                          .perfromPayStackInitRequest(
                              sub.toJson(), authData['id']);

                      // debugPrint(sub.toJson().toString());
                      // debugPrint(authData['id']);

                      // debugPrint(user.toJson().toString());
                      message();
                      if (ref.watch(errorSubMessageProvider) == "") {
                        Future.delayed(const Duration(seconds: 4), () async {
                          // Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return VerifySub(
                                authData['id'],
                              );
                            },
                          );
                          final SubscriptionState paystack =
                              ref.watch(paystackProvider);
                          var paystackData = paystack.data['data'];
                          final Uri url = Uri.parse(
                              paystackData['data']["authorization_url"]);
                          _launchUrl(url);
                        });
                      }
                      await ref
                          .refresh(subProvider.notifier)
                          .perfromGetUserSubsRequests(authData['id']);
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
