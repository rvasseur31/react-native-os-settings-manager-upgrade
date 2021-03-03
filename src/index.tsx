import { NativeModules } from 'react-native';

type RNOsSettingsManagerType = {
  areNotificationsEnabled(): Promise<any>;
  openAppSettings(openAsNewTask: boolean): void;
  openAppSettings(): void;
  setNotificationBadge(notificationNumber: Number): void;
};

const { RNOsSettingsManager } = NativeModules;

export default RNOsSettingsManager as RNOsSettingsManagerType;
