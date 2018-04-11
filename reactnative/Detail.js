import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableOpacity,
    NativeModules,
    NativeEventEmitter
  } from 'react-native';

  export default class Detail extends Component {
    render() {
        var contents = this.props["scores"].map(
          score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
          );
        return (
            <View style={styles.container}>
              <TouchableOpacity 
                
              >
                <Text style={styles.highScoresTitle}>
                   随便跳转界面
               </Text>
               </TouchableOpacity>
            </View>
          );
        }
  }
  const styles = StyleSheet.create({
    container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
    },
    highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    },
 
    });
  AppRegistry.registerComponent('ReactIOS', () => Detail);