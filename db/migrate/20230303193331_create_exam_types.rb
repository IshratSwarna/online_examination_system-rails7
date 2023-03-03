class CreateExamTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_types do |t|
      t.string :name, null:false, unique:true
      t.integer :status, default:0

      t.timestamps
    end
  end
end
