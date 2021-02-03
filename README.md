
# react-native-survicate

## Getting started

`$ npm install react-native-survicate --save`

### Mostly automatic installation

`$ react-native link react-native-survicate`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-survicate` and add `RNReactNativeSurvicate.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNReactNativeSurvicate.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNReactNativeSurvicatePackage;` to the imports at the top of the file
  - Add `new RNReactNativeSurvicatePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-react-native-survicate'
  	project(':react-native-react-native-survicate').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-react-native-survicate/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-react-native-survicate')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNReactNativeSurvicate.sln` in `node_modules/react-native-react-native-survicate/windows/RNReactNativeSurvicate.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using React.Native.Survicate.RNReactNativeSurvicate;` to the usings at the top of the file
  - Add `new RNReactNativeSurvicatePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNReactNativeSurvicate from 'react-native-react-native-survicate';

// TODO: What to do with the module?
RNReactNativeSurvicate;
```
  