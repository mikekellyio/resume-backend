class Job < ActiveRecord::Base
    has_and_belongs_to_many :skills
    
    validates_presence_of :title, :company, :started_at, :location
end
