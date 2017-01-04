class CreateItemizations < ActiveRecord::Migration[5.0]
  def change
    create_table :itemizations do |t|
      t.references :hero, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
