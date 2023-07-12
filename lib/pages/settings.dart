import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/mhu_flutter_commons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pizza_flutter/main.dart';
import 'package:pizza_flutter/pages/help.dart';
import 'package:pizza_flutter/store.dart';

final packageInfo = PackageInfo.fromPlatform();

class SettingsPage extends StatelessWidget {
  final PizzaValueStore store;

  const SettingsPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Sizes'),
            trailing: IconTheme(
              data: IconTheme.of(context),
              child: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              SizesPage.show(
                context: context,
                store: store,
              );
            },
          ),
          ListTile(
            title: const Text('About'),
            trailing: IconTheme(
              data: IconTheme.of(context),
              child: const Icon(Icons.info),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return FutureBuilder(
                    future: packageInfo,
                    builder: (context, snapshot) {
                      return AboutDialog(
                        applicationName: appTitle,
                        applicationVersion: snapshot.data?.let(
                          (e) => e.version,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Help'),
            trailing: IconTheme(
              data: IconTheme.of(context),
              child: const Icon(Icons.help),
            ),
            onTap: () {
              showHelp(context);
            },
          )
        ],
      ),
    );
  }
}

class SizesPage extends StatelessWidget {
  static void show({
    required BuildContext context,
    required PizzaValueStore store,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SizesPage(store: store),
      ),
    );
  }

  final PizzaValueStore store;

  const SizesPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sizes'),
      ),
      body: RxBuilder(
        rxVal: store.map((s) => s.sizes.entries.sortedBy((e) => e.value)),
        builder: (context, entries) {
          return ListView(
            children: [
              ...entries.map(
                (e) {
                  void edit() {
                    showEditStringDialog(
                      context: context,
                      title: const Text('Edit Size'),
                      initial: e.value,
                      callback: (newSizeName) {
                        store.update((value) {
                          return value.copyWith(
                            sizes: Map.of(value.sizes)..[e.key] = newSizeName,
                          );
                        });
                      },
                    );
                  }

                  return ListTile(
                    key: ValueKey(e.key),
                    title: Text(e.value),
                    trailing: IconTheme(
                      data: IconTheme.of(context),
                      child: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              showConfirmDialog(
                                context: context,
                                title: Text('Delete size: ${e.value}'),
                                callback: () {
                                  store.update(
                                    (value) => value.copyWith(
                                      sizes: Map.of(value.sizes)..remove(e.key),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: edit,
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                    onTap: edit,
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                showEditStringDialog(
                  context: context,
                  title: const Text('Add Size'),
                  callback: (newSizeName) {
                    store.update((value) {
                      final id = value.sizeSeq + 1;

                      return value.copyWith(
                        sizeSeq: id,
                        sizes: Map.of(value.sizes)..[id] = newSizeName,
                      );
                    });
                  },
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
