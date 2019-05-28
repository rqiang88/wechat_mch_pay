module WechatMchPay
  module Helper
    module Signature
      def hexdigest(data)
        Digest::MD5.hexdigest data.upcase
      end

      def verify?(data, signature)
        hexdigest(data) == signature
      end
      
      def sign_data data
        data.delete('sign')
        data = change_params data
        data = [data, '&key=', configurate.app_key] * ''
      end

      private 

      def change_params(params)
        data = params.sort.map do |k, v|
          "#{k}=#{v}" if v.present?
        end
        data.compact * '&'
      end
    end
  end
end