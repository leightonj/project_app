# frozen_string_literal: true

class Project < ApplicationRecord
  include AASM
  include ProjectState

  belongs_to :creator, class_name: "User", foreign_key: :created_by, inverse_of: :projects

  validates :title, presence: true
  validates :description, presence: true

  scope :details, -> { select("projects.*, users.first_name").joins(:creator) }
end
