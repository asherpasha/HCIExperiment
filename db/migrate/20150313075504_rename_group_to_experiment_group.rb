class RenameGroupToExperimentGroup < ActiveRecord::Migration
  def self.up
    rename_column :subjects, :group, :experiment_group
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
