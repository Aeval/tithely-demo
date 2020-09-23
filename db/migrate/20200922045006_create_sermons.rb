class CreateSermons < ActiveRecord::Migration[5.2]
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :description
      t.datetime :sermon_time
      t.belongs_to :series, foreign_key: true

      t.timestamps
    end
  end
end
