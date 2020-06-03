require "open-uri"

Car.destroy_all

puts "Creating Cars"


file = URI.open('https://img.sportauto.fr/news/2020/02/18/1546559/60a4a27d7ed0c1e017122f38-1920-1280.jpg')
car = Car.new(brand:'Porsche', model:'911', description: "Nice 911 model from the 80's", user_id:User.last.id)
car.photo.attach(io: file, filename: 'porsche.jpg', content_type: 'image/jpg')
car.save
