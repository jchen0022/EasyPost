class CreateLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :labels do |t|
      t.string :from_name
      t.string :from_street1
      t.string :from_street2
      t.string :from_city
      t.string :from_state
      t.string :from_zip
      t.string :to_name
      t.string :to_street1
      t.string :to_street2
      t.string :to_city
      t.string :to_state
      t.string :to_zip
      t.float :width
      t.float :length
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
