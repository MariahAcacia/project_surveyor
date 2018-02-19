# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Multiplier
MULTIPLIER = 5

# Destroy all current data in DB
def destroy_old_data
  if Survey.destroy_all || Question.destroy_all
    puts "Data Destroy Successully"
  else
    puts "Could not destroy current data"
  end
end


def generate_survey
  MULTIPLIER.times do |x|
    survey = Survey.new
    survey[:title] =  Faker::Lorem.sentence(rand(2..10))
    survey[:description] = Faker::Lorem.sentence(rand(2..10))
    survey.save
  end
end


def generate_questions
  Survey.all.each do |survey|
    rand(2..4).times do |x|
      survey.questions.create(
        question: Faker::Lorem.words(rand(4..11)).join(' ') + "?",
        required: Faker::Boolean.boolean,
        multiple_select: Faker::Boolean.boolean,
        number_of_options: Faker::Number.between(2, 5),
        survey_id: survey.id
      )
    end
  end
end


def generate_options_for_questions
  Question.all.each do |question|
    question.number_of_options.times do |x|
      question.options.create(
        question_id: question.id,
        description: Faker::Lorem.words(rand(1..10)).join(' ')
      )
    end
  end
end


def one_emtpy_survey
  survey = Survey.new
  survey[:title] =  Faker::Lorem.sentence(rand(2..10))
  survey[:description] = Faker::Lorem.sentence(rand(2..10))
  survey.save
end


destroy_old_data
if generate_survey
  puts "Created Survey's"
end
if generate_questions
  puts "Created Questions"
end
if generate_options_for_questions
  puts "Options created"
end
if one_emtpy_survey
  puts "Created One Empty Survey"
end
