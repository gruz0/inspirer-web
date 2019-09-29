# frozen_string_literal: true

Account.destroy_all

account = Account.create!(
  email: 'me@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Firstname Lastname',
  username: 'username',
  website: 'https://example.com/',
  bio: 'Some text about me'
)

20.times do |_|
  account.health_sleep.create!(
    woke_up_at_hour: (0...23).to_a.sample,
    woke_up_at_minutes: (0...59).to_a.sample,
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Some Text',
    created_at: DateTime.now - (rand * 21)
  )
end
