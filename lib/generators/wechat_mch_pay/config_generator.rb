module WechatMchPay
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc 'Generate eloan configs'
      source_root File.expand_path('../templates', __FILE__)

      def copy_file
        template 'wechat_mch_pay.rb', 'config/initializers/wechat_mch_pay.rb'
      end
    end
  end
end