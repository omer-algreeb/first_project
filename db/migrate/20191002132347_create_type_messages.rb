class CreateTypeMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :type_messages do |t|
      t.string :name

      t.timestamps
    end
  end
end
