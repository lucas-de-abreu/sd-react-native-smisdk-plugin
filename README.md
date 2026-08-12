# Datami SMISDK React Native Plugin

A React Native plugin for integrating **Datami Sponsored Data SDK** into mobile applications. This plugin enables sponsored/zero-rated mobile data functionality, allowing users to access app content without consuming their mobile data plan on supported carriers.

## What is Sponsored Data?

Sponsored Data (also known as zero-rating) allows mobile app publishers to pay for their users' data consumption. When enabled, users can access the app's content without it counting against their mobile data plan, provided they are on a supported carrier network.

## Features

- **Sponsored Data Authentication** - Verify if the user is eligible for sponsored data on their current network
- **Real-time State Changes** - Listen for network and sponsored data state changes
- **Analytics** - Track cellular/WiFi session time and sponsored data usage
- **User Identification** - Associate user IDs and tags for analytics and targeting

## Supported Platforms

- Android (via native SMISDK)
- iOS (via native SMISDK)

## Documentation

See the `docs/` folder for detailed documentation:

- [Changelog](docs/CHANGELOG.md) - Version history and changes

## Requirements

- React Native >= 0.72.0
- Android: minSdkVersion 24, targetSdkVersion 36
- iOS: iOS 12.0+
