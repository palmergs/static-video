class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.belongs_to :site, null: false, foreign_key: true
      t.string :type, null: false
      t.string :alt, null: false, default: ''
      t.string :filename, null: false
      t.integer :rel_order, null: false, default: 0

      t.timestamps
    end
  end
end
