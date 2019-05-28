module Eloan
  module ApiLoader
    class << self
      def with(config)
        raise "mch_id not allow blank"  if config.mch_id.blank?
        raise "wxappid not allow blank" if config.wxappid.blank?
        raise "app_key not allow blank" if config.app_key.blank?
        Client.new(config)
      end
    end
  end
end