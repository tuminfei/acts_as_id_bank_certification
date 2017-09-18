#encoding: utf-8
module ActsAsIdBankCertification
  module Holder
    def self.included(base)
      # allow user to define these
      aliases = {
          id_bank_certification_verified?: [:id_bank_certification_pass?]
      }

      base.class_eval do

        has_one :id_bank_document, class_name: "ActsAsIdBankCertification::IdBankDocument", as: :holder, dependent: :destroy

        before_create :build_default_id_bank_document

        delegate :verified?,  to: :id_bank_document, prefix: true, allow_nil: true

        aliases.each do |method, links|
          links.each do |new_method|
            alias_method(new_method, method)
          end
        end
      end
    end

    def id_bank_certification_verified?
      id_bank_document.verified?
    end

    def build_default_id_bank_document
      #默认是身份证
      build_id_bank_document(:card_type => ActsAsIdBankCertification::IdBankDocument::CARD_TYPE_DEBIT)
      true
    end
  end
end




