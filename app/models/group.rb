class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :entities, through: :entity_groups
  validates :name, presence: true

  def total_transactions
    total = 0
    entities.each do |transaction|
      total += transaction.amount
    end
    total
  end
end
