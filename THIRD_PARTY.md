# Third-party components

Pandoo is MIT licensed. Every dependency and bundled asset below is
distributed under a license that is compatible with MIT: permissive
(MIT, BSD, Apache-2.0) or a font license (OFL-1.1) that allows bundling.
No copyleft runtime dependency is used.

Versions match `pubspec.lock`. Regenerate this table when the lockfile
changes.

## Bundled assets

| Component | Version | License |
|---|---|---|
| Inter font family | 4.0 | OFL-1.1 (see `LICENSES/OFL-1.1.txt`) |
| Pandoo icons, splash art and banner | - | CC BY 4.0 (see `ASSETS-LICENSE.md`) |

## Flutter SDK

| Component | License |
|---|---|
| Flutter, flutter_test, flutter_localizations, flutter_web_plugins | BSD-3-Clause |

## Dart and Flutter packages

| Package | Version | License |
|---|---|---|
| _fe_analyzer_shared | 103.0.0 | BSD-3-Clause |
| analyzer | 13.3.0 | BSD-3-Clause |
| ansicolor | 2.0.3 | Apache-2.0 |
| archive | 4.0.9 | MIT |
| args | 2.7.0 | BSD-3-Clause |
| async | 2.13.1 | BSD-3-Clause |
| awesome_snackbar_content | 0.1.8 | MIT |
| boolean_selector | 2.1.2 | BSD-3-Clause |
| build | 4.0.7 | BSD-3-Clause |
| built_collection | 5.1.1 | BSD-3-Clause |
| built_value | 8.12.6 | BSD-3-Clause |
| characters | 1.4.1 | BSD-3-Clause |
| checked_yaml | 2.0.4 | BSD-3-Clause |
| cli_util | 0.4.2 | BSD-3-Clause |
| clock | 1.1.2 | Apache-2.0 |
| code_assets | 1.2.1 | BSD-3-Clause |
| code_builder | 4.11.1 | BSD-3-Clause |
| collection | 1.19.1 | BSD-3-Clause |
| convert | 3.1.2 | BSD-3-Clause |
| crypto | 3.0.7 | BSD-3-Clause |
| csslib | 1.0.2 | BSD-3-Clause |
| dart_style | 3.1.9 | BSD-3-Clause |
| fake_async | 1.3.3 | Apache-2.0 |
| ffi | 2.2.0 | BSD-3-Clause |
| file | 7.0.1 | BSD-3-Clause |
| fixnum | 1.1.1 | BSD-3-Clause |
| flutter_launcher_icons | 0.14.4 | MIT |
| flutter_native_splash | 2.4.8 | MIT |
| flutter_svg | 2.3.0 | MIT |
| glob | 2.1.3 | BSD-3-Clause |
| hive | 2.2.3 | Apache-2.0 |
| hive_flutter | 1.1.0 | Apache-2.0 |
| hooks | 2.0.2 | BSD-3-Clause |
| html | 0.15.6 | MIT |
| http | 1.6.0 | BSD-3-Clause |
| http_parser | 4.1.2 | BSD-3-Clause |
| image | 4.9.1 | MIT |
| intl | 0.20.3 | BSD-3-Clause |
| jni | 1.0.3 | BSD-3-Clause |
| jni_flutter | 1.0.2 | BSD-3-Clause |
| jni_util | 1.0.0 | BSD-3-Clause |
| json_annotation | 4.12.0 | BSD-3-Clause |
| leak_tracker | 11.0.2 | BSD-3-Clause |
| leak_tracker_flutter_testing | 3.0.10 | BSD-3-Clause |
| leak_tracker_testing | 3.0.2 | BSD-3-Clause |
| logging | 1.3.0 | BSD-3-Clause |
| matcher | 0.12.20 | BSD-3-Clause |
| material_color_utilities | 0.13.0 | Apache-2.0 |
| meta | 1.19.0 | BSD-3-Clause |
| mockito | 5.8.1 | Apache-2.0 |
| objective_c | 9.5.0 | BSD-3-Clause |
| package_config | 2.2.0 | BSD-3-Clause |
| path | 1.9.1 | BSD-3-Clause |
| path_parsing | 1.1.0 | MIT |
| path_provider | 2.1.6 | BSD-3-Clause |
| path_provider_android | 2.3.1 | BSD-3-Clause |
| path_provider_foundation | 2.6.0 | BSD-3-Clause |
| path_provider_linux | 2.2.2 | BSD-3-Clause |
| path_provider_platform_interface | 2.1.3 | BSD-3-Clause |
| path_provider_windows | 2.3.0 | BSD-3-Clause |
| petitparser | 7.0.2 | MIT |
| platform | 3.1.6 | BSD-3-Clause |
| plugin_platform_interface | 2.1.8 | BSD-3-Clause |
| posix | 6.5.2 | MIT |
| pub_semver | 2.2.0 | BSD-3-Clause |
| record_use | 0.6.0 | BSD-3-Clause |
| sky_engine | 0.0.0 | BSD-3-Clause |
| source_gen | 4.2.4 | BSD-3-Clause |
| source_span | 1.10.2 | BSD-3-Clause |
| stack_trace | 1.12.1 | BSD-3-Clause |
| stream_channel | 2.1.4 | BSD-3-Clause |
| string_scanner | 1.4.1 | BSD-3-Clause |
| term_glyph | 1.2.2 | BSD-3-Clause |
| test_api | 0.7.12 | BSD-3-Clause |
| typed_data | 1.4.0 | BSD-3-Clause |
| universal_io | 2.3.1 | Apache-2.0 |
| vector_graphics | 1.2.3 | BSD-3-Clause |
| vector_graphics_codec | 1.1.13 | BSD-3-Clause |
| vector_graphics_compiler | 1.3.0 | BSD-3-Clause |
| vector_math | 2.4.2 | BSD-3-Clause |
| very_good_analysis | 11.0.0 | MIT |
| vm_service | 15.2.0 | BSD-3-Clause |
| watcher | 1.2.1 | BSD-3-Clause |
| web | 1.1.1 | BSD-3-Clause |
| xdg_directories | 1.1.0 | BSD-3-Clause |
| xml | 7.0.1 | MIT |
| yaml | 3.1.3 | MIT |

## Updating this file

After `flutter pub get`, list the resolved packages from `pubspec.lock` and
check each package license. A dependency that is GPL, AGPL or otherwise
incompatible with MIT must not be added.
