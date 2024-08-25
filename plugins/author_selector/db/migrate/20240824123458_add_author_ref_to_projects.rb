class AddAuthorRefToProjects < ActiveRecord::Migration[7.1]
  def up
    add_reference :projects, :author, foreign_key: { to_table: :users }
  end

  def down
    if foreign_key_exists?(:projects, :author_id)
      remove_foreign_key :projects, column: :author_id
    end

    if column_exists?(:projects, :author_id)
      remove_column :projects, :author_id
    end
  end
end
