class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.string :subtitle, null: false, default: ''
      t.string :descr, null: false, default: ''
      t.string :background, null: false
      t.integer :assets_count, null: false, default: 0

      t.timestamps
    end
  end
end
