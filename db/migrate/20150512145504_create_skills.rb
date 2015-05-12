class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title

      t.timestamps null: false
    end
    
    create_table :jobs_skills do |t|
        t.belongs_to :jobs
        t.belongs_to :skills 
    end
  end
end
