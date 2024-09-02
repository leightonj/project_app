# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment do
  it "can have a valid factory" do
    expect(build(:comment)).to be_valid
  end

  it "can strip the start / end text of white space" do
    expect(create(:comment, text: " this is a test").text).to eq("this is a test")
    expect(create(:comment, text: " this is a test ").text).to eq("this is a test")
    expect(create(:comment, text: "this is a test ").text).to eq("this is a test")
  end
end
