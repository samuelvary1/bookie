class ChangeBalance < ActiveRecord::Migration
  def up
  	change_column :accounts, :balance, :integer
  end

  def down
  	change_column :accounts, :balance, :string
  end
end
