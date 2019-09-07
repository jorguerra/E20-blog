# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
10.times do |i|
  user = User.create(name: "User#{i}", email: "email#{i}@mail.com", password: "123456")
  post = Post.create(user: user, title: "post #{i}", content: "content #{i}")
  10.times do |x|
    comment = post.comments.build(content: "comment #{x}", post: post, user: user)
    comment.save!
  end
end
