import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/serializers.dart';

class AuthService extends ApiService {
  AuthService({required ApiClient client}) : super(client: client);

//************************************ log-in *********************************//
  Future<Map<String, dynamic>> loginWithPassword(
      {Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        path: '/user_management/customer/sign_in',
        body: objToApi);
    if (res.isSuccess) {
      return {'customer': res.data!.user};
    } else {
      throw res.error;
    }
  }
}
