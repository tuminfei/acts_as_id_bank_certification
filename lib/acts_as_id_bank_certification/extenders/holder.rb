#encoding: utf-8
module ActsAsIdBankCertification
  module Extenders
    module Holder
      def acts_as_id_bank_certification(args = {})
        require "acts_as_id_bank_certification/holder"
        include ActsAsIdBankCertification::Holder

        define_method :acts_as_id_bank_certification_options do
          self.class.instance_variable_get("@acts_as_id_bank_certification_options")
        end

        class_eval do
          @acts_as_id_bank_certification_options = {
              cacheable_strategy: :update_attributes
          }.merge(args)

          def self.id_bank_certification?
            true
          end
        end
      end
    end
  end
end
