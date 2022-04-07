import { defineConfig } from 'umi';
const IS_PROD = ["production", "prod"].includes(process.env.NODE_ENV);
const CompressionPlugin = require("compression-webpack-plugin");
const productionGzipExtensions = /\.(js|css|json|txt|html|ico|svg)(\?.*)?$/i;

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  extraBabelPlugins:[
    IS_PROD?'transform-remove-console':""
  ],
  dynamicImport: {},
  history: { type: 'hash' },
  exportStatic: {},
  routes: [
    { path: '/', component: '@/pages/index' },
    { path: '/systemcaseinfo', component: '@/pages/SystemCaseInfo' },
    { path: '/integrationcaseinfo', component: '@/pages/IntegrationCaseInfo' },
  ],
  fastRefresh: {},
  dva: {},
  antd: {},
  proxy: {
    '/api': {
      'target': 'http://localhost:3456/api',
      'changeOrigin': true,
      secure: false, 
      'pathRewrite': { '^/api' : '' },
    },
  },
  chainWebpack(memo){
    memo.plugin('CompressionPlugin').use(new CompressionPlugin({
      filename: "[path].gz[query]",
      algorithm: "gzip",
      test: productionGzipExtensions,
      // 只处理大于xx字节 的文件，默认：0
      // 若某些文件代码体积过小 再压缩可能导致体积反增
      threshold: 10240,
      // 示例：一个1024b大小的文件，压缩后大小为768b，minRatio : 0.75
      minRatio: 0.8, // 默认: 0.8
      // 是否删除源文件，默认: false
      deleteOriginalAssets: false
    }));
  },
  favicon: '/favicon.ico',
  title:'PHengLEI ATP'

});
