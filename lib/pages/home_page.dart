import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/profile_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //then
  //async - await

  int n = 10;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool darkMode = false;
  int gender = 1;

  SPGlobal mandarina = SPGlobal();



  @override
  initState() {
    super.initState();
    _getDataFull();
  }

  Future<int> getNumberMandarina() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 100;
    });
  }

  _saveData() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("fullName", _fullNameController.text);
    // prefs.setString("address", _addressController.text);
    // prefs.setBool("darkMode", darkMode);
    // prefs.setInt("gender", gender);
    // print("Guardando...");



    mandarina.fullName = _fullNameController.text;
    mandarina.address = _addressController.text;
    mandarina.darkMode = darkMode;
    mandarina.gender = gender;


  }

  _getDataFull() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("fullName"));
    // print(prefs.getString("address"));
    // print(prefs.getBool("darkMode"));
    // print(prefs.getInt("gender"));

    // _fullNameController.text = prefs.getString("fullName") ?? "";
    // _addressController.text = prefs.getString("address") ?? "";
    // darkMode = prefs.getBool("darkMode") ?? false;
    // gender = prefs.getInt("gender") ?? 1;

    _fullNameController.text = mandarina.fullName;
    _addressController.text = mandarina.address;

    // setState(() {
    //
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/1145720/pexels-photo-1145720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Juan Ramón Lopez",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Text(
                      "Administrador",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
              },
              leading: Icon(
                Icons.person,
              ),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(
                Icons.file_copy,
              ),
              title: Text("Portfolio"),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.6,
              indent: 12,
              endIndent: 12,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff424242),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(hintText: "Full name"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(hintText: "Address"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SwitchListTile(
                title: Text("Dark Mode"),
                value: darkMode,
                onChanged: (bool value) {
                  darkMode = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Gender",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              RadioListTile(
                title: Text("Male"),
                value: 1,
                groupValue: gender,
                onChanged: (int? value) {
                  gender = value!;
                  setState(() {

                  });
                },
              ),
              RadioListTile(
                title: Text("Female"),
                value: 2,
                groupValue: gender,
                onChanged: (int? value) {
                  gender = value!;
                  setState(() {

                  });
                },
              ),


              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    n = 10000;
                    _saveData();
                  },
                  label: const Text(
                    "Save data",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}