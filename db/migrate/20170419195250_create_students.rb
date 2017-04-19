class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :grade_level
      t.string :gender
      t.float :gpa
      t.integer :teacher_id

      t.timestamps
    end
  end
end
