# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Category.delete_all
Discussion.delete_all
DiscussionCategory.delete_all
admin = User.create(username: "via seedfile", email: "josh@josh.com", password: "password", admin: true)
cat1 = Category.create(name: "cat 1", user: admin)
cat2 = Category.create(name: "cat 2", user: admin)
cat3 = Category.create(name: "cat 3", user: admin)
Discussion.create(title: "discussion", question: "question is this long enough", user: admin, categories: [cat1, cat2])

