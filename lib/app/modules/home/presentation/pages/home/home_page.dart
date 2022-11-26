import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: widget.controller.txtSearch,
          onSubmitted: widget.controller.search,
        ),
      ),
      body: AnimatedBuilder(
          animation: widget.controller.store,
          builder: (context, child) {
            if (widget.controller.store.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.controller.store.listPeople.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            widget.controller.store.listPeople[index].fullName),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
