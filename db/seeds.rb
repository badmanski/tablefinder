def create_users users
  users.each do |user|
    User.find_or_create_by_email!({
      name: user,
      email: (user.split.join('.').downcase << '@gmail.com'),
      phone: '553423423',
      password: 'pa',
      password_confirmation: 'pa'
    })
  end
end

users = [
  'Rita Rucks',
  'Mariette Manna',
  'Rhea Rusek',
  'Dalila Direnzo',
  'Kurtis Keas',
  'Yasmine Yarbrough',
  'Shemeka Smartt',
  'Annis Aguiar',
  'Willis Wayman',
  'Ellyn Emanuel'
]

create_users users