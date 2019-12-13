class CreateCandidacies < ActiveRecord::Migration[5.2]
  def change
    create_table :candidacies do |t|
      t.float :cre, null: false
      t.float :nota, null: false
      t.boolean :status
      t.string :resultado
      t.datetime :data, null: false
      t.references :user, foreign_key: true
      t.references :notice, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
