import { Settings as LayoutSettings } from '@ant-design/pro-layout';

const Settings: LayoutSettings & {
  pwa?: boolean;
  logo?: string;
} = {
  navTheme: 'light',
  primaryColor: '#1890ff',
  layout: 'side',
  contentWidth: 'Fluid',
  fixedHeader: false,
  fixSiderbar: true,
  pwa: false,
  logo: '/logo.svg',
  title: 'PHengLEI ATP',
  iconfontUrl: '//at.alicdn.com/t/font_2678397_niqkd3j7udk.js',
  headerHeight: 48,
  splitMenus: false,
  headerRender: false,
  footerRender: false,
};

export default Settings;
