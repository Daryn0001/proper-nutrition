import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';


class SwitchButton extends StatefulWidget {
   bool value;
   final dynamic id;
  SwitchButton({Key? key, required this.value, required this.id}) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _switchValue = false;

  initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }


  @override
  initState(){
    super.initState();
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.value,
      onChanged: (value) {
        setState(() {
          widget.value = value;
          FirebaseFirestore.instance
              .collection('ingredients')
              .doc(widget.id)
              .delete();
        });
      },
    );
  }
}
