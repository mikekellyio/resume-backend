class JobSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :company,
             :started_at,
             :ended_at,
             :location,
             :description,
             :created_at,
             :updated_at
  has_many :skills, embed: :ids
end
