# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Updated `smisdk-android-plugin/build.gradle` to use `api` instead of `implementation` for the SMISDK dependency
  - This change exposes the Datami SDK classes (`SmiSdk`, `SmiResult`, `SdStateChangeListener`) transitively to consuming apps
  - Previously, apps had to add a direct dependency on the SMISDK or couldn't access these classes in their MainApplication
- Updated `compileSdkVersion` default to 36 (Android 16)
- Updated `targetSdkVersion` default to 36 (Google Play requirement for August 2026)
- Updated `minSdkVersion` default to 24 (Android 7.0)
- Added `buildFeatures.buildConfig = true` to support newer Android Gradle Plugin versions
- Added `namespace` declaration for Android Gradle Plugin 8.x compatibility
- Added publishing configuration for library distribution

### Fixed

- Fixed dependency resolution issue where `com.datami.smi.*` classes were not visible to the app module
- Apps can now properly implement `SdStateChangeListener` in their MainApplication

### Compatibility

- Tested with React Native 0.81.5
- Tested with Expo SDK 54
- Tested with Kotlin 2.1.20
- Compatible with Android Gradle Plugin 8.x
- Requires Legacy Architecture (New Architecture not yet supported)

---

## [1.2.7] - Previous Release

### Notes

- Original version with `implementation` dependency scope
- Required React Native 0.72.0
- Used older Android SDK versions (compileSdk 33, targetSdk 33)
