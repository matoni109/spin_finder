require "open-uri"
require  'json'

address_arr = [
  "189 Gertrude Street, Fitzroy",
  "276 Brunswick Street, Fitzroy",
  "325-329 Gore Street, Fitzroy",
  "119 Rose Street, Fitzroy",
  "93 Moor Street, Fitzroy",
  "358 Brunswick Street, Fitzroy",
  "14 Johnston Street Fitzroy 3065",
  # "270 King Street Melbourne 3000",
  # "451 Burke Road Glen Iris 3146",
  # "22 Ovens Street Brunswick 3056",
  "683 George Street Haymarket 2000",
  "127-141 Forest Road Hurstville 2220",
  "133/145 Castlereagh Street Haymarket 2000",
  "13 Hay Street Haymarket 2000",
  "245 Australia Street Newtown 2042",
  "6 Cowper Road Wharf Woolloomooloo 2011",
  "1 Frederick Street Artarmon 2064",
  "Sydney Tower 100 Market Street Sydney 2000",
  "1 Temperance Lane Sydney 2000",
  # "16 Ballarat Street Yarraville 3013",
  # "33 Waverley Street Richmond 3121",
  # "7 Dove Place Richmond 3121",
  # "179 St Georges Road Fitzroy North 3068",
  # "119/121 Hawthorn Rd Caulfield North 3161",
  # "30 Railway Place Fairfield 3078",
  # "202 High Street Northcote 3070",
  # "585a Canning Street Carlton North 3054",
  "59 Gertrude Street Fitzroy 3065"
]

puts "--- GAME  START ---"
puts "---"
puts "---"
puts "cleaning house :)"
User.destroy_all
Bike.destroy_all
Booking.destroy_all
Review.destroy_all
Favourite.destroy_all
# # Kills all Active storage items ##
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }

puts "done cleaning house.."

# api_var = ENV["WEIRD_AI_SHIT"]

puts "-- Making Humans"
## kill all images in all models ##

## User Master OverLoad # HOLD GME !! ##
1.times do

  file = File.open("./db/avatars/00.jpeg")

  make_me = User.create!(
    first_name: "Spin",
    last_name: "Daddy",
    bio: "$GME goes BRRRRRRRR 💎🙌",
    location: "Melbourne",
    email: "spin@gmail.com",
    admin: true,
    password: "123456"
  )
  make_me.avatar.attach(io: file, filename: "#{make_me.first_name}.jpeg", content_type: 'image/jpeg')
  puts "made #{make_me.first_name} #{make_me.last_name}"

end

## User Standard User ##
1.times do

  file = File.open("./db/avatars/22.png")

  make_me = User.create!(
    first_name: "Standard",
    last_name: "User",
    bio: "I'm user a standard user, looking at a Dev..",
    location: "Melbourne",
    email: "user@gmail.com",
    admin: false,
    password: "123456"
  )
  make_me.avatar.attach(io: file, filename: "#{make_me.first_name}.png", content_type: 'image/png')
  puts "made #{make_me.first_name} #{make_me.last_name}"

end
## Make the Plebs ##
count = 0

11.times do

  file = File.open("./db/avatars/#{count}.jpeg")

  ## make the instance
  make_me = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::TvShows::Buffy.quote,
    location: ["Perth", "Melbourne", "Sydney", "Darwin", "Brisbane", "Byron Bay"].sample,
    email: Faker::Internet.email,
    password: Faker::Name.name_with_middle
  )
  make_me.avatar.attach(io: file, filename: "#{make_me.first_name}.png", content_type: 'image/jpg')
  #
  puts "made #{make_me.first_name} #{make_me.last_name}"
  count += 1

end
puts "--- Making Humans Ended !"

puts "--- Making Bikes Bro !!"
### Make some Bikes ###
count = 0

13.times do
  find_image = Dir.children("./db/bikes/")
  ## make the instance

  make_me = Bike.create!(
    price: rand(3..15),
    name: Faker::Cannabis.strain,
    available: [true, false].sample,
    description: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
    address: address_arr.sample,
    rating: rand(2..5),
    user_id: User.pluck(:id).sample
  )

  find_image.select{ |i| i[/#{count}/] }.each do |image|
    file = File.open("./db/bikes/#{image}")
    make_me.images.attach(io: file, filename: "#{image.split(".")[0]}.jpeg", content_type: 'image/jpeg')
  end

  puts "made #{make_me.name}"
  count += 1
end

puts "--- Making Bikes Ended !"
#   ### Make some Bookings ###


puts "-- Making Bookings !"
# Day.where(:reference_date => 3.months.ago..Time.now).count
#=> 721
book_fav = 0
until book_fav == 10 do
    ## make the instance
    make_me = Booking.new(
      # total_price: rand(25..85), ## TODO:: work out total price
      from: Time.now + (rand(10..20) * rand(30000..40000 )),
      till: Time.now + (rand(30..40) * rand(70000..90000 )),
      user_id: User.pluck(:id).sample,
      bike_id: Bike.pluck(:id).sample
    )


    if make_me.valid?
      make_me.save!
      book_fav += 1
      puts "made Booking # #{make_me.id}"
    else
      puts "Fav didn't work out ..."
    end

end

  puts "--- Making Bookings ENDED !"

  puts "--- Making Reviews Start !"

  25.times do
    ## make the instance
    make_me = Review.create!(
      content: Faker::TvShows::GameOfThrones.quote,
      rating: rand(1..5),
      booking_id: Booking.pluck(:id).sample
    )
    puts "made Review # #{make_me.id}"

  end

  puts "--- Making Reviews ENDED !"

  puts "--- Making Favourites Start !"

  count_fav = 0
  until count_fav == 10 do
      make_me = Favourite.new(
        favorited_type: Bike,
        favorited_id: Bike.pluck(:id).sample,
        user_id: User.pluck(:id).sample
      )
      if make_me.valid?
        make_me.save!
        count_fav += 1
        puts "made Favourite # #{make_me.id}"
      else
        puts "Fav didn't work out ..."
      end
    end
    puts "--- Making Reviews ENDED !"
    puts "---"
    puts "---"
    puts "--- GAME OVER ---"
