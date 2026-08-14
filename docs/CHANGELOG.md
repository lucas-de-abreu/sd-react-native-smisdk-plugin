# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.11] - 2026-08-14

### Changed

- **Breaking:** Migrated from `smisdk` to `vpnsdk` for sponsored data functionality
  - Android: Now uses `com.datami:vpnsdk` instead of `com.datami:smisdk`
  - iOS: Now uses `libsmisdkvpn.a` instead of `libsmisdk.a`
- **Breaking:** Updated `SmiSdkReactModule.java` to use `SmiVpnSdk` class instead of `SmiSdk`
  - `startSponsoredData()` and `stopSponsoredData()` now call `SmiVpnSdk` methods
  - `updateUserId()` and `updateUserTag()` now use `SmiVpnSdk` methods
- iOS `RnSmiSdk.m` simplified to use VPN-specific methods:
  - `startSponsorVpn` / `stopSponsorVpn` instead of `startSponsorData` / `stopSponsorData`
- Updated `smisdk_integration.js`:
  - Added support for Kotlin (`.kt`) files in addition to Java
  - Uses `SmiVpnSdk.initSponsoredData()` for initialization
  - Changed string resource config to use `smisdk_start_vpn` and `smisdk_controlled_vpn`
  - Updated XML parsing from deprecated `xmldom` to `@xmldom/xmldom`
- Updated podspec to enable `VPN_API=1` preprocessor definition

### Added

- New Android native methods:
  - `getCurrentSdState()` - Returns current sponsored data state
  - `initSponsoredData()` - Initialize from JavaScript side
  - `isVpnPermissionAccepted()` - Check if VPN permission was accepted
- Added `FOREGROUND_SERVICE` permission to AndroidManifest.xml
- Added `org.apache.http.legacy` uses-library for Android compatibility
- Added new dependencies: `glob`, `xmldoc`, `sax`, `@xmldom/xmldom`

### Removed

- Deprecated Android methods removed:
  - `getSDAuth()` - URL-based authentication method
  - `getAnalytics()` - Analytics retrieval method
- iOS methods removed:
  - `sampleMethod`, `getSDURL`, `getAnalytics`, `registerAppConfiguration`

### Migration Guide

Apps using this plugin need to update their `MainApplication`:

**Kotlin:**

```kotlin
// Change imports
import com.datami.smi.SmiVpnSdk
import com.datami.smi.internal.MessagingType

// In onCreate()
val dmiUserMessaging = resources.getBoolean(R.bool.smisdk_show_messaging)
val dmiStartVpn = resources.getBoolean(R.bool.smisdk_start_vpn)
val dmiControlledVpn = resources.getBoolean(R.bool.smisdk_controlled_vpn)

var dmiMessaging = MessagingType.NONE
if (dmiUserMessaging) {
    dmiMessaging = MessagingType.BOTH
}

SmiVpnSdk.initSponsoredData(
    resources.getString(R.string.smisdk_apikey),
    this,
    R.mipmap.ic_launcher,
    dmiMessaging,
    dmiStartVpn,
    0,
    dmiControlledVpn
)
```

**strings.xml:** Add the new VPN config values:

```xml
<bool name="smisdk_start_vpn">true</bool>
<bool name="smisdk_controlled_vpn">false</bool>
```

---

## [1.2.8] - Previous Release

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
