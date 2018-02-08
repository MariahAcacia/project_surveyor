class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.integer :question_id,       null: false
      t.string :description,        null: false

      t.timestamps
    end
  end
end
