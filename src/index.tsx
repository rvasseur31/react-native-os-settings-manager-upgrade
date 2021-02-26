import { NativeModules } from 'react-native';

type OsSettingsManagerType = {
  multiply(a: number, b: number): Promise<number>;
};

const { OsSettingsManager } = NativeModules;

export default OsSettingsManager as OsSettingsManagerType;
