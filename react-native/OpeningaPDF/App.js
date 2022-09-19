/**
 * @format
 * @flow strict-local
 */

import React from 'react';
import Pdf from 'react-native-pdf';
import {Dimensions, StyleSheet, View, Button, Platform} from 'react-native';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const DOCUMENT =
  Platform.OS === 'ios'
    ? require('./Document.pdf')
    : {uri: 'bundle-assets://Document.pdf'};

console.log('DOCUMENT', DOCUMENT);
const PdfScreen = ({navigation}) => {
  return <Pdf source={DOCUMENT} style={styles.pdf} />;
};

const HomeScreen = ({navigation}) => {
  return (
    <View style={styles.container}>
      <Button onPress={() => navigation.navigate('Pdf')} title="Open PDF" />
    </View>
  );
};

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{title: 'Home'}}
        />
        <Stack.Screen
          name="Pdf"
          component={PdfScreen}
          options={{title: 'PDF'}}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  pdf: {
    flex: 1,
    width: Dimensions.get('window').width,
  },
});
