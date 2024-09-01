# frozen_string_literal: true

require "rails_helper"

RSpec.describe "projects/show" do
  before do
    assign(:project, create(:project, title: "My Title", description: "This is my new project."))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/My Title/)
    expect(rendered).to match(/This is my new project./)
  end
end
