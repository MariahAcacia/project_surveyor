class Option < ApplicationRecord
  belongs_to :question, inverse_of: :options
  validates :question_id, :description, presence: true 
end
