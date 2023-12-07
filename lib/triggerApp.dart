import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triggerapp/provider.dart';

class triggerApp extends StatefulWidget {
  const triggerApp({Key? key}) : super(key: key);

  @override
  State<triggerApp> createState() => _triggerAppState();
}

class _triggerAppState extends State<triggerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("  TRIGGER ", style: TextStyle(fontWeight: FontWeight.w500)),
          backgroundColor: Colors.greenAccent),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              //width: 200,
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(3)),
              child: Center(
                child: Consumer<ProviderClass>(
                  builder: (context, provider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Counting status: ${provider.numcount} ',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        // Text(
                        // 'Success! Total successes: ${Provider.of<ProviderClass>(context, listen: false).numcount}'),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    int Randomnumber =
                        Provider.of<ProviderClass>(context, listen: false)
                            .RandomnNo();
                    Provider.of<ProviderClass>(context, listen: false)
                        .counterincrement();
                    checkSuccess(Randomnumber, context);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's start",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "CLICK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.green),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  child: Center(
                    child: Consumer<ProviderClass>(
                      builder: (context, provider, child) {
                        return Text(
                          'counting: ${provider.RandomnNo()}',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        );
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.green),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

void checkSuccess(int Randomnumber, BuildContext context) {
  DateTime now = DateTime.now();
  int currentSeconds = now.second;

  if (Randomnumber == currentSeconds) {
    Provider.of<ProviderClass>(context, listen: false).counterincrement();
    // Display success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Success! Total successes: ${Provider.of<ProviderClass>(context, listen: false).numcount}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  } else {
    // Display try again message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("try again", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
