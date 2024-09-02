# frozen_string_literal: true

###
# FIELDS
# title [string]
# description [text]
# created_by [integer] FK
# comments_count [integer]
# in_progress_at [datetime]
# in_review_at [datetime]
# completed_at [datetime]
# deleted_at [datetime]
# created_at [datetime]
# updated_at [datetime]
###
class Project < ApplicationRecord
  include AASM
  include ProjectState

  belongs_to :creator, class_name: "User", foreign_key: :created_by, inverse_of: :projects
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :details, -> { select("projects.*, users.first_name").joins(:creator) }

  normalizes :title, :description, with: -> attribute { attribute.strip }
end
