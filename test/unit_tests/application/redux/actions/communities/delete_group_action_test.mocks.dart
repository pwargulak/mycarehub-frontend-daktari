// Mocks generated by Mockito 5.3.0 from annotations
// in prohealth360_daktari/test/unit_tests/application/redux/actions/communities/delete_group_action_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:stream_chat/stream_chat.dart' as _i2;

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

class _FakeStreamChatClient_0 extends _i1.SmartFake
    implements _i2.StreamChatClient {
  _FakeStreamChatClient_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSendMessageResponse_1 extends _i1.SmartFake
    implements _i2.SendMessageResponse {
  _FakeSendMessageResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUpdateMessageResponse_2 extends _i1.SmartFake
    implements _i2.UpdateMessageResponse {
  _FakeUpdateMessageResponse_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeEmptyResponse_3 extends _i1.SmartFake implements _i2.EmptyResponse {
  _FakeEmptyResponse_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSendFileResponse_4 extends _i1.SmartFake
    implements _i2.SendFileResponse {
  _FakeSendFileResponse_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSendImageResponse_5 extends _i1.SmartFake
    implements _i2.SendImageResponse {
  _FakeSendImageResponse_5(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSearchMessagesResponse_6 extends _i1.SmartFake
    implements _i2.SearchMessagesResponse {
  _FakeSearchMessagesResponse_6(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSendReactionResponse_7 extends _i1.SmartFake
    implements _i2.SendReactionResponse {
  _FakeSendReactionResponse_7(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakePartialUpdateChannelResponse_8 extends _i1.SmartFake
    implements _i2.PartialUpdateChannelResponse {
  _FakePartialUpdateChannelResponse_8(
      Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUpdateChannelResponse_9 extends _i1.SmartFake
    implements _i2.UpdateChannelResponse {
  _FakeUpdateChannelResponse_9(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAcceptInviteResponse_10 extends _i1.SmartFake
    implements _i2.AcceptInviteResponse {
  _FakeAcceptInviteResponse_10(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeRejectInviteResponse_11 extends _i1.SmartFake
    implements _i2.RejectInviteResponse {
  _FakeRejectInviteResponse_11(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAddMembersResponse_12 extends _i1.SmartFake
    implements _i2.AddMembersResponse {
  _FakeAddMembersResponse_12(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeInviteMembersResponse_13 extends _i1.SmartFake
    implements _i2.InviteMembersResponse {
  _FakeInviteMembersResponse_13(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeRemoveMembersResponse_14 extends _i1.SmartFake
    implements _i2.RemoveMembersResponse {
  _FakeRemoveMembersResponse_14(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSendActionResponse_15 extends _i1.SmartFake
    implements _i2.SendActionResponse {
  _FakeSendActionResponse_15(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeChannelState_16 extends _i1.SmartFake implements _i2.ChannelState {
  _FakeChannelState_16(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryRepliesResponse_17 extends _i1.SmartFake
    implements _i2.QueryRepliesResponse {
  _FakeQueryRepliesResponse_17(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryReactionsResponse_18 extends _i1.SmartFake
    implements _i2.QueryReactionsResponse {
  _FakeQueryReactionsResponse_18(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeGetMessagesByIdResponse_19 extends _i1.SmartFake
    implements _i2.GetMessagesByIdResponse {
  _FakeGetMessagesByIdResponse_19(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeTranslateMessageResponse_20 extends _i1.SmartFake
    implements _i2.TranslateMessageResponse {
  _FakeTranslateMessageResponse_20(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryMembersResponse_21 extends _i1.SmartFake
    implements _i2.QueryMembersResponse {
  _FakeQueryMembersResponse_21(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryBannedUsersResponse_22 extends _i1.SmartFake
    implements _i2.QueryBannedUsersResponse {
  _FakeQueryBannedUsersResponse_22(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [Channel].
///
/// See the documentation for Mockito's code generation for more information.
class MockChannel extends _i1.Mock implements _i2.Channel {
  MockChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set state(_i2.ChannelClientState? _state) =>
      super.noSuchMethod(Invocation.setter(#state, _state),
          returnValueForMissingStub: null);
  @override
  set cooldownStartedAt(DateTime? _cooldownStartedAt) => super.noSuchMethod(
      Invocation.setter(#cooldownStartedAt, _cooldownStartedAt),
      returnValueForMissingStub: null);
  @override
  set name(String? name) => super.noSuchMethod(Invocation.setter(#name, name),
      returnValueForMissingStub: null);
  @override
  set image(String? image) =>
      super.noSuchMethod(Invocation.setter(#image, image),
          returnValueForMissingStub: null);
  @override
  set extraData(Map<String, Object?>? extraData) =>
      super.noSuchMethod(Invocation.setter(#extraData, extraData),
          returnValueForMissingStub: null);
  @override
  bool get isMuted =>
      (super.noSuchMethod(Invocation.getter(#isMuted), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get isMutedStream =>
      (super.noSuchMethod(Invocation.getter(#isMutedStream),
          returnValue: _i3.Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get isGroup =>
      (super.noSuchMethod(Invocation.getter(#isGroup), returnValue: false)
          as bool);
  @override
  bool get isDistinct =>
      (super.noSuchMethod(Invocation.getter(#isDistinct), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i2.ChannelConfig?> get configStream =>
      (super.noSuchMethod(Invocation.getter(#configStream),
              returnValue: _i3.Stream<_i2.ChannelConfig?>.empty())
          as _i3.Stream<_i2.ChannelConfig?>);
  @override
  _i3.Stream<_i2.Member?> get membershipStream => (super.noSuchMethod(
      Invocation.getter(#membershipStream),
      returnValue: _i3.Stream<_i2.Member?>.empty()) as _i3.Stream<_i2.Member?>);
  @override
  _i3.Stream<_i2.User?> get createdByStream =>
      (super.noSuchMethod(Invocation.getter(#createdByStream),
          returnValue: _i3.Stream<_i2.User?>.empty()) as _i3.Stream<_i2.User?>);
  @override
  bool get frozen =>
      (super.noSuchMethod(Invocation.getter(#frozen), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get frozenStream =>
      (super.noSuchMethod(Invocation.getter(#frozenStream),
          returnValue: _i3.Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get disabled =>
      (super.noSuchMethod(Invocation.getter(#disabled), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get disabledStream =>
      (super.noSuchMethod(Invocation.getter(#disabledStream),
          returnValue: _i3.Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get hidden =>
      (super.noSuchMethod(Invocation.getter(#hidden), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get hiddenStream =>
      (super.noSuchMethod(Invocation.getter(#hiddenStream),
          returnValue: _i3.Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  _i3.Stream<DateTime?> get truncatedAtStream =>
      (super.noSuchMethod(Invocation.getter(#truncatedAtStream),
          returnValue: _i3.Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  int get cooldown =>
      (super.noSuchMethod(Invocation.getter(#cooldown), returnValue: 0) as int);
  @override
  _i3.Stream<int> get cooldownStream =>
      (super.noSuchMethod(Invocation.getter(#cooldownStream),
          returnValue: _i3.Stream<int>.empty()) as _i3.Stream<int>);
  @override
  _i3.Stream<DateTime?> get createdAtStream =>
      (super.noSuchMethod(Invocation.getter(#createdAtStream),
          returnValue: _i3.Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get lastMessageAtStream =>
      (super.noSuchMethod(Invocation.getter(#lastMessageAtStream),
          returnValue: _i3.Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get updatedAtStream =>
      (super.noSuchMethod(Invocation.getter(#updatedAtStream),
          returnValue: _i3.Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get deletedAtStream =>
      (super.noSuchMethod(Invocation.getter(#deletedAtStream),
          returnValue: _i3.Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<int?> get memberCountStream =>
      (super.noSuchMethod(Invocation.getter(#memberCountStream),
          returnValue: _i3.Stream<int?>.empty()) as _i3.Stream<int?>);
  @override
  String get type =>
      (super.noSuchMethod(Invocation.getter(#type), returnValue: '') as String);
  @override
  Map<String, Object?> get extraData =>
      (super.noSuchMethod(Invocation.getter(#extraData),
          returnValue: <String, Object?>{}) as Map<String, Object?>);
  @override
  List<String> get ownCapabilities =>
      (super.noSuchMethod(Invocation.getter(#ownCapabilities),
          returnValue: <String>[]) as List<String>);
  @override
  _i3.Stream<List<String>> get ownCapabilitiesStream =>
      (super.noSuchMethod(Invocation.getter(#ownCapabilitiesStream),
              returnValue: _i3.Stream<List<String>>.empty())
          as _i3.Stream<List<String>>);
  @override
  _i3.Stream<Map<String, Object?>> get extraDataStream =>
      (super.noSuchMethod(Invocation.getter(#extraDataStream),
              returnValue: _i3.Stream<Map<String, Object?>>.empty())
          as _i3.Stream<Map<String, Object?>>);
  @override
  _i3.Stream<String?> get nameStream =>
      (super.noSuchMethod(Invocation.getter(#nameStream),
          returnValue: _i3.Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i3.Stream<String?> get imageStream =>
      (super.noSuchMethod(Invocation.getter(#imageStream),
          returnValue: _i3.Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i2.StreamChatClient get client => (super.noSuchMethod(
          Invocation.getter(#client),
          returnValue:
              _FakeStreamChatClient_0(this, Invocation.getter(#client)))
      as _i2.StreamChatClient);
  @override
  _i3.Future<bool> get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  void cancelAttachmentUpload(String? attachmentId, {String? reason}) =>
      super.noSuchMethod(
          Invocation.method(
              #cancelAttachmentUpload, [attachmentId], {#reason: reason}),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> retryAttachmentUpload(
          String? messageId, String? attachmentId) =>
      (super.noSuchMethod(
          Invocation.method(#retryAttachmentUpload, [messageId, attachmentId]),
          returnValue: _i3.Future<void>.value(),
          returnValueForMissingStub:
              _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i2.SendMessageResponse> sendMessage(_i2.Message? message,
          {bool? skipPush = false, bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(Invocation.method(#sendMessage, [message], {#skipPush: skipPush, #skipEnrichUrl: skipEnrichUrl}),
          returnValue: _i3.Future<_i2.SendMessageResponse>.value(
              _FakeSendMessageResponse_1(
                  this,
                  Invocation.method(#sendMessage, [
                    message
                  ], {
                    #skipPush: skipPush,
                    #skipEnrichUrl: skipEnrichUrl
                  })))) as _i3.Future<_i2.SendMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> updateMessage(_i2.Message? message,
          {bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(Invocation.method(#updateMessage, [message], {#skipEnrichUrl: skipEnrichUrl}),
          returnValue: _i3.Future<_i2.UpdateMessageResponse>.value(
              _FakeUpdateMessageResponse_2(
                  this,
                  Invocation.method(#updateMessage, [
                    message
                  ], {
                    #skipEnrichUrl: skipEnrichUrl
                  })))) as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> partialUpdateMessage(_i2.Message? message,
          {Map<String, Object?>? set,
          List<String>? unset,
          bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(Invocation.method(#partialUpdateMessage, [message], {#set: set, #unset: unset, #skipEnrichUrl: skipEnrichUrl}),
          returnValue: _i3.Future<_i2.UpdateMessageResponse>.value(_FakeUpdateMessageResponse_2(
              this,
              Invocation.method(#partialUpdateMessage, [
                message
              ], {
                #set: set,
                #unset: unset,
                #skipEnrichUrl: skipEnrichUrl
              })))) as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteMessage(_i2.Message? message,
          {bool? hard}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteMessage, [message], {#hard: hard}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(
                  #deleteMessage, [message], {#hard: hard})))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> pinMessage(_i2.Message? message,
          {Object? timeoutOrExpirationDate}) =>
      (super.noSuchMethod(Invocation.method(#pinMessage, [message], {#timeoutOrExpirationDate: timeoutOrExpirationDate}),
          returnValue: _i3.Future<_i2.UpdateMessageResponse>.value(
              _FakeUpdateMessageResponse_2(
                  this,
                  Invocation.method(#pinMessage, [
                    message
                  ], {
                    #timeoutOrExpirationDate: timeoutOrExpirationDate
                  })))) as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> unpinMessage(_i2.Message? message) =>
      (super.noSuchMethod(Invocation.method(#unpinMessage, [message]),
              returnValue: _i3.Future<_i2.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_2(
                      this, Invocation.method(#unpinMessage, [message]))))
          as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.SendFileResponse> sendFile(_i2.AttachmentFile? file,
          {_i2.ProgressCallback? onSendProgress,
          _i2.CancelToken? cancelToken,
          Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
          Invocation.method(#sendFile, [
            file
          ], {
            #onSendProgress: onSendProgress,
            #cancelToken: cancelToken,
            #extraData: extraData
          }),
          returnValue:
              _i3.Future<_i2.SendFileResponse>.value(_FakeSendFileResponse_4(
                  this,
                  Invocation.method(#sendFile, [
                    file
                  ], {
                    #onSendProgress: onSendProgress,
                    #cancelToken: cancelToken,
                    #extraData: extraData
                  })))) as _i3.Future<_i2.SendFileResponse>);
  @override
  _i3.Future<_i2.SendImageResponse> sendImage(_i2.AttachmentFile? file,
          {_i2.ProgressCallback? onSendProgress,
          _i2.CancelToken? cancelToken,
          Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
          Invocation.method(#sendImage, [
            file
          ], {
            #onSendProgress: onSendProgress,
            #cancelToken: cancelToken,
            #extraData: extraData
          }),
          returnValue:
              _i3.Future<_i2.SendImageResponse>.value(_FakeSendImageResponse_5(
                  this,
                  Invocation.method(#sendImage, [
                    file
                  ], {
                    #onSendProgress: onSendProgress,
                    #cancelToken: cancelToken,
                    #extraData: extraData
                  })))) as _i3.Future<_i2.SendImageResponse>);
  @override
  _i3.Future<_i2.SearchMessagesResponse> search(
          {String? query,
          _i2.Filter? messageFilters,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? paginationParams}) =>
      (super.noSuchMethod(
          Invocation.method(#search, [], {
            #query: query,
            #messageFilters: messageFilters,
            #sort: sort,
            #paginationParams: paginationParams
          }),
          returnValue: _i3.Future<_i2.SearchMessagesResponse>.value(
              _FakeSearchMessagesResponse_6(
                  this,
                  Invocation.method(#search, [], {
                    #query: query,
                    #messageFilters: messageFilters,
                    #sort: sort,
                    #paginationParams: paginationParams
                  })))) as _i3.Future<_i2.SearchMessagesResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteFile(String? url,
          {_i2.CancelToken? cancelToken, Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(Invocation.method(#deleteFile, [url], {#cancelToken: cancelToken, #extraData: extraData}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(#deleteFile, [
                url
              ], {
                #cancelToken: cancelToken,
                #extraData: extraData
              })))) as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteImage(String? url,
          {_i2.CancelToken? cancelToken, Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(Invocation.method(#deleteImage, [url], {#cancelToken: cancelToken, #extraData: extraData}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(#deleteImage, [
                url
              ], {
                #cancelToken: cancelToken,
                #extraData: extraData
              })))) as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> sendEvent(_i2.Event? event) =>
      (super.noSuchMethod(Invocation.method(#sendEvent, [event]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this, Invocation.method(#sendEvent, [event])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.SendReactionResponse> sendReaction(_i2.Message? message, String? type,
          {int? score = 1,
          Map<String, Object?>? extraData = const {},
          bool? enforceUnique = false}) =>
      (super.noSuchMethod(Invocation.method(#sendReaction, [message, type], {#score: score, #extraData: extraData, #enforceUnique: enforceUnique}),
          returnValue: _i3.Future<_i2.SendReactionResponse>.value(_FakeSendReactionResponse_7(
              this,
              Invocation.method(#sendReaction, [
                message,
                type
              ], {
                #score: score,
                #extraData: extraData,
                #enforceUnique: enforceUnique
              })))) as _i3.Future<_i2.SendReactionResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteReaction(
          _i2.Message? message, _i2.Reaction? reaction) =>
      (super.noSuchMethod(
          Invocation.method(#deleteReaction, [message, reaction]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(#deleteReaction, [message, reaction])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updateName(String? name) =>
      (super.noSuchMethod(Invocation.method(#updateName, [name]),
              returnValue: _i3.Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8(
                      this, Invocation.method(#updateName, [name]))))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updateImage(String? image) =>
      (super.noSuchMethod(Invocation.method(#updateImage, [image]),
              returnValue: _i3.Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8(
                      this, Invocation.method(#updateImage, [image]))))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.UpdateChannelResponse> update(
          Map<String, Object?>? channelData,
          [_i2.Message? updateMessage]) =>
      (super.noSuchMethod(
              Invocation.method(#update, [channelData, updateMessage]),
              returnValue: _i3.Future<_i2.UpdateChannelResponse>.value(
                  _FakeUpdateChannelResponse_9(this,
                      Invocation.method(#update, [channelData, updateMessage]))))
          as _i3.Future<_i2.UpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updatePartial(
          {Map<String, Object?>? set, List<String>? unset}) =>
      (super.noSuchMethod(
              Invocation.method(#updatePartial, [], {#set: set, #unset: unset}),
              returnValue: _i3.Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8(
                      this,
                      Invocation.method(
                          #updatePartial, [], {#set: set, #unset: unset}))))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> enableSlowMode(
          {int? cooldownInterval}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #enableSlowMode, [], {#cooldownInterval: cooldownInterval}),
              returnValue: _i3.Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8(this,
                      Invocation.method(#enableSlowMode, [], {#cooldownInterval: cooldownInterval}))))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> disableSlowMode() =>
      (super.noSuchMethod(Invocation.method(#disableSlowMode, []),
              returnValue: _i3.Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8(
                      this, Invocation.method(#disableSlowMode, []))))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
              returnValue: _i3.Future<_i2.EmptyResponse>.value(
                  _FakeEmptyResponse_3(this, Invocation.method(#delete, []))))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> truncate(
          {_i2.Message? message, bool? skipPush, DateTime? truncatedAt}) =>
      (super.noSuchMethod(Invocation.method(#truncate, [], {#message: message, #skipPush: skipPush, #truncatedAt: truncatedAt}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(#truncate, [], {
                #message: message,
                #skipPush: skipPush,
                #truncatedAt: truncatedAt
              })))) as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.AcceptInviteResponse> acceptInvite([_i2.Message? message]) =>
      (super.noSuchMethod(Invocation.method(#acceptInvite, [message]),
              returnValue: _i3.Future<_i2.AcceptInviteResponse>.value(
                  _FakeAcceptInviteResponse_10(
                      this, Invocation.method(#acceptInvite, [message]))))
          as _i3.Future<_i2.AcceptInviteResponse>);
  @override
  _i3.Future<_i2.RejectInviteResponse> rejectInvite([_i2.Message? message]) =>
      (super.noSuchMethod(Invocation.method(#rejectInvite, [message]),
              returnValue: _i3.Future<_i2.RejectInviteResponse>.value(
                  _FakeRejectInviteResponse_11(
                      this, Invocation.method(#rejectInvite, [message]))))
          as _i3.Future<_i2.RejectInviteResponse>);
  @override
  _i3.Future<_i2.AddMembersResponse> addMembers(List<String>? memberIds,
          [_i2.Message? message, bool? hideHistory = false]) =>
      (super.noSuchMethod(
              Invocation.method(#addMembers, [memberIds, message, hideHistory]),
              returnValue: _i3.Future<_i2.AddMembersResponse>.value(
                  _FakeAddMembersResponse_12(
                      this,
                      Invocation.method(
                          #addMembers, [memberIds, message, hideHistory]))))
          as _i3.Future<_i2.AddMembersResponse>);
  @override
  _i3.Future<_i2.InviteMembersResponse> inviteMembers(List<String>? memberIds,
          [_i2.Message? message]) =>
      (super.noSuchMethod(
              Invocation.method(#inviteMembers, [memberIds, message]),
              returnValue: _i3.Future<_i2.InviteMembersResponse>.value(
                  _FakeInviteMembersResponse_13(this,
                      Invocation.method(#inviteMembers, [memberIds, message]))))
          as _i3.Future<_i2.InviteMembersResponse>);
  @override
  _i3.Future<_i2.RemoveMembersResponse> removeMembers(List<String>? memberIds,
          [_i2.Message? message]) =>
      (super.noSuchMethod(
              Invocation.method(#removeMembers, [memberIds, message]),
              returnValue: _i3.Future<_i2.RemoveMembersResponse>.value(
                  _FakeRemoveMembersResponse_14(this,
                      Invocation.method(#removeMembers, [memberIds, message]))))
          as _i3.Future<_i2.RemoveMembersResponse>);
  @override
  _i3.Future<_i2.SendActionResponse> sendAction(
          _i2.Message? message, Map<String, dynamic>? formData) =>
      (super.noSuchMethod(Invocation.method(#sendAction, [message, formData]),
              returnValue: _i3.Future<_i2.SendActionResponse>.value(
                  _FakeSendActionResponse_15(this,
                      Invocation.method(#sendAction, [message, formData]))))
          as _i3.Future<_i2.SendActionResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> markRead({String? messageId}) => (super
      .noSuchMethod(Invocation.method(#markRead, [], {#messageId: messageId}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(
                  #markRead, [], {#messageId: messageId})))) as _i3
      .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.ChannelState> watch() =>
      (super.noSuchMethod(Invocation.method(#watch, []),
              returnValue: _i3.Future<_i2.ChannelState>.value(
                  _FakeChannelState_16(this, Invocation.method(#watch, []))))
          as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.EmptyResponse> stopWatching() => (super.noSuchMethod(
          Invocation.method(#stopWatching, []),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(
              _FakeEmptyResponse_3(this, Invocation.method(#stopWatching, []))))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.QueryRepliesResponse> getReplies(String? parentId,
          {_i2.PaginationParams? options, bool? preferOffline = false}) =>
      (super.noSuchMethod(Invocation.method(#getReplies, [parentId], {#options: options, #preferOffline: preferOffline}),
          returnValue: _i3.Future<_i2.QueryRepliesResponse>.value(_FakeQueryRepliesResponse_17(
              this,
              Invocation.method(#getReplies, [
                parentId
              ], {
                #options: options,
                #preferOffline: preferOffline
              })))) as _i3.Future<_i2.QueryRepliesResponse>);
  @override
  _i3.Future<_i2.QueryReactionsResponse> getReactions(String? messageId,
          {_i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(Invocation.method(#getReactions, [messageId], {#pagination: pagination}),
          returnValue: _i3.Future<_i2.QueryReactionsResponse>.value(
              _FakeQueryReactionsResponse_18(
                  this,
                  Invocation.method(#getReactions, [
                    messageId
                  ], {
                    #pagination: pagination
                  })))) as _i3.Future<_i2.QueryReactionsResponse>);
  @override
  _i3.Future<_i2.GetMessagesByIdResponse> getMessagesById(
          List<String>? messageIDs) =>
      (super.noSuchMethod(Invocation.method(#getMessagesById, [messageIDs]),
              returnValue: _i3.Future<_i2.GetMessagesByIdResponse>.value(
                  _FakeGetMessagesByIdResponse_19(
                      this, Invocation.method(#getMessagesById, [messageIDs]))))
          as _i3.Future<_i2.GetMessagesByIdResponse>);
  @override
  _i3.Future<_i2.TranslateMessageResponse> translateMessage(
          String? messageId, String? language) =>
      (super.noSuchMethod(
              Invocation.method(#translateMessage, [messageId, language]),
              returnValue: _i3.Future<_i2.TranslateMessageResponse>.value(
                  _FakeTranslateMessageResponse_20(
                      this,
                      Invocation.method(
                          #translateMessage, [messageId, language]))))
          as _i3.Future<_i2.TranslateMessageResponse>);
  @override
  _i3.Future<_i2.ChannelState> create() =>
      (super.noSuchMethod(Invocation.method(#create, []),
              returnValue: _i3.Future<_i2.ChannelState>.value(
                  _FakeChannelState_16(this, Invocation.method(#create, []))))
          as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.ChannelState> query(
          {bool? state = true,
          bool? watch = false,
          bool? presence = false,
          _i2.PaginationParams? messagesPagination,
          _i2.PaginationParams? membersPagination,
          _i2.PaginationParams? watchersPagination,
          bool? preferOffline = false}) =>
      (super.noSuchMethod(
          Invocation.method(#query, [], {
            #state: state,
            #watch: watch,
            #presence: presence,
            #messagesPagination: messagesPagination,
            #membersPagination: membersPagination,
            #watchersPagination: watchersPagination,
            #preferOffline: preferOffline
          }),
          returnValue: _i3.Future<_i2.ChannelState>.value(_FakeChannelState_16(
              this,
              Invocation.method(#query, [], {
                #state: state,
                #watch: watch,
                #presence: presence,
                #messagesPagination: messagesPagination,
                #membersPagination: membersPagination,
                #watchersPagination: watchersPagination,
                #preferOffline: preferOffline
              })))) as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.QueryMembersResponse> queryMembers(
          {_i2.Filter? filter,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(Invocation.method(#queryMembers, [], {#filter: filter, #sort: sort, #pagination: pagination}),
          returnValue: _i3.Future<_i2.QueryMembersResponse>.value(
              _FakeQueryMembersResponse_21(
                  this,
                  Invocation.method(#queryMembers, [], {
                    #filter: filter,
                    #sort: sort,
                    #pagination: pagination
                  })))) as _i3.Future<_i2.QueryMembersResponse>);
  @override
  _i3.Future<_i2.QueryBannedUsersResponse> queryBannedUsers(
          {_i2.Filter? filter,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(Invocation.method(#queryBannedUsers, [], {#filter: filter, #sort: sort, #pagination: pagination}),
          returnValue: _i3.Future<_i2.QueryBannedUsersResponse>.value(
              _FakeQueryBannedUsersResponse_22(
                  this,
                  Invocation.method(#queryBannedUsers, [], {
                    #filter: filter,
                    #sort: sort,
                    #pagination: pagination
                  })))) as _i3.Future<_i2.QueryBannedUsersResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> mute({Duration? expiration}) => (super
      .noSuchMethod(
          Invocation.method(#mute, [], {#expiration: expiration}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(#mute, [], {#expiration: expiration})))) as _i3
      .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> unmute() =>
      (super.noSuchMethod(Invocation.method(#unmute, []),
              returnValue: _i3.Future<_i2.EmptyResponse>.value(
                  _FakeEmptyResponse_3(this, Invocation.method(#unmute, []))))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> banMember(
          String? userID, Map<String, dynamic>? options) =>
      (super.noSuchMethod(Invocation.method(#banMember, [userID, options]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this, Invocation.method(#banMember, [userID, options])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> unbanMember(String? userID) =>
      (super.noSuchMethod(Invocation.method(#unbanMember, [userID]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this, Invocation.method(#unbanMember, [userID])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> shadowBan(
          String? userID, Map<String, dynamic>? options) =>
      (super.noSuchMethod(Invocation.method(#shadowBan, [userID, options]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this, Invocation.method(#shadowBan, [userID, options])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> removeShadowBan(String? userID) =>
      (super.noSuchMethod(Invocation.method(#removeShadowBan, [userID]),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this, Invocation.method(#removeShadowBan, [userID])))) as _i3
          .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> hide({bool? clearHistory = false}) => (super
      .noSuchMethod(Invocation.method(#hide, [], {#clearHistory: clearHistory}),
          returnValue: _i3.Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3(
              this,
              Invocation.method(
                  #hide, [], {#clearHistory: clearHistory})))) as _i3
      .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> show() =>
      (super.noSuchMethod(Invocation.method(#show, []),
              returnValue: _i3.Future<_i2.EmptyResponse>.value(
                  _FakeEmptyResponse_3(this, Invocation.method(#show, []))))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Stream<_i2.Event> on(
          [String? eventType,
          String? eventType2,
          String? eventType3,
          String? eventType4]) =>
      (super.noSuchMethod(
          Invocation.method(
              #on, [eventType, eventType2, eventType3, eventType4]),
          returnValue: _i3.Stream<_i2.Event>.empty()) as _i3.Stream<_i2.Event>);
  @override
  _i3.Future<void> keyStroke([String? parentId]) => (super.noSuchMethod(
      Invocation.method(#keyStroke, [parentId]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> startTyping([String? parentId]) => (super.noSuchMethod(
      Invocation.method(#startTyping, [parentId]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> stopTyping([String? parentId]) => (super.noSuchMethod(
      Invocation.method(#stopTyping, [parentId]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
