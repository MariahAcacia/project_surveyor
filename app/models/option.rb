class Option < ApplicationRecord
  belongs_to :question, inverse_of: :options
  validates :question, :description, presence: true
end
