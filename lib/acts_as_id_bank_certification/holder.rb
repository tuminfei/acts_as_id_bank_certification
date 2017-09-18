#encoding: utf-8
module ActsAsIdBankCertification
  module Holder
    def self.included(base)
      # allow user to define these
      aliases = {
          id_bank_certification_on?: [:id_bank_certification_for?]
      }

      base.class_eval do

        has_one :id_bank_document, class_name: "ActsAsIdBankCertification::IdBankDocument", as: :id_bank_document, dependent: :destroy

        aliases.each do |method, links|
          links.each do |new_method|
            alias_method(new_method, method)
          end
        end

      end
    end
  end
end




