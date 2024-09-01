# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project do
  it "can have a valid factory" do
    expect(build(:project)).to be_valid
  end
end
