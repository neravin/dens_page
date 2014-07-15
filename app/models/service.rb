class Service < ActiveRecord::Base
  has_and_belongs_to_many :projects

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end