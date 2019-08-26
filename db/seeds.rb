10.times do
  name = FFaker::Name.name
  email = "#{name.split().map(&:downcase).join(".")}@sun-asterisk.com"
  admin = FFaker::Boolean.sample

  User.create name: name, email: email, admin: admin
end
