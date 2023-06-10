part of '../main_page.dart';

class _LogoWidget extends StatefulWidget {
  final double height;
  const _LogoWidget({
    required this.height,
  });

  @override
  State<_LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<_LogoWidget> {
  late Completer<ui.Image> _completer;
  late Image _logoImage;

  @override
  void initState() {
    super.initState();
    _completer = Completer<ui.Image>();
    _logoImage = Image.asset(Assets.logo);
    _logoImage.image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener((info, _) => _completer.complete(info.image)),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _completer.future,
      builder: (context, snapshot) {
        final double imageHeight = snapshot.data?.height.ceilToDouble() ?? 0;
        logger.d('Real image height with white border: $imageHeight');
        return Container(
          height: max(imageHeight, widget.height),
          color: Colors.white,
          child: Center(
            child: LoaderWidget(
              isLoading: !snapshot.hasData,
              child: _logoImage,
            ),
          ),
        );
      },
    );
  }
}
