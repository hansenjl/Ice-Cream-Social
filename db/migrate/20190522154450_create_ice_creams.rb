class CreateIceCreams < ActiveRecord::Migration[5.2]
  def change
    create_table :ice_creams do |t|
      t.string :flavor
      t.string :description
      t.belongs_to :brand, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
