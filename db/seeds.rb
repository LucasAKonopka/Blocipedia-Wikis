
#Create Wikis
20.times do
  Wiki.create!(
    title: Faker::Hipster.sentences(1),
    body: Faker::Hipster.paragraph
    )
end

puts "Seeding finished"
puts "#{Wiki.count} wikis created"