// Copyright 2019 InWay.pro Open Source code. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

/// Android sound kind.
///
/// Valid values are 1-3, as specified in [AndroidSounds].
///
/// See also:
///
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
///  * [AndroidSounds]
class AndroidSound {
  final int value;

  const AndroidSound(int value)
      : assert(value >= 1),
        assert(value <= 3),
        value = value;
}

/// Default [AndroidSound] values.
class AndroidSounds {
  AndroidSounds._();

  /// System default alarm sound
  static const AndroidSound alarm = AndroidSound(3);

  /// System default notification sound
  static const AndroidSound notification = AndroidSound(3);

  /// System default ringtone sound
  static const AndroidSound ringtone = AndroidSound(3);
}
