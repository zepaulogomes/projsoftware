
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvRemoteDataSource {
  List<EnvironmentModel> getByType(String type);
  List<EnvironmentModel> getByProfile(String profile);
  List<EnvironmentModel> getAll();
  EnvironmentModel getSingleEnvironment(String code);
}

class EnvRemoteDataSourceImpl implements EnvRemoteDataSource {
  Future<List<EnvironmentModel>> envList;

  // Construtor com dados padrões
  EnvRemoteDataSourceImpl();

  @override
  List<EnvironmentModel> getByType(String type) {
    List<EnvironmentModel> environmentList = new List<EnvironmentModel>();

    try {
      List<EnvironmentModel> all = _populateEnvList();
      for (EnvironmentModel env in all) {
        if (env != null && env.type == type) {
          environmentList.add(env);
        }
      }
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }

    return null;
  }

  @override
  List<EnvironmentModel> getByProfile(String profile) {
    List<EnvironmentModel> environmentList = new List<EnvironmentModel>();

    try {
      List<EnvironmentModel> all = _populateEnvList();
      for (EnvironmentModel env in all) {
        if (env != null && env.profile == profile) {
          environmentList.add(env);
        }
      }
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
    return environmentList;
  }

  @override
  List<EnvironmentModel> getAll()  {
    try {
      List<EnvironmentModel> all = _populateEnvList();
      return all;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }

    @override
    Future<EnvironmentModel> getSingleEnvironment(String code) {}
  }

  @override
  EnvironmentModel getSingleEnvironment(String code){
    try {
      List<EnvironmentModel> all =  _populateEnvList();
      for (EnvironmentModel env in all){
        if (env!=null && env.code == code)
          return env;
      }
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
    return null;
  }

  static List<EnvironmentModel> _populateEnvList()  {
    List<EnvironmentModel> envList = new List<EnvironmentModel>();
    envList.add(EnvironmentModel(
        code: "0Ij00HG0Z2Jvr97FG819",
        building: "Instituto de Computação",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.906382,
        longitude: -43.133637,
        name: "Pilotis",
        type: "Ambiente externo",
        profile: "Não tem tempo ruim"));
    envList.add(EnvironmentModel(
        code: "5ymOl7Ll7wJ5MoFyFFX1",
        building: "NAB",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.906797,
        longitude: -43.132859,
        name: "Bancos",
        type: "Ambiente externo",
        profile: "Não tem tempo ruim"));
    envList.add(EnvironmentModel(
        code: "BzmGDrRBEqniIxWu2Td9",
        building: "Física antiga",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.905237,
        longitude: -43.133365,
        name: "Hall de entada",
        type: "Ambiente comum",
        profile: "Lobo solitário"));
    envList.add(EnvironmentModel(
        code: "C5yxPayhhPflGakhxsvi",
        building: "Instituto de Computação",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.906649,
        longitude: -43.133336,
        name: "Sala de estudos",
        type: "Sala de estudos",
        profile: "Da galera"));
    envList.add(EnvironmentModel(
        code: "IBK9dNOLQj4ZUrNd1iSs",
        building: "Instituto de Computação",
        campus: "PV",
        complement: "Próximo a orla",
        latitude: -22.906545,
        longitude: -43.133401,
        name: "Bancos",
        type: "Ambiente externo",
        profile: "Não tem tempo ruim"));
    envList.add(EnvironmentModel(
        code: "L121gks0MuDrReVVb2bN",
        building: "Biblioteca da engenharia",
        campus: "PV",
        complement: "Próximo ao bandejão",
        latitude: -22.905487,
        longitude: -43.132712,
        name: "Biblioteca da engenharia",
        type: "Biblioteca",
        profile: "Lobo solitário"));
    envList.add(EnvironmentModel(
        code: "OiR74lqUkK7YF70MVM8w",
        building: "Geofísica",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.906148,
        longitude: -43.133803,
        name: "Biblioteca de Geofísica",
        type: "Biblioteca",
        profile: "Lobo solitário"));
    envList.add(EnvironmentModel(
        code: "V791rEX2bpvb78VG6Czg",
        building: "Bloco D",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.904781,
        longitude: -43.131513,
        name: "Hall do bloco D",
        type: "Ambiente comum",
        profile: "Da galera"));
    envList.add(EnvironmentModel(
        code: "XBTVONO2pTR7bHdeEuUJ",
        building: "Escola de Arquitetura e Urbanismo",
        campus: "PV",
        complement: "Térreo",
        latitude: -22.9043,
        longitude: -43.130636,
        name: "Sala comum",
        type: "Sala de estudos",
        profile: "Da galera"));
    envList.add(EnvironmentModel(
        code: "eiPJ71Kd6Dl8VOtyEPWt",
        building: "Bloco H",
        campus: "PV",
        complement: "Corredor 2º andar",
        latitude: -22.904442,
        longitude: -43.134541,
        name: "Mesas do corredor",
        type: "Ambiente comum",
        profile: "Não tem tempo ruim"));
    envList.add(EnvironmentModel(
        code: "r1tEsQehM1x0ufyzOuhD",
        building: "Instituto de Computação",
        campus: "PV",
        complement: "Sala 301",
        latitude: -22.906397,
        longitude: -43.132891,
        name: "Laboratório",
        type: "Sala de estudos",
        profile: "Da galera"));
    return envList;
  }
}
