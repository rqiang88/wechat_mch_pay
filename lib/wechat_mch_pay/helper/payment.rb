module WechatMchPay
  module Helper
    module Payment
      def default_params
        {
          nonce_str: nonce_str,
          mch_billno: mch_billno,
          mch_id: configurate.mch_id,
          wxappid: configurate.wxappid,
          total_num: 1,
          client_ip: configurate.client_ip,
          send_name: configurate.send_name,
          notify_way: 'JSAPI',
          scene_id: 'PRODUCT_3',
          total_num: 1
        }
      end

      private 

      def timstamp
        Time.now.to_i
      end

      def nonce_str
        SecureRandom.hex 28
      end

      def mch_billno
        number = 1000 + rand(8999)
        configurate.mch_id + Time.now.strftime("%Y%m%d") + number.to_s
      end
    end
  end 
end