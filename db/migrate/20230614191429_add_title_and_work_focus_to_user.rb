class AddTitleAndWorkFocusToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :title, :string
    add_column :users, :work_focus, :enum, enum_type: :work_focus
  end
end
