module WechatMchPay
  class Configuration
    attr_accessor :mch_id, :appid, :client_ip, :app_key, :send_name,
                  :ssl_client_key, :ssl_client_cert, :notify_url
  end
end