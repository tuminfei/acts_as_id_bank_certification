class CreateIdBankDocuments < ActiveRecord::Migration
  def change
    create_table :id_bank_documents do |t|
      t.references :holder, polymorphic: true
      t.string :bank_code, :limit=> 30
      t.string :card_type, :limit => 2
      t.string :card_holder_name, :limit=>64
      t.string :cert_type, :limit=>32
      t.string :cert_no, :limit=>64
      t.string :mobile_no, :limit=>32
      t.string :card_no, :limit=>64
      t.string :exp_year, :limit=>32
      t.string :exp_month, :limit=>32
      t.string :cvv, :limit=>32
      t.string :aasm_state, :limit=>32
      t.string :serial_no
      t.string :contract_no
      t.string :user_info
      t.timestamps
    end

    add_index :id_bank_documents, :bank_code
    add_index :id_bank_documents, :card_type
    add_index :id_bank_documents, :cert_no
    add_index :id_bank_documents, :card_no
    add_index :id_bank_documents, [:bank_code, :card_type]
  end
end
