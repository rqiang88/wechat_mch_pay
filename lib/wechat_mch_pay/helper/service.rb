module WechatMchPay
  module Helper
    module Service

      def xml data
        data.to_xml(root: 'xml', dasherize: false) 
      end

      def handle_params(options={})
        ActiveSupport::HashWithIndifferentAccess.new(options)
      end

      def raw_data response 
        return {status: :fail, msg: '请求错误,请稍后重试'} unless response.code.to_i == 200
        response = Hash.from_xml response
        data = response['xml'] 
        if data['return_code'] == 'SUCCESS'
          {status: :sucess, msg: 'success', data: data}
        else
          {status: :fail, msg: data['return_msg'], data: data}
        end
      end
    end
  end
end