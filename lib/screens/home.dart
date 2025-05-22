import 'package:codeforces_finder/functions/capitalize.dart';
import 'package:codeforces_finder/functions/find.dart';
import 'package:codeforces_finder/widgets/my_button.dart';
import 'package:codeforces_finder/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Status {
  String empty = 'empty';
  String loading = 'loading';
  String show = 'show';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController(),
      surnameController = TextEditingController();
  String status = Status().empty;
  List handles = [];
  String name = '', surname = '';

  Future<List> doFind() async {
    setState(() {
      status = Status().loading;
    });

    name = nameController.text.toLowerCase();
    surname = surnameController.text.toLowerCase();

    List handles = await find(name, surname);

    name = capitalize(name);
    surname = capitalize(surname);

    setState(() {
      status = Status().show;
      if (handles.isEmpty) {
        status = Status().empty;
      }
    });

    return handles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: MyTextField(
                    onSubmitted: (value) async {
                      handles = await doFind();
                    },
                    controller: surnameController,
                    hintText: 'Surname',
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  height: 50,
                  child: MyButton(
                    onPressed: () async {
                      handles = await doFind();
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            if (status == Status().loading)
              Expanded(
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/searching_animation.json',
                  ),
                ),
              )
            else if (status == Status().empty)
              Expanded(child: Center(child: Image.asset('assets/empty.jpg')))
            else if (status == Status().show && handles.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 100,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: handles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          String url =
                              'https://codeforces.com/profile/${handles[index]}';
                          await launchUrl(Uri.parse(url));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              handles[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
