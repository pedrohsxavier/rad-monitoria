class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :semestre
      t.boolean :encerrado, default: false
      t.boolean :resultados_liberados, default: false

      t.timestamps
    end
  end
end
