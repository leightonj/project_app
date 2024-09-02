# frozen_string_literal: true

###
# FIELDS
# project [references]
# created_by [integer] FK
# text [text]
# created_at [datetime]
# updated_at [datetime]
###
class Comment < ApplicationRecord
  belongs_to :project, counter_cache: true
  belongs_to :creator, class_name: "User", foreign_key: :created_by, inverse_of: :comments

  scope :details, -> { select("comments.*, users.first_name").joins(:creator) }

  normalizes :text, with: -> attribute { attribute.strip }
end
