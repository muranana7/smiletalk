class AddImageToReplies < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:replies, :image)
      add_column :replies, :image, :string
    end
  end
end
