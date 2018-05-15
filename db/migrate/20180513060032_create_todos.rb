class CreateTodos < ActiveRecord::Migration[5.2]
  def up
    create_table :todos do |t|
      t.text :title
      t.boolean :completed
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :todos
  end
end
