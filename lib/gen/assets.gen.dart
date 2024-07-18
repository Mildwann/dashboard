/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/SOS.png
  AssetGenImage get sos => const AssetGenImage('assets/images/SOS.png');

  /// File path: assets/images/billing.png
  AssetGenImage get billing => const AssetGenImage('assets/images/billing.png');

  /// File path: assets/images/calender.png
  AssetGenImage get calender =>
      const AssetGenImage('assets/images/calender.png');

  /// File path: assets/images/complete.png
  AssetGenImage get complete =>
      const AssetGenImage('assets/images/complete.png');

  /// File path: assets/images/document.png
  AssetGenImage get document =>
      const AssetGenImage('assets/images/document.png');

  /// File path: assets/images/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/images/edit.png');

  /// File path: assets/images/home.jpg
  AssetGenImage get home => const AssetGenImage('assets/images/home.jpg');

  /// File path: assets/images/ic_new.png
  AssetGenImage get icNew => const AssetGenImage('assets/images/ic_new.png');

  /// File path: assets/images/newnoback.png
  AssetGenImage get newnoback =>
      const AssetGenImage('assets/images/newnoback.png');

  /// File path: assets/images/provisoning.png
  AssetGenImage get provisoning =>
      const AssetGenImage('assets/images/provisoning.png');

  /// File path: assets/images/unnamed.jpg
  AssetGenImage get unnamed => const AssetGenImage('assets/images/unnamed.jpg');

  /// File path: assets/images/web.jpg
  AssetGenImage get web => const AssetGenImage('assets/images/web.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        sos,
        billing,
        calender,
        complete,
        document,
        edit,
        home,
        icNew,
        newnoback,
        provisoning,
        unnamed,
        web
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
