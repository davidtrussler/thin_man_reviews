class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :medium
      t.string :author
      t.string :publisher
      t.string :director
      t.string :actors
      t.string :country
      t.string :venue
      t.string :writer
      t.string :artist
      t.string :label
      t.string :text
      t.integer :running_time
      t.datetime :date_publication
      t.datetime :date_release
      t.datetime :date_opening
      t.datetime :date_closing
      t.datetime :date_event

      t.timestamps
    end
  end
end
