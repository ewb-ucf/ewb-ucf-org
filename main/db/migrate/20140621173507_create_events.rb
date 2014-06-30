class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :category
      t.string :infolink
      t.string :title
      t.text :description
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
