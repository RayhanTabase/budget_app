class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups , through: :entity_groups
end
