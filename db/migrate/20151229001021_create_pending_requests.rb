class CreatePendingRequests < ActiveRecord::Migration
  def change
    create_table :pending_requests do |t|
      t.references :keyword, index: true, foreign_key: true
      t.string :phone_number
      t.boolean :handled

      t.timestamps null: false
    end
  end
end
