class Survey < ApplicationRecord
  has_many :questions, inverse_of: :survey
  validates :title, :description, presence: true 
end
