class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :survey_id,         null: false
      t.string :question,           null: false
      t.boolean :required,           null: false
      t.integer :number_of_options, null: false
      t.boolean :multiple_select,    null: false

      t.timestamps
    end
  end
end
