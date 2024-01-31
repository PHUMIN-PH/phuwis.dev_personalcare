import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HealthData extends StatefulWidget {
  const HealthData({super.key});

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data For You'),
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: const ChemicalLabTextfield_II(),
    );
  }
}

class ChemicalLabTextfield_II extends StatefulWidget {
  const ChemicalLabTextfield_II({super.key});

  @override
  State<ChemicalLabTextfield_II> createState() => _ChemicalLabTextfield_IIState();
}

class _ChemicalLabTextfield_IIState extends State<ChemicalLabTextfield_II> {
  final TextEditingController _usernameCheck = TextEditingController();

  final TextEditingController _textformSugarBloodController =
      TextEditingController();
  final TextEditingController _textformBloodUreaNitrogen =
      TextEditingController();
  final TextEditingController _textformCreatinine = TextEditingController();
  final TextEditingController _textformEstimatedGFR = TextEditingController();
  final TextEditingController _textformCholesterol = TextEditingController();
  final TextEditingController _textformTriglyceride = TextEditingController();
  final TextEditingController _textformHighDensityLipoprotein =
      TextEditingController();
  final TextEditingController _textformLowDensityLipoprotein =
      TextEditingController();

  final TextEditingController _textformSGOT = TextEditingController();
  final TextEditingController _textformSGPT = TextEditingController();
  final TextEditingController _textformALP = TextEditingController();

  final TextEditingController _textformTotalProtein = TextEditingController();
  final TextEditingController _textformAlbumin = TextEditingController();
  final TextEditingController _textformTotalBilirubin = TextEditingController();
  final TextEditingController _textformDirectBilirubin =
      TextEditingController();
  final TextEditingController _textformUricAcid = TextEditingController();
  final TextEditingController _textformHBsAg = TextEditingController();
  final TextEditingController _textformAntiHBs = TextEditingController();
  final TextEditingController _textformAntiHAV = TextEditingController();
  final TextEditingController _textformCarcinoembryonicAntigen =
      TextEditingController();
  final TextEditingController _textformAlphaFetoproteinAFP =
      TextEditingController();
  final TextEditingController _textformProstateSpecificAntigen =
      TextEditingController();
  final TextEditingController _textformHbA1C = TextEditingController();
  final TextEditingController _textformT3 = TextEditingController();
  final TextEditingController _textformT4 = TextEditingController();
  final TextEditingController _textformThyroidStimulatingHormone =
      TextEditingController();
  final TextEditingController _textformCA153 = TextEditingController();
  final TextEditingController _textformCA125 = TextEditingController();
  final TextEditingController _textformCA199 = TextEditingController();

  String _successMessage = '';
  String _problemMessage = '';
  String usernameRecive = 'Admin3';

  Future sendLabDataAPI() async {
    String url = "https://energeticbase.000webhostapp.com/lb_insertAPI.php";
    //"https://energeticbase.000webhostapp.com/coreapi/apixcmlab/apix_insert.php"; //"http://192.168.1.115:8080/FlutterBase/register.php";
    final responseLab = await http.post(Uri.parse(url), body: {
      // 'username': usernameRecive,

      'SugarBloodController': _textformSugarBloodController.text,
      'BloodUreaNitrogen': _textformBloodUreaNitrogen.text,
      'Creatinine': _textformCreatinine.text,
      'EstimatedGFR': _textformEstimatedGFR.text,
      'Cholesterol': _textformCholesterol.text,
      'Triglyceride': _textformTriglyceride.text,
      'HighDensityLipoprotein': _textformHighDensityLipoprotein.text,
      'LowDensityLipoprotein': _textformLowDensityLipoprotein.text,
      'SGOT': _textformSGOT.text,
      'SGPT': _textformSGPT.text,
      'ALP': _textformALP.text,
      'TotalProtein': _textformTotalProtein.text,
      'Albumin': _textformAlbumin.text,
      'TotalBilirubin': _textformTotalBilirubin.text,
      'DirectBilirubin': _textformDirectBilirubin.text,
      'UricAcid': _textformUricAcid.text,
      'HBsAg': _textformHBsAg.text,
      'AntiHBs': _textformAntiHBs.text,
      'AntiHAV': _textformAntiHAV.text,
      'CarcinoembryonicAntigen': _textformCarcinoembryonicAntigen.text,
      'AlphaFetoproteinAFP': _textformAlphaFetoproteinAFP.text,
      'ProstateSpecificAntigen': _textformProstateSpecificAntigen.text,
      'HbA1C': _textformHbA1C.text,
      'T3': _textformT3.text,
      'T4': _textformT4.text,
      'ThyroidStimulatingHormone': _textformThyroidStimulatingHormone.text,
      'CA153': _textformCA153.text,
      'CA125': _textformCA125.text,
      'CA199': _textformCA199.text,
    });
    print(json.decode(responseLab.body));
    var data = json.decode(responseLab.body);

    // if (_usernameCheck.text == "") {
    //   // if(_username.text ==""){
    //   //   print("username  is null");
    //   // }else if(_passwordTextController.text == ""){
    //   //   print(" password is null");
    //   // }
    //   setState(() {
    //     _errorMessage = 'Enter username and password.';
    //   });
    // } else {
    if (data == "Insert") {
      setState(() {
        _successMessage = 'Success input!';
      });
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (data == "Problem") {
      setState(() {
        _successMessage = 'Problem wrong!';
      });
    } else if (data == "Update") {
      setState(() {
        _successMessage = 'Update Success!';
      });
    } else {
      setState(() {
        _successMessage = 'somting wrong!';
      });
      // print(
      //     '****************************** Not Error **********************************');
      // print(data);
      // print(
      //     '****************************** ===== **********************************');
      // await User.setsignin(true);
      // Navigator.pushNamed(context, 'home');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // _buildInputClinicalLab(context, 'น้ำตาลในเลือด', 'Fasting Blood Sugar',
        //     _textformSugarBloodController),
        _buildTextHeader(context, 'ผลการสุขภาพตรวจทางห้องปฏิบัติการ', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        // Add more items as needed
        _buildInputClinicalLab(context, 'น้ำตาลในเลือด', 'Fasting Blood Sugar',
            _textformSugarBloodController),
        _buildInputClinicalLab(context, 'ปริมาณไนโตรเจนในเลือด',
            'Blood Urea Nitrogen', _textformBloodUreaNitrogen),
        _buildInputClinicalLab(
            context, 'การทำงานของไต', 'Creatinine', _textformCreatinine),
        _buildInputClinicalLab(context, 'อัตราการกรองของไต',
            'Estimated Glomerular Filtration Rate', _textformEstimatedGFR),
        _buildInputClinicalLab(context, 'ระดับไขมันในเลือด 1', 'Cholesterol',
            _textformCholesterol),
        _buildInputClinicalLab(context, 'ระดับไขมันในเลือด 2', 'Triglyceride',
            _textformTriglyceride),
        _buildInputClinicalLab(context, 'ไขมันส่วนดี',
            'High Density Lipoprotein', _textformHighDensityLipoprotein),
        _buildInputClinicalLab(context, 'ไขมันส่วนไม่ดี',
            'Low Density Lipoprotein', _textformLowDensityLipoprotein),
        _buildInputClinicalLab(context, 'การทำงานของตับ SGOT',
            'Aspartate transaminase', _textformSGOT),
        _buildInputClinicalLab(context, 'การทำงานของตับ SGPT',
            'Alkaline phosphatase', _textformSGPT),
        _buildInputClinicalLab(context, 'การทำงานของตับ ALP',
            'Alkaline phosphatase', _textformALP),
        _buildInputClinicalLab(context, 'ภาวะโภชนาการของร่างกาย 1',
            'Total protein', _textformTotalProtein),
        _buildInputClinicalLab(
            context, 'ภาวะโภชนาการของร่างกาย 2', 'Albumin', _textformAlbumin),
        _buildInputClinicalLab(context, 'การทำงานของตับ Tb ', 'Total bilirubin',
            _textformTotalBilirubin),
        _buildInputClinicalLab(context, 'การทำงานของตับ Db', 'Direct bilirubin',
            _textformDirectBilirubin),
        _buildInputClinicalLab(
            context, 'สารโรคเก๊าท์', 'Uric acid', _textformUricAcid),
        _buildInputClinicalLab(context, 'เชื้อไวรัสตับอักเสบบี',
            'Hepatitis B (HBsAg)', _textformHBsAg),
        _buildInputClinicalLab(context, 'ภูมิคุ้มกันไวรัสตับอักเสบบี',
            'Anti-HBs / HBsAb', _textformAntiHBs),
        _buildInputClinicalLab(
            context, 'ตรวจหาภูมิคุ้มกัน HVA', 'Anti HAV', _textformAntiHAV),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งลำไส้ - ทางเดินอาหาร',
            'Carcinoembryonic Antigen', _textformCarcinoembryonicAntigen),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งตับ',
            'Alpha fetoprotein AFP', _textformAlphaFetoproteinAFP),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งต่อมลูกหมาก',
            'prostate-specific antigen', _textformProstateSpecificAntigen),
        _buildInputClinicalLab(context, 'ตรวจหาระดับน้ำตาลสะสม',
            'Hemoglobin A1c (HbA1C)', _textformHbA1C),
        _buildInputClinicalLab(context, 'ตรวจระดับไทรอยด์ในเลือด 1',
            'Triodothyronine (T3)', _textformT3),
        _buildInputClinicalLab(context, 'ตรวจระดับไทรอยด์ในเลือด 2',
            'Thyroxine (T4)', _textformT4),
        _buildInputClinicalLab(context, 'ตรวจระดับไทรอยด์ในเลือด 3',
            'Thyroid stimulating hormone', _textformThyroidStimulatingHormone),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งเต้านม',
            'Cancer antigen 15-3 (CA15-3)', _textformCA153),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งรังไข่',
            'Cancer Antigen 125 (CA125)', _textformCA125),
        _buildInputClinicalLab(context, 'สารบ่งชี้มะเร็งตับอ่อน',
            'Tumor marker  (CA19-9)', _textformCA199),
        // SizedBox(
        //   height: 15,
        // ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // if (_successMessage.isNotEmpty)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8.0),
              //     child: Text(
              //       _successMessage,
              //       style: const TextStyle(color: Colors.green, fontSize: 20),
              //     ),
              //   ),
              ElevatedButton(
                onPressed: () => dialogMethod(context),
                child: Text('Submit'),
                // sendLabDataAPI();
              ),
            ],
          ),
        ),

        // _btnFoot(context, '', () {
        //   // Action to perform when Item 2 is tapped
        //   _onItem2Tapped(context);
        // }),
      ],
    );
  }

  Future<String?> dialogMethod(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        // backgroundColor: Colors.green,
        title: const Text('บันทึกข้อมูลสำเร็จ'),
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        // content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, 'home'),
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputClinicalLab(BuildContext context, String itemName,
      String subItemName, TextEditingController controller) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      itemName,
                      style: inputClinicalLabTextStyle(),
                    ),
                    subtitle: Text(
                      subItemName,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type  here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      constraints: BoxConstraints.expand(width: 50, height: 50),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      labelStyle: TextStyle(fontSize: 30.0),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnFoot(BuildContext context, String itemName, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    itemName,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // TextField(
                  //   controller: _textformSugarBloodController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Type something here',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: () {
                // Access the text entered by the user
                // String enteredText = _textformSugarBloodController.text;
                // print('Entered Text: $enteredText');
                sendLabDataAPI();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHeader(
      BuildContext context, String itemName, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    itemName,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // TextField(
                  //   controller: _textformSugarBloodController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Type something here',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTextboxItem(
      BuildContext context, String itemName, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your text:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _textformSugarBloodController,
              decoration: InputDecoration(
                hintText: 'Type something here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Access the text entered by the user
                String enteredText = _textformSugarBloodController.text;
                print('Entered Text: $enteredText');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _onItem1Tapped(BuildContext context) {
    // Replace this with the action you want to perform for Item 1
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item 1 Tapped!'),
      ),
    );
  }

  void _onItem2Tapped(BuildContext context) {
    // Replace this with the action you want to perform for Item 2
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item 2 Tapped!'),
      ),
    );
  }
}

TextStyle inputClinicalLabTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
}) {
  return const TextStyle(
    color: Colors.black, // Default color is black
    fontSize: 16.0, // Default font size is 16.0
    fontWeight: FontWeight.w700, // Default font weight is normal
    fontStyle: FontStyle.normal, // Default font style is normal
  );
}