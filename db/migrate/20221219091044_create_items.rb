class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer  :quantity,   default: 1
      t.references :basket, type: :integer
      t.references :product, type: :integer
      t.timestamps
    end
  end
end
