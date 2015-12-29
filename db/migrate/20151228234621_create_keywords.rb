class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.string :list_name

      t.timestamps null: false
    end
  end
end
