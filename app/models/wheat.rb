class Wheat < ApplicationRecord
  validates :x, :y, inclusion: { in: (1..10), message: "Mind those property lines" }

  has_many :plots
  has_many :users, through: :plots
end
