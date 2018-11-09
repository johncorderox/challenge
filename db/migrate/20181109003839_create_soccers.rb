class CreateSoccers < ActiveRecord::Migration[5.2]
  def change
    create_table :soccers do |t|
      t.string :name
      t.integer :for
      t.integer :against

      t.timestamps
    end
  end
end
