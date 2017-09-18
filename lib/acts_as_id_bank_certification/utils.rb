module ActsAsIdBankCertification
  module Utils
    class << self
      def active_record5?
        ::ActiveRecord::VERSION::MAJOR == 5
      end
    end
  end
end