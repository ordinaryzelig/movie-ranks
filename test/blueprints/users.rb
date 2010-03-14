Sham.user_name { Faker::Name.name }

User.blueprint do
  name { Sham.user_name }
end
