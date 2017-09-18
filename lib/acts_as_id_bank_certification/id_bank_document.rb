# encoding: utf-8
module ActsAsIdBankCertification
  class IdBankDocument < ::ActiveRecord::Base
    CARD_TYPE_DEBIT = '1'
    CARD_TYPE_CREDIT = '2'
    CERT_TYPE_ID = '01'

    #validate :check_cert_no_repeat, on: :update

    include AASM

    attr_accessor :msg_auth_code, :cert_type_desc

    belongs_to :holder, polymorphic: true

    aasm do
      state :unverified, initial: true
      state :verifying
      state :verified

      event :submit do
        transitions from: :unverified, to: :verifying
      end

      event :approve do
        transitions from: [:unverified, :verifying],  to: :verified
      end

      event :reject do
        transitions from: [:verifying, :verified],  to: :unverified
      end
    end

    #用卡信息json串
    def card_info
      card_info = {"cardHolderName" => self.card_holder_name,
                   "certType" => CERT_TYPE_ID,
                   "certNo" => self.cert_no,
                   "mobileNo" => self.mobile_no,
                   "cardNo" => self.card_no,
                   "expYear" => self.exp_year||'',
                   "expMonth" => self.exp_month||'',
                   "cvv" => self.cvv||''
      }
      card_info.to_json.to_s
    end
  end
end
