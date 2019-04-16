class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review
      t.string :headline
      t.text :body
      t.integer :movie_id

      t.timestamps
    end
  end
end
