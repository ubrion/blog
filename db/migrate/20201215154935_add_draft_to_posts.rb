class AddDraftToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :draft, :boolean, null: false, default: true
  end
end
