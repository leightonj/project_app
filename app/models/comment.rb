# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project, counter_cache: true
  belongs_to :creator, class_name: "User", foreign_key: :created_by, inverse_of: :comments

  scope :details, -> { select("comments.*, users.first_name").joins(:creator) }
end
