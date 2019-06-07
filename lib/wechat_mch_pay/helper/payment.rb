module WechatMchPay
  module Helper
    module Payment
      def genarate_wechat_mch_payment data
        options = default_wechat_mch_payment_params.clone
        options['package'] = 'prepay_id=' + data['prepay_id']
        options['paySign'] = hexdigest(sign_data options)
        options.delete('appId')
        data['payment'] = options
        data
      end
    end
  end 
end