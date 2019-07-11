class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.integer :year_id, :null => false
      t.string :subject_name, :null => false
      t.string :teacher_name, :null => false

      t.timestamps
    end
  end
end
