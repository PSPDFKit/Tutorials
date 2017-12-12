/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  NativeModules,
  Platform,
  StyleSheet,
  Dimensions,
  Button,
  View
} from 'react-native';
import { StackNavigator } from 'react-navigation';
import Pdf from 'react-native-pdf';

var PSPDFKit = NativeModules.PSPDFKit;

if (Platform.OS === 'ios') {
  PSPDFKit.setLicenseKey('INSERT_YOUR_LICENSE_KEY_HERE');
}

const DOCUMENT = Platform.OS === 'ios' ? 'document.pdf' : "file:///sdcard/document.pdf";

// Simple screen containing a "Open PDF" button
class HomeScreen extends Component {
  _presentPSPDFKit() {
    PSPDFKit.present(DOCUMENT, {
        pageTransition: 'scrollContinuous',
        scrollDirection: 'vertical',
        documentLabelEnabled: true,
      })
  }

  static navigationOptions = {
    title: 'Home'
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View style={styles.container}>
        <Button
          onPress={() => navigate('Pdf')}
          title='Open PDF with react-native-pdf'
        />
        <Button
          onPress={this._presentPSPDFKit}
          title='Open PDF with PSPDFKit'
        />
      </View>
    );
  }
}

// Screen that shows the contents of a PDF
class PdfScreen extends Component {
  static navigationOptions = {
    title: 'PDF'
  };

  render() {
    const source = require('./document.pdf');

    return <Pdf
              source={source}
              style={styles.pdf}
            />;
  }
}

const PdfApp = StackNavigator({
  Home: { screen: HomeScreen },
  Pdf: { screen: PdfScreen }
});

export default class App extends Component<{}> {
  render() {
    return <PdfApp />;  
  }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    pdf: {
        flex: 1,
        width: Dimensions.get('window').width,
    }
});
