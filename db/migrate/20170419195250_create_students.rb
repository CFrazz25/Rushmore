class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :grade_level, null: false
      t.string :gender, null: false
      t.float :gpa, null: false
      t.integer :teacher_id, null: true
      t.integer :student_id, null: false
      t.boolean :on_finalized_team, default: false, null: true

      t.timestamps null: false
    end
  end
end
