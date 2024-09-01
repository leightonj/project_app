# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.integer :created_by
      t.string :title
      t.text :description
      t.integer :num_comments, default: 0
      t.datetime :in_progress_at
      t.datetime :in_review_at
      t.datetime :completed_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
