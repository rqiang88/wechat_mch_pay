WechatMchPay.configuration do |config|
  config.appid     = 'appid'    # null: false
  config.mch_id    = '商户号'    # null: false
  config.app_key   = 'app_key'  # null: false
  config.send_name = '商户名称'  # null: false
  config.ssl_client_key = '证书key地址'    # null: false
  config.ssl_client_cert = '证书秘钥地址'   # null: false
  config.client_ip = 'client_ip'
  config.notify_url = '微信通知地址'
end