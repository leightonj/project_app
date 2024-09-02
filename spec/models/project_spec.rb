# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project do
  it "can have a valid factory" do
    expect(build(:project)).to be_valid
  end

  it "can strip the start / end title of white space" do
    expect(create(:project, title: " this is a test").title).to eq("this is a test")
    expect(create(:project, title: " this is a test ").title).to eq("this is a test")
    expect(create(:project, title: "this is a test ").title).to eq("this is a test")
  end

  it "can strip the start / end description of white space" do
    expect(create(:project, description: " this is a test").description).to eq("this is a test")
    expect(create(:project, description: " this is a test ").description).to eq("this is a test")
    expect(create(:project, description: "this is a test ").description).to eq("this is a test")
  end
end
