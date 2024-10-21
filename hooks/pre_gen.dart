import 'package:mason/mason.dart';
import 'dart:io'

void run(HookContext context) {
  final bool isGlobal = context.vars['is_global'] as bool;

  // Determine the output directory based on whether it's global
  String outputDirectory;

  if (isGlobal) {
    context.vars['is_with_page'] = false;
    context.vars['is_with_widget'] = false;
    context.logger.info('Global mode enabled: skipping page and widget generation.');
    outputDirectory = 'shared/global_features';
  } else {
    outputDirectory = 'features';
  }

  // Create the output directory if it doesn't exist
  final outputDir = Directory(outputDirectory);
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  // Print info to the console
  context.logger.info('Generating files in: $outputDirectory');

  // Set the output directory for mason
  context.vars['output_directory'] = outputDirectory;

}
