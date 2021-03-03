import * as React from 'react';

import { View, Text, Button } from 'react-native';
import RNOsSettingsManager from 'react-native-os-settings-manager';
import { styles } from './App.styles';


export default function App() {
  const [areNotificationEnabled, setAreNotificationEnabled] = React.useState<Boolean | undefined>();

  React.useEffect(() => {
    RNOsSettingsManager.areNotificationsEnabled().then(setAreNotificationEnabled)
  }, []);

  return (
    <View style={styles.container}>
      <Text>AreNotificationEnabled : {areNotificationEnabled?.toString()}</Text>
      <Button
        onPress={() => {
            RNOsSettingsManager.openAppSettings(true)
        }}
        title="Ouvrir dans les parmètres"/>
    </View>
  );
}
