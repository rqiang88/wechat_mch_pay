require 'wechat_mch_pay/helper/payment'
require 'wechat_mch_pay/helper/service'
require 'wechat_mch_pay/helper/signature'
require 'wechat_mch_pay/helper/request'

module WechatMchPay
  module Api
    include Helper::Service
    include Helper::Signature
    include Helper::Payment
    include Helper::Request


    def sendminiprogramhb options
      url = '/mmpaymkttransfers/sendminiprogramhb'
      data = request_data(default_wechat_mch_params, options)
      execute('post', url, data, true)
    end

    def unifiedorder options
      url = '/pay/unifiedorder'
      data = request_data(default_wechat_pay_params, options)
      response = execute('post', url, data)

      if response[:status] == 'success'
        data = response[:data]
        response[:data] = genarate_wechat_mch_payment data
      end
      response
    end

    def orderquery options

    end

    def verify options
      signature = options['sign']
      data = sign_data options
      verify?(data, signature)
    end

    def refund options
      url = '/secapi/pay/refund'
      data = request_data(default_wechat_mch_refund_params, options)
      execute('post', url, data, true)
    end

    def refundquery options
      url = '/pay/refundquery'
      data = request_data(default_wechat_params, options)
      execute('post', url, data)
    end

    private

    def request_data default_params, options
      options = handle_params options
      default_params.each{|k, v| options[k] = v unless options[k]}
      options['sign'] = hexdigest sign_data(options)
      xml(options)
    end
  end
end