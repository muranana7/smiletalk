class CreateReplies < ActiveRecord::Migration[8.0]
  def change
    create_table :replies do |t|
      t.references :post, null: false, foreign_key: true
      t.string :nickname
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
