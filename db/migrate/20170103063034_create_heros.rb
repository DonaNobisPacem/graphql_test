class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :main_attr
      t.string :skill1
      t.string :skill2
      t.string :skill3
      t.string :skill4
      t.integer :str
      t.integer :agi
      t.integer :int

      t.timestamps
    end
  end
end
