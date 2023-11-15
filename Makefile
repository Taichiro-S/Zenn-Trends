################################################################################################
## 基本コマンド
################################################################################################
# setup
.PHONY: setup
setup:
	dart pub global activate fvm
	fvm install
	npm install

# packages install
.PHONY: p-get
p-get:
	fvm flutter pub get

# packages upgrade
.PHONY: p-upgrade
p-upgrade:
	fvm flutter packages upgrade

# packages clean
.PHONY: p-clean
p-clean:
	fvm flutter clean

# code format
.PHONY: format
format:
	fvm flutter format lib/

# code analyze
.PHONY: analyze
analyze:
	fvm flutter analyze

# l10n generate
.PHONY: l10n
l10n:
	fvm flutter gen-l10n

# code generate
.PHONY: build-runner
build-runner:
	dart run build_runner build --delete-conflicting-outputs

# code generate watch
.PHONY: build-runner-watch
build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs

# run test
.PHONY: test
test:
	fvm flutter test


################################################################################################
## 実行・ビルド
################################################################################################
# run dev
.PHONY: run-dev
run-dev:
	fvm flutter run --target lib/main.dart

# run dev (with Device Preview)
.PHONY: run-dev-preview
run-dev-preview:
	fvm flutter run --target lib/main.dart

# run prod
.PHONY: run-prod
run-prod:
	fvm flutter run --release --target lib/main.dart

# build APK dev
.PHONY: build-android-dev
build-android-dev:
	fvm flutter build apk --target lib/main.dart

# build APK prod
.PHONY: build-android-prod
build-android-prod:
	fvm flutter build apk --release --target lib/main.dart

# build IOS dev
.PHONY: build-ios-dev
build-ios-dev:
	fvm flutter build ios --target lib/main.dart

# build IOS prod
.PHONY: build-ios-prod
build-ios-prod:
	fvm flutter build ios --release --target lib/main.dart