class AddImageToReplies < ActiveRecord::Migration[8.0]
  def change
    add_column :replies, :image, :string
  end
end
