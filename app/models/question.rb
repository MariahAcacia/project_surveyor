class Question < ApplicationRecord
  belongs_to :survey, inverse_of: :questions
  has_many :options, inverse_of: :question
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  validates :survey_id, :question, :required, presence: true
  validates :number_of_options,
            presence: true,
            inclusion: 2..5

end
