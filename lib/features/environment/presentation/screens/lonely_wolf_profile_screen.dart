import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/model/environment_model.dart';

class LonelyWolf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateLonelyWolf();
  EnvironmentState state;
}

class _StateLonelyWolf extends State<LonelyWolf> {
  @override
  void initState() {
    super.initState();
  }

  final List<Marker> lonelyWolfMarkers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // OK - Colocar dentro do modelo
    // Criar bloc listener respondendo stado de poup up
    // Criar builder com loading e respondendo ao estado de mostrar por perfil
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: BlocListener<EnvBloc, EnvironmentState>(
        listener: (context, state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is ShowDetailsState) {
            debugPrint("Abriu detalhe");
          }
        },
        child: BlocBuilder<EnvBloc, EnvironmentState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GotByProfileState) {
              for (EnvironmentModel env in state.envList) {
                lonelyWolfMarkers.add(env.toMarker(null));
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildLonenlyWolfScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.58;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.loboSolitario(),
            onTap: () {
              debugPrint("tempo ruim");
            },
          ),
          SizedBox(
            width: width,
            height: height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(-22.8808, -43.1043), zoom: 11.0),
              markers: Set.from(lonelyWolfMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
