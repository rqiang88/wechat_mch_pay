module WechatMchPay
  class Client
    attr_accessor :configurate

    def initialize(config)
      @configurate = config
    end

    def execute(method, url, params)
      response = RestClient::Request.execute(method: request_method, 
                    url: URI.escape(url), headers: {params: options})
    end
  end
end
