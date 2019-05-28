module WechatMchPay
  module Api
    include Helper::Service
    include Helper::Signature
    include Helper::Payment
    include Helper::Request

    BASE_URL = 'https://api.mch.weixin.qq.com'

    def sendminiprogramhb options
      url = [BASE_URL, 'mmpaymkttransfers/sendminiprogramhb'] * '/'
      options = default_params.keys.each{|k| options[k] = default_params[k] if options[k].blank? }
      response = execute('post', url, options)
    end

    def unifiedorder options
    end

    def verify options
      signature =  options.delete('signature')
      data = handle_response_data options
      verify?(data, signature)
    end
  end
end