# frozen_string_literal: true

require "rails_helper"

RSpec.describe "projects/index" do
  before do
    create_list(:project, 2)
    assign(:projects, Project.details)
  end

  it "renders a list of projects" do
    render
    cell_selector = "table>tbody>tr"
    Project.details.each do |project|
      assert_select cell_selector, text: Regexp.new(project.title), count: 1
      assert_select cell_selector, text: Regexp.new(project.first_name), count: 1
    end
  end
end
