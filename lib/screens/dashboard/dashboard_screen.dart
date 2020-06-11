import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/commons/widgets/drawer_app_bar.dart';
import 'package:jober/screens/dashboard/widgets/job_card.dart';
import 'package:jober/screens/dashboard/widgets/job_resume_card.dart';
import 'package:jober/utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchJobsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DrawerAppBar(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          backgroundColor: kPurpleDefaultColor,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPurpleDefaultColor, kPurpleLightDefaultColor],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Bem vindo,',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Encontre uma nova oportunidade',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Color.fromRGBO(91, 0, 183, 1),
                    child: new ListTile(
                      dense: true,
                      leading: new Icon(
                        Icons.search,
                        color: Colors.grey[100],
                      ),
                      title: new TextField(
                        controller: _searchJobsController,
                        decoration: new InputDecoration(
                          hintText: 'Procure por vagas, serviços ou produtos',
                          hintStyle: TextStyle(color: Colors.grey[100]),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.grey[100], fontSize: 14),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Minhas candidaturas',
                style: TextStyle(
                  fontSize: 16,
                  color: kPurpleDefaultColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  JobResumeCard(
                      title: 'Garçom no bar do João',
                      description: 'Sirva mesas e atenda clientes'),
                  JobResumeCard(
                      title: 'Garçom no bar do João',
                      description: 'Sirva mesas e atenda clientes'),
                  JobResumeCard(
                      title: 'Garçom no bar do João',
                      description: 'Sirva mesas e atenda clientes'),
                  JobResumeCard(
                      title: 'Garçom no bar do João',
                      description: 'Sirva mesas e atenda clientes'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Oportunidades recentes',
                style: TextStyle(
                  fontSize: 16,
                  color: kPurpleDefaultColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: <Widget>[
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                    JobCard(
                        title: 'Garçom no bar do João',
                        description: 'Sirva mesas e atenda clientes'),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: kBlueDefaultColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.content_paste),
                title: Text('Abrir vaga'),
                backgroundColor: kBlueDefaultColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_carousel),
                title: Text('Vagas'),
                backgroundColor: kBlueDefaultColor)
          ],
        ),
      ),
    );
  }
}
