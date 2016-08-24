class Wheat < ApplicationRecord
  validates :x, :y, inclusion: { in: (1..10), message: "Mind those property lines" }
  belongs_to :user
end
