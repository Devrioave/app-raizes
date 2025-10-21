import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raizes/app/components/raizes_drawer.dart';

class RaizesScaffold extends StatefulWidget {
  final Widget? bottomNavigationBar;
  const RaizesScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actionsBuilder,
    this.bottomNavigationBar,
    this.endDrawer,
  }) : super(key: key);

//   @override
//   _RaizesScaffoldState createState() => _RaizesScaffoldState();
// }

// class _RaizesScaffoldState extends State<RaizesScaffold> {

  final Widget title;
  final Widget body;
  final Widget? endDrawer;
  final List<Widget> Function()? actionsBuilder;

  @override
  State<RaizesScaffold> createState() => _RaizesScaffoldState();
}

class _RaizesScaffoldState extends State<RaizesScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nestedScaffoldkey = GlobalKey<ScaffoldState>();
    bool isTimerRunning = false;
    _showToast() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: const Text("Deseja realmente sair?"),
            actions: <Widget>[
              TextButton(
                child: const Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Fechar programa"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    isTimerRunning = false;
                  });
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        },
      );
    }

    void _handlePop() {
      if (!isTimerRunning) {
        _showToast();
      }
    }

    return PopScope(
      canPop: isTimerRunning,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) {
          _handlePop();
        }
      },
      child: Scaffold(
        bottomNavigationBar: widget.bottomNavigationBar,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: widget.title,
          leading: IconButton(
            onPressed: () {
              if (nestedScaffoldkey.currentState == null) return;
              if (!nestedScaffoldkey.currentState!.isDrawerOpen) {
                nestedScaffoldkey.currentState?.openDrawer();
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.menu),
          ),
          actions: widget.actionsBuilder?.call(),
        ),
        body: Scaffold(
          key: nestedScaffoldkey,
          drawerScrimColor: Colors.black12,
          body: widget.body,
          drawer: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: RaizesDrawer(token: null),
          ),
        ),
        endDrawer: widget.endDrawer != null
            ? BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: widget.endDrawer,
              )
            : null,
      ),
    );
  }
}
