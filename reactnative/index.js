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
  
  var RNModels = NativeModules.RTCModel;
  const NativeModule = new NativeEventEmitter(RNModels);
export default class ReactIOS extends Component {
  componentDidMount(){
    
    //用获取的模块创建监听器
    NativeModule.addListener('EventReminder',(data)=>{
      console.log('收到:---'+data.content)
      
    })
    
  }
  componentWillUnmount(){
    this.NativeModule.remove();
}
    render() {
      var contents = this.props["scores"].map(
        score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
        );
      return (
          <View style={styles.container}>
            <TouchableOpacity 
              onPress = {()=>RNModels.RNOpenOneVC('RN跳转原生')}
            >
              <Text style={styles.highScoresTitle}>
                 My High Scores!
             </Text>
             </TouchableOpacity>
             <TouchableOpacity 
              onPress = {()=>RNModels.ToScoreVC('ios和RN交互，需要在model里面创建不同的方法，RN根据model里面的方法传递数据，iOS在去通知相应的vc')}
            >
             <Text style={styles.scores}>
                 {contents}
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
    scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
    },
    });
  AppRegistry.registerComponent('ReactIOS', () => ReactIOS);
