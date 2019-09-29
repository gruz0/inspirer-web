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

20.times do |_|
  unit = HealthWeight.units.keys.sample
  weight = rand(85.0..110.0).round(2)
  weight *= KG_TO_LBS_RATIO if unit == 'lbs'

  account.health_weight.create!(
    weight: weight,
    unit: unit,
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome',
    created_at: DateTime.now - (rand * 21)
  )
end
