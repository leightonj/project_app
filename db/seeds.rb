# frozen_string_literal: true

user = User.find_or_initialize_by(email: "admin@project.com")
user.update!(first_name: "System", last_name: "Admin", password: "Flop-Hydroxide-Napped5")

10.times.each do |n|
  project = Project.find_or_initialize_by(title: "Test project #{n}")
  project.update!(creator: user, description: "this is project #{n}")

  15.times do |c|
    project.comments.find_or_create_by!(text: "Comment #{n}.#{c}", creator: user)
  end
end
