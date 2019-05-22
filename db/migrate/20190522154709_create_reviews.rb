class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :title
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :ice_cream, foreign_key: true

      t.timestamps
    end
  end
end
