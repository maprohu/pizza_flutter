import 'dart:io';

import 'package:mhu_dart_commons/io.dart';

final cwd = Directory.current;
final githubPagesDir = cwd.parent.dir('maprohu.github.io');
const baseName = 'pizza_flutter';

final baseDir = githubPagesDir.dir(baseName);
final outDir = cwd.dirTo(['build', 'web']);

void main() async {

  assert(await baseDir.exists());

  await cwd.run(
    'flutter',
    [
      'clean',
    ],
  );
  assert(!await outDir.exists());

  await cwd.run(
    'flutter',
    [
      'build',
      'web',
      '--base-href',
      '/$baseName/',
    ],
  );
  assert(await outDir.exists());

  await baseDir.delete(recursive: true);

  await outDir.rename(baseDir.path);

  await baseDir.run(
    'git',
    [
      'status',
    ],
  );
  await baseDir.run(
    'git',
    [
      'add',
      '-A',
    ],
  );
  await baseDir.run(
    'git',
    [
      'commit',
      '-a',
      '-m',
      'publishing: $baseName',
    ],
  );
  await baseDir.run(
    'git',
    [
      'push',
    ],
  );

  stdout.writeln("https://maprohu.github.io/$baseName/");
}
