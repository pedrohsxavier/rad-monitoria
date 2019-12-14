class CreateCandidacies < ActiveRecord::Migration[5.2]
  def change
    create_table :candidacies do |t|
      t.float :cre
      t.float :nota
      t.float :media
      t.boolean :status
      t.string :resultado
      t.datetime :data
      t.references :user, foreign_key: true
      t.references :notice, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
