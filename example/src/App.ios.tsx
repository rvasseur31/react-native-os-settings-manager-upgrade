import * as React from 'react';

import { View, Text, Button } from 'react-native';
import RNOsSettingsManager from 'react-native-os-settings-manager';
import { styles } from './App.styles';


export default function App() {
  const [areNotificationEnabled, setAreNotificationEnabled] = React.useState<{
    badge: Number,
    alert: Number,
    sound: Number
}| undefined | {}>();

  React.useEffect(() => {
    RNOsSettingsManager.areNotificationsEnabled().then(setAreNotificationEnabled)
  }, []);

  return (
    <View style={styles.container}>
      <Text>Notification : {JSON.stringify(areNotificationEnabled)}</Text>
      <Button
        onPress={() => {
            RNOsSettingsManager.openAppSettings()
        }}
        title="Ouvrir dans les parmètres"/>
        <Button
        onPress={() => {
          RNOsSettingsManager.setNotificationBadge(10);
        }}
        title="Ajouter le badge de notification"/>
    </View>
  );
}
