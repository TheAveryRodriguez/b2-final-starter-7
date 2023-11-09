class CreateBulkDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bulk_discounts do |t|
      t.integer :quantity_threshold
      t.integer :percent_discount
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
