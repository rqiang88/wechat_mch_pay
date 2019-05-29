module WechatMchPay
  class Client
    include Api
    attr_accessor :configurate

    BASE_URL = 'https://api.mch.weixin.qq.com'

    def initialize(config)
      @configurate = config
    end

    def execute(method, url, params, ssl=false)
      options = {}
      options = ssl_options if ssl
      url = request_url url
      response = RestClient::Resource.new(url, options).send(method, params)
      raw_data response
    end

    private 

    def ssl_options
      ssl_client_cert = OpenSSL::X509::Certificate.new(File.read(configurate.ssl_client_cert))
      ssl_client_key = OpenSSL::PKey::RSA.new(File.read(configurate.ssl_client_key))
      {
        ssl_client_key: ssl_client_key,
        ssl_client_cert: ssl_client_cert
      }
    end

    def request_url url
     [BASE_URL, url] * ''
    end
  end
end
