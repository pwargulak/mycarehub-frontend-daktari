// Mocks generated by Mockito 5.3.0 from annotations
// in prohealth360_daktari/test/unit_tests/application/redux/actions/communities/promote_moderator_action_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:convert' as _i5;
import 'dart:typed_data' as _i6;

import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart'
    as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUri_0 extends _i1.SmartFake implements Uri {
  _FakeUri_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeResponse_1 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeStreamedResponse_2 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [IGraphQlClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGraphQlClient extends _i1.Mock implements _i3.IGraphQlClient {
  MockIGraphQlClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get idToken =>
      (super.noSuchMethod(Invocation.getter(#idToken), returnValue: '')
          as String);
  @override
  set idToken(String? _idToken) =>
      super.noSuchMethod(Invocation.setter(#idToken, _idToken),
          returnValueForMissingStub: null);
  @override
  String get endpoint =>
      (super.noSuchMethod(Invocation.getter(#endpoint), returnValue: '')
          as String);
  @override
  set endpoint(String? _endpoint) =>
      super.noSuchMethod(Invocation.setter(#endpoint, _endpoint),
          returnValueForMissingStub: null);
  @override
  Map<String, String> get requestHeaders =>
      (super.noSuchMethod(Invocation.getter(#requestHeaders),
          returnValue: <String, String>{}) as Map<String, String>);
  @override
  bool clientIsValid() =>
      (super.noSuchMethod(Invocation.method(#clientIsValid, []),
          returnValue: false) as bool);
  @override
  bool checkQueryString(String? query) =>
      (super.noSuchMethod(Invocation.method(#checkQueryString, [query]),
          returnValue: false) as bool);
  @override
  Uri fromUriOrString(dynamic uri) => (super.noSuchMethod(
      Invocation.method(#fromUriOrString, [uri]),
      returnValue:
          _FakeUri_0(this, Invocation.method(#fromUriOrString, [uri]))) as Uri);
  @override
  Map<String, dynamic> toMap(_i2.Response? response) =>
      (super.noSuchMethod(Invocation.method(#toMap, [response]),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  _i4.Future<_i2.Response> query(
          String? queryString, Map<String, dynamic>? variables) =>
      (super.noSuchMethod(Invocation.method(#query, [queryString, variables]),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this, Invocation.method(#query, [queryString, variables]))))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> postWithTimeout(Map<String, dynamic>? bodyMap) =>
      (super.noSuchMethod(Invocation.method(#postWithTimeout, [bodyMap]),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this, Invocation.method(#postWithTimeout, [bodyMap]))))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> callRESTAPI(
          {String? endpoint,
          String? method,
          Map<String, dynamic>? variables}) =>
      (super
          .noSuchMethod(Invocation.method(#callRESTAPI, [], {#endpoint: endpoint, #method: method, #variables: variables}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this,
                  Invocation.method(#callRESTAPI, [], {
                    #endpoint: endpoint,
                    #method: method,
                    #variables: variables
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: _i4.Future<_i2.StreamedResponse>.value(
                  _FakeStreamedResponse_2(
                      this, Invocation.method(#send, [request]))))
          as _i4.Future<_i2.StreamedResponse>);
  @override
  _i4.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this, Invocation.method(#head, [url], {#headers: headers}))))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this, Invocation.method(#get, [url], {#headers: headers}))))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#post, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this,
                  Invocation.method(#post, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#put, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this,
                  Invocation.method(#put, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#patch, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this,
                  Invocation.method(#patch, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#delete, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_1(
                  this,
                  Invocation.method(#delete, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<_i6.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: _i4.Future<_i6.Uint8List>.value(_i6.Uint8List(0)))
          as _i4.Future<_i6.Uint8List>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
