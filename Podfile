

platform :ios, ‘9.0’

target 'React-IOS' do
  pod 'yoga', :path => './reactnative/node_modules/react-native/ReactCommon/yoga'
  pod 'React', :path => './reactnative/node_modules/react-native', :subspecs => [
    'Core',
    'RCTImage',
    'RCTNetwork',
    'RCTText',
    'RCTWebSocket',
    'CxxBridge', # 如果RN版本 >= 0.45则加入此行
    'DevSupport', # 如果RN版本 >= 0.43，则需要加入此行才能开启开发者菜单
    #'BatchedBridge',
     # 添加你的项目中需要的其他三方库
  ]
  # 如果RN版本 >= 0.45则加入下面三个第三方编译依赖
  pod 'DoubleConversion', :podspec => './reactnative/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => './reactnative/node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'Folly', :podspec => './reactnative/node_modules/react-native/third-party-podspecs/Folly.podspec'



end
