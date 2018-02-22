# Opening a PDF in React Native

**Tutorial:** https://pspdfkit.com/blog/2018/opening-a-pdf-in-react-native

## Instructions

### iOS

1. Add `PSPDFKit.framework` and `PSPDFKitUI.framework` to `iOS/PSPDFKit`.
2. Insert your license key in [`App.js`](App.js) (look for `INSERT_YOUR_LICENSE_KEY_HERE`).
3. Install dependencies with `yarn`.
4. Start the app with `react-native run-ios`.

### Android

1. Insert your Maven license key in [`android/build.gradle`](android/build.gradle) (look for `YOUR_MAVEN_KEY_GOES_HERE`).
2. Insert your license key in [`android/app/src/main/AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml) (look for `YOUR_LICENSE_KEY_GOES_HERE`).
3. Install dependencies with `yarn`.
4. Start the app with `react-native run-android`.
