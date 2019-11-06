# WechatMchPay

微信小程序支付和红包

## 安装

将以下代码添加到 Gemfile:

```ruby
gem 'wechat_mch_pay', github: 'rqiang88/wechat_mch_pay'
```

然后执行:

    $ bundle

## 使用

通过以下方式添加配置项

```ruby
rails g wechat_mch_pay:config
```
## wiki

请参照微信官方文档对应相应接口
接口调用方式 WechatMchPay.api.orderquery(options)
