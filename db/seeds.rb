require "random_data"

50.times do

   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 uniq_post = Post.find_or_create_by(
    title: "Awesome Post!",
    body: "This is the most awesome body of text ever!"
 )

 posts = Post.all

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end


 uniq_comments = Comment.find_or_create_by(
   post: uniq_post,
   body: "Hey! A body!"
 )

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
