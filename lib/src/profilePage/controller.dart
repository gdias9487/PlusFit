import 'package:flutter/material.dart';

class Reloader<T> extends StatefulWidget {
  final Future<T> Function() loader;
  final Widget Function(BuildContext context, T data) dataBuilder;
  final Widget Function(BuildContext context, dynamic error) errorBuilder;

  const Reloader({
    Key key,
    this.loader,
    this.dataBuilder,
    this.errorBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReloaderState<T>();

  static of(BuildContext context) => context.findAncestorStateOfType();
}

class ReloaderState<T> extends State<Reloader<T>> {
  bool isLoading = false;
  T data;
  dynamic error;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    setState(() {
      isLoading = true;
      data = null;
      error = null;
    });
    try {
      data = await widget.loader();
    } catch (error) {
      this.error = error;
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return (data != null)
        ? widget.dataBuilder(context, data)
        : widget.errorBuilder(context, error);
  }
}
