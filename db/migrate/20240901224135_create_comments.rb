# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :created_by
      t.text :text

      t.timestamps
    end
  end
end
