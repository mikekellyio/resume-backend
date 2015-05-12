class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.datetime :started_at
      t.datetime :ended_at
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
