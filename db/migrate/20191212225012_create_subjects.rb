class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :nome
      t.integer :periodo
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
