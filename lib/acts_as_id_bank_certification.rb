require 'active_record'
require 'active_support/inflector'
require 'acts_as_id_bank_certification/version'
require 'acts_as_id_bank_certification/engine'
require "acts_as_id_bank_certification/railtie" if defined?(Rails)

$LOAD_PATH.unshift(File.dirname(__FILE__))

module ActsAsIdBankCertification
  if defined?(ActiveRecord::Base)
    require "acts_as_id_bank_certification/extenders/holder"
    require "acts_as_id_bank_certification/id_bank_document"
    ActiveRecord::Base.extend ActsAsIdBankCertification::Extenders::Holder
  end
end


require "acts_as_id_bank_certification/extenders/controller"
ActiveSupport.on_load(:action_controller) do
  include ActsAsIdBankCertification::Extenders::Controller
end