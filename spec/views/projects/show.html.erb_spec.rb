# frozen_string_literal: true

require "rails_helper"

RSpec.describe "projects/show" do
  include Pagy::Backend

  before do
    project = create(:project, title: "My Title", description: "This is my new project.")
    assign(:project, Project.details.first)
    pagy, comments = pagy(project.comments.details.order(created_at: :desc, id: :desc))
    assign(:pagy, pagy)
    assign(:comments, comments)

    sign_in(create(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/My Title/)
    expect(rendered).to match(/This is my new project./)
  end
end
