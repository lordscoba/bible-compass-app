import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteModalVerse extends ConsumerWidget {
  final String kwId;
  final String vsId;
  const DeleteModalVerse(this.kwId, this.vsId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// void message() {
//       final String message;
//       final bool error;
//       final sucessmessage = ref.watch(successMessageProvider);
//       final errormessage = ref.watch(errorMessageProvider);
//       if (errormessage.isEmpty) {
//         message = sucessmessage;
//         error = false;
//       } else {
//         message = errormessage;
//         error = true;
//       }
//       var displaymessage = SnackBarClass();
//       // ignore: use_build_context_synchronously
//       displaymessage.snackBarMade(context, message, error);
//     }
    // ref.listen(adminUserProvider, (prev, next) {
    //   if (next.error.isNotEmpty) {
    //     ref.read(errorMessageProvider.notifier).state = next.error.toString();
    //     // debugPrint(next.error);
    //   }
    //   if (!next.data['message'].toString().contains("null")) {
    //     ref.read(successMessageProvider.notifier).state =
    //         next.data['message'].toString();
    //     // debugPrint(next.data['message'].toString());
    //   }
    // });
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Delete Modal",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            const Text(
              "Are you sure you want to delete this?",
              style: TextStyle(color: Colors.black54),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BA37F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BA37F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20.0),
                  ),
                  onPressed: () {
                    ref
                        .read(verseProvider.notifier)
                        .performDeleteVerseRequest(kwId, vsId);
                    Navigator.of(context).pop();
                    const snackBar = SnackBar(
                      content: Text('Verse deleted'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text("Delete"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
