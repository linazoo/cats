require 'faker'

number_of_cats_wanted = 10

new_cats_needed = number_of_cats_wanted - Cat.count
new_cats_needed.times do
    # creating a hash of configurations for this cat
    cat = { name: Faker::Name.first_name, color: Faker::Color.color_name}
    # creating the cat Object with the configuration hash created above
    cat = Cat.new(cat)
    cat.save!
end 