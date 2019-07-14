module WechatMchPay
  module Helper
    module Request
    	def default_wechat_mch_params
        {
          'nonce_str' => nonce_str,
          'mch_billno' => mch_billno,
          'mch_id' => configurate.mch_id,
          'wxappid' => configurate.appid,
          'total_num' => 1,
          'client_ip' => configurate.client_ip,
          'send_name' => configurate.send_name,
          'notify_way' => 'JSAPI',
          'scene_id' => 'PRODUCT_3'
        }
      end

      def default_wechat_pay_params
        {
          'appid' => configurate.appid,
          'mch_id' => configurate.mch_id,
          'nonce_str' => nonce_str,
          'notify_url' => configurate.notify_url,
          'trade_type' => 'JSAPI',
          'spbill_create_ip' => configurate.client_ip
        }
      end

      def default_wechat_params
        {
          'appid' => configurate.appid,
          'mch_id' => configurate.mch_id,
          'nonce_str' => nonce_str,
        }
      end

      def default_wechat_mch_payment_params
        {
          'appId' => configurate.appid,
          'timeStamp' => timestamp.to_s,
          'nonceStr' => nonce_str,
          'signType'  => 'MD5'
        }
      end

      def default_wechat_mch_refund_params
        {
          'appid' => configurate.appid,
          'mch_id' => configurate.mch_id,
          'nonce_str' => nonce_str,
          'notify_url' => configurate.notify_url
        }
      end

      def default_transfer_params
        {
          'mch_appid' => configurate.appid,
          'mchid' => configurate.mch_id,
          'nonce_str' => nonce_str,
          'check_name' => 'NO_CHECK',
          'spbill_create_ip' => configurate.client_ip
        }
      end

      private 

      def timestamp
        Time.now.to_i
      end

      def nonce_str
        SecureRandom.hex 14
      end

      def mch_billno
        number = 1000 + rand(8999)
        configurate.mch_id.to_s + Time.now.strftime("%Y%m%d%H%M%D") + number.to_s
      end
    end
  end 
end