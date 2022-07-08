class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :groups , through: :entity_groups
  validates :name, presence: true

end
