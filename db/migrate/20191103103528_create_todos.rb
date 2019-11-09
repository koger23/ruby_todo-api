class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :assignee
      t.boolean :is_done

      t.timestamps
    end
  end
end
