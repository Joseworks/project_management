# frozen_string_literal: true

class CreateWorkFocusEnum < ActiveRecord::Migration[7.0]
  def up
    create_enum :work_focus, %w[development design business research]
  end

  def down
    execute <<-SQL
      DROP TYPE work_focus;
    SQL
  end
end
