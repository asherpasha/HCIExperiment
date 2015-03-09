class AddGroupToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :group, :string
  end
end
