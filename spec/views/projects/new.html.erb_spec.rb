# frozen_string_literal: true

require "rails_helper"

RSpec.describe "projects/new" do
  before do
    assign(:project, build(:project))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input[name=?]", "project[title]"
      assert_select "textarea[name=?]", "project[description]"
    end
  end
end
