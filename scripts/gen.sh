#!/bin/bash

# Exit on error
set -e

# Flutter path (using the one identified in user rules)
FLUTTER="/Users/sanjaysinghbisht/Desktop/workspace/flutterprojects/fluttersdk/flutter-3.39.0/bin/flutter"

case "$1" in
    "clean")
        echo "🧹 Cleaning project..."
        $FLUTTER clean
        $FLUTTER pub get
        ;;
    "l10n")
        echo "🌐 Generating localization files..."
        $FLUTTER gen-l10n
        ;;
    "build")
        echo "🏗️ Building files (Freezed, JSON, etc.)..."
        $FLUTTER pub run build_runner build --delete-conflicting-outputs
        ;;
    "watch")
        echo "👀 Watching for changes..."
        $FLUTTER pub run build_runner watch --delete-conflicting-outputs
        ;;
    "repair")
        echo "🛠️ Repairing dependencies..."
        $FLUTTER pub cache repair
        $FLUTTER pub get
        ;;
    "all")
        echo "🚀 Running complete generation flow..."
        $FLUTTER clean
        $FLUTTER pub get
        $FLUTTER gen-l10n
        $FLUTTER pub run build_runner build --delete-conflicting-outputs
        ;;
    *)
        echo "Usage: ./scripts/gen.sh {clean|l10n|build|watch|repair|all}"
        exit 1
        ;;
esac

echo "✅ Done!"
