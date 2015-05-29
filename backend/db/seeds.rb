# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' } => [], { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel' => [], city: cities.first)

categories = {
'Arts & Crafts' => ['Painting', 'Sculpting', 'Sewing', 'Pottery', 'Basket Making'],
'Cars & Motorcycles' => ['Vintage Vehicles', 'Maintenance', 'Racing', 'Car Shows'],
'Education & Learning' => ['Teaching', 'Study Groups', 'SAT Prep'],
'Fashion & Beauty' => ['Makeup', 'Winter Clothes', 'Shoes', 'Modeling'],
'Food & Drink' => ['Cooking', 'Wine', 'Beer', 'Pie Eating', 'Food Trucks'],
'Games' => ['Sardines', 'Taboo', 'Chess', 'Monopoly', 'Sudoku'],
'Health & Wellbeing' => ['Suppliments', 'Meditation', 'Acupuncture', 'Dieting', 'Sleep'],
'Language & Ethnic Identity' => ['French', 'Spanish'],
'Music' => ['Composing', 'Performing', 'Jam Bands', 'Concert Going', 'Listening', 'Marching Band'],
'Outdoors & Adventure' => ['Hiking', 'Climbing', 'Camping', 'Skydiving', 'Hang Gliding'],
'Paranormal' => ['Ghost Hunting', 'Alien Spotting', 'Big Foot', 'Loch Ness'],
'Animals' => ['Dog Training', 'Pets', 'Animal Control', 'Zoology', 'Cat Training'],
'Photography' => ['Film', 'Digital', 'Black and White', 'Portfolio Building'],
'Sci-Fi & Fantasy' => ['Harry Potter', 'Star Trek', 'Star Wars', 'LARPing', 'Comics'],
'Socializing' => ['Drinking', 'Karaoke', 'Team Sports', 'Talking'],
'Sports & Recreation' => ['Basketball', 'Baseball', 'Football', 'Swimming', 'Soccer', 'Archery', 'Fencing'],
'Tech' => ['Programming', 'DBC', 'Robots', 'Wearable Tech', 'Computer Building']
}

users = {
  'Keith' => {email: 'keith@mail.com', password: 123},
  'Taniya' => {email: 'taniya@mail.com', password: 123},
  'Caitlyn' => {email: 'caitlyn@mail.com', password: 123},
  'David' => {email: 'david@mail.com', password: 123},
}

all_users = []

users.each do |user, params|
  new_user = User.create(username: user, email: params[:email], password: params[:password], image_url: Faker::Avatar.image)
  all_users << new_user
end


categories.each do |cat, hobbies|
  new_cat = Category.create(name: cat)
  hobbies.each do |hobby|

    new_hobby = Hobby.create(name: hobby, description: Faker::Lorem.paragraph, image_url: Faker::Avatar.image)
    new_cat.hobbies << new_hobby
    all_users.sample.hobbies << new_hobby

    1.times do
      new_question = Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
      all_users.sample.questions << new_question
      new_hobby.questions << new_question

      2.times do
        new_answer = Answer.create(body: Faker::Company.bs)
        new_question.answers << new_answer
        all_users.sample.answers << new_answer
      end

    end

  end
end


