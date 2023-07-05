import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCategory extends ConsumerStatefulWidget {
  const CreateCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends ConsumerState<CreateCategory> {
  late CategoryModel category;
  late CategoryState categorystate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    category = CategoryModel();
    categorystate = const CategoryState();
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
    final CategoryState checkState = ref.watch(categoryProvider);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Category'),
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
                  hintText: " Enter Category Name",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    category = category.copyWith(categoryName: value!);
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
                  initialValue: 'false',
                  onSaved: (value) {
                    category = category.copyWith(
                        forSubscribers: value?.toLowerCase() == 'true');
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Create',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // debugPrint(category.toJson().toString());
                      await ref
                          .read(categoryProvider.notifier)
                          .perfromCreateCategoryRequest(category.toJson());
                      await ref
                          .refresh(categoryProvider.notifier)
                          .perfromGetCatgeoriesRequest();
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
