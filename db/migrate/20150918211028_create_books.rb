class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.datetime :started
      t.datetime :ended
      t.integer :rating
      t.text :summary
      t.text :thoughts
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
