import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateCategory extends ConsumerStatefulWidget {
  final String catId;
  const UpdateCategory({required this.catId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends ConsumerState<UpdateCategory> {
  late CategoryModel cat;
  late CategoryState catstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cat = CategoryModel();
    catstate = const CategoryState();
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

    ref.listen(categoryProvider, (prev, next) {
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

    final dynamic catsfuturesingle =
        Future.delayed(const Duration(seconds: 2), () {
      final catscalled = ref
          .read(categoryProvider.notifier)
          .perfromGetSingleCategoryRequest(widget.catId);
      return catscalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Category'),
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
          child: FutureBuilder<CategoryState>(
            future: catsfuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<CategoryState> snapshot) {
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
                        initialValue: fulldata['category_name'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['category_name'].toString(),
                        // ),
                        hintText: " Enter category name",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cat = cat.copyWith(categoryName: value!);
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
                          cat = cat.copyWith(
                              forSubscribers: value?.toLowerCase() == 'true');
                        },
                      ),
                      ThemeButton(
                        text: checkState!.isLoading ? "loading..." : 'Update',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            await ref
                                .read(categoryProvider.notifier)
                                .perfromUpdateCategoryRequest(
                                    cat.toJson(), widget.catId);
                          }
                          // debugPrint(user.toJson().toString());

                          message();
                          if (ref.watch(errorMessageProvider) == "") {
                            Future.delayed(const Duration(seconds: 5), () {
                              // context.go('/admin/categories');
                              Navigator.of(context).pop();
                            });
                          }
                          await ref
                              .read(categoryProvider.notifier)
                              .perfromGetSingleCategoryRequest(widget.catId);
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
