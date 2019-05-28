module WechatMchPay
  module Helper
    module Service
      
      def xml data
        data.to_xml(root: 'xml', dasherize: false) 
      end

      def handle_params(options={})
        ActiveSupport::HashWithIndifferentAccess.new(options)
      end          
    end
  end
end