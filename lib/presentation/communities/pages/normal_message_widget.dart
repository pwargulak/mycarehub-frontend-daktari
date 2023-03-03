import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/media_item_widget.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/normal_message_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/models/message.dart';

class NormalMessageWidget extends StatelessWidget {
  const NormalMessageWidget({
    super.key,
    required this.message,
    required this.isUserSent,
    required this.roomID,
  });

  final Message? message;
  final bool isUserSent;
  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String sender = message?.sender?.split(':').first ?? '';
    final String formattedSender = sender.split('@').last;
    final String timeStamp = formatTimestamp(message?.timeStamp);

    final Widget formattedSenderWidget = !isUserSent
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              formattedSender,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          )
        : const SizedBox();

    final String msgType = message?.content?.msgType ?? UNKNOWN;

    switch (msgType) {
      case MatrixMessageTypes.text:
        return NormalMessageItem(
          isUserSent: isUserSent,
          senderWidget: formattedSenderWidget,
          timestamp: timeStamp,
          messageBody: message?.content?.body,
          roomID: roomID,
          eventID: message?.eventID ?? '',
          senderID: message?.sender ?? '',
        );

      case MatrixMessageTypes.image:
        final String imageUrl = message?.content?.url ?? '';

        return MediaItem(
          isUserSent: isUserSent,
          sender: formattedSenderWidget,
          timestamp: timeStamp,
          url: imageUrl,
        );
      default:
        return const SizedBox();
    }
  }
}
