class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :amount
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
