# frozen_string_literal: true

module ActsAsIdBankCertification
  module Extenders
    module Controller
      def id_bank_document_params(params_object = params[:id_bank_document])
        params_object.permit(:holder_id, :holder_type,
                             :bank_code, :card_type,
                             :card_holder_name, :cert_type,
                             :cert_no, :mobile_no,
                             :card_no, :exp_year,
                             :exp_month, :cvv,
                             :serial_no, :contract_no,
                             :user_info,
        )
      end
    end
  end
end
