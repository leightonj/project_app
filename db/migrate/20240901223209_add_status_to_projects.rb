# frozen_string_literal: true

class AddStatusToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :status, :string
  end
end
