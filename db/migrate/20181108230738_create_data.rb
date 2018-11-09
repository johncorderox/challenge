class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.integer :day
      t.integer :max
      t.integer :min

      t.timestamps
    end
  end
end
