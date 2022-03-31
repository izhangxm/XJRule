'use strict';

const { utils } = require('surgio');

/**
 * 使用文档：https://surgio.js.org/
 */
module.exports = {
  /**
   * 远程片段
   * 文档：https://surgio.js.org/guide/custom-config.html#remotesnippets
   */
  remoteSnippets: [
    // {
    //   name: 'apple', // 模板中对应 remoteSnippets.apple
    //   url: 'https://raw.githubusercontent.com/geekdada/surge-list/master/surgio-snippet/apple.tpl',
    //   surgioSnippet: true
    // },
    // {
    //   name: 'telegram', // 模板中对应 remoteSnippets.telegram
    //   url: 'https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Telegram/Telegram.list'
    // },
    // {
    //   name: 'netflix', // 模板中对应 remoteSnippets.netflix
    //   url: 'https://github.com/lhie1/Rules/raw/master/Surge/Surge%203/Provider/Media/Netflix.list'
    // },
    // {
    //   name: 'hbo', // 模板中对应 remoteSnippets.hbo
    //   url: 'https://github.com/lhie1/Rules/raw/master/Surge/Surge%203/Provider/Media/HBO%20Max.list'
    // },
    // {
    //   name: 'hulu', // 模板中对应 remoteSnippets.hulu
    //   url: 'https://raw.githubusercontent.com/geekdada/surge-list/master/hulu.list'
    // },
    // {
    //   name: 'disney', // 模板中对应 remoteSnippets.disney
    //   url: 'https://raw.githubusercontent.com/geekdada/surge-list/master/disney.list',
    // },
    // {
    //   name: 'paypal', // 模板中对应 remoteSnippets.paypal
    //   url: 'https://github.com/DivineEngine/Profiles/raw/master/Surge/Ruleset/Extra/PayPal.list'
    // },
  ],
  customFilters: {
    hktFilter: utils.useKeywords(['hkt', 'HKT']),
    AutoFilter: utils.discardKeywords(['台湾']),
    jpFilter: utils.useKeywords(['日本','JP']),
  },
  customParams: {
    conf_inv: 3600,
    resource_inv: 3600,
    test_inv: 600,
  },
  artifacts: [
    {
      name: 'surge_paolu_v4.conf',
      template: 'surge_v4',
      provider: 'paolu_tojan',
    },
    {
      name: 'quan_x_paolu_v4.conf',
      template: 'quan_x',
      provider: 'paolu_tojan',
    },
    {
      name: 'surge_v4.conf',
      template: 'surge_v4',
      provider: 'subscribe_miaona',
    },
    /**
     * Clash
     */
    // {
    //   name: 'Clash.yaml',
    //   template: 'clash',
    //   provider: 'subscribe_demo',
    // },
  ],
  /**
   * 订阅地址的前缀部分，以 / 结尾
   * 例如阿里云 OSS 的访问地址 https://xxx.oss-cn-hangzhou.aliyuncs.com/
   */
  urlBase: 'https://izhangxm-surgio.oss-cn-beijing.aliyuncs.com/',
  
  surgeConfig: {
    v2ray: 'native', // 默认 'native', 可选 'external'
    shadowsocksFormat: 'ss', // 默认 'ss', 可选 'custom'
    resolveHostname: true,
  },
  binPath: {
    // 安装教程: https://surgio.js.org/guide/install-ssr-local.html
    shadowsocksr: '/usr/local/bin/ssr-local',
  },
  upload: {
    // 默认保存至根目录，可以在此修改子目录名，以 / 结尾，默认为 /
    prefix: '/',
    bucket: 'izhangxm-surgio',
    // 支持所有区域
    region: 'oss-cn-beijing',
    // 以下信息于阿里云控制台获得
    accessKeyId: 'LTAI5tFcsd5VZf4Stxf4Q8G1',
    accessKeySecret: 'F4eyP7zI9Fl0CENPGRiz7dyya8bfdC',
  },
  // 非常有限的报错信息收集
  analytics: true,
};

