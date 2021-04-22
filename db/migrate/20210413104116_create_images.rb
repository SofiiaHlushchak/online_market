class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer  :product_id
      t.string   :file
      t.integer  :imageadle_id
      t.string   :imageadle_type
      t.timestamps
    end
  end
end
