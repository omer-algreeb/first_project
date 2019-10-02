class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :descreption
      t.references :type_message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
