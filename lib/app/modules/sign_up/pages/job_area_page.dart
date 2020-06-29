import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/utils/constants.dart';
import 'package:jober/app/shared/widgets/custom_app_bar.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';

class JobAreaPage extends StatefulWidget {
  @override
  _JobAreaPageState createState() => _JobAreaPageState();
}

class _JobAreaPageState extends ModularState<JobAreaPage, SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        finderWhite: true,
        backIconColor: Colors.white,
        backgroundColor: kPurpleDefaultColor,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPurpleDefaultColor, kPurpleLightDefaultColor],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 55),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Agora selecione sua ',
                      ),
                      new TextSpan(
                        text: 'área de trabalho.',
                        style: TextStyle(color: kBlueDefaultColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: new Card(
                  color: Color.fromRGBO(91, 0, 183, 1),
                  child: new ListTile(
                      dense: true,
                      leading: new Icon(
                        Icons.search,
                        color: Colors.grey[100],
                      ),
                      title: new Observer(
                        builder: (_) {
                          return new TextField(
                            controller: controller.searchAreaController,
                            decoration: new InputDecoration(
                              hintText: 'Filtre por área',
                              hintStyle: TextStyle(color: Colors.grey[100]),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.grey[100]),
                            onChanged: controller.filterJobArea,
                          );
                        },
                      )),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(91, 0, 183, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                    height: 350,
                    child: Observer(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.areasFiltered.length,
                        itemBuilder: (context, index) {
                          return buildListTile(controller.areasFiltered[index]);
                        },
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NextButton(
        callback: () {
          controller.fillJobArea();
        },
      ),
    );
  }

  Widget buildListTile(area) {
    return Observer(
      builder: (_) {
        return RadioListTile(
          activeColor: Colors.white,
          groupValue: controller.radioValue,
          title: Text(
            area,
            style: TextStyle(
              color: area == controller.radioValue
                  ? Colors.grey[50]
                  : Colors.grey[400],
            ),
          ),
          value: area,
          onChanged: controller.handleRadioValueChange,
        );
      },
    );
  }
}
