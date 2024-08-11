class AddCaptionToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :caption, :string
  end
end
