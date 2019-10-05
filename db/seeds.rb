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
  unit = HealthBodyWeight.units.keys.sample
  weight = rand(85.0..110.0).round(2)
  weight *= KG_TO_LBS_RATIO if unit == 'lbs'

  account.health_body_weight.create!(
    weight: weight,
    unit: unit,
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome',
    created_at: DateTime.now - (rand * 21)
  )
end

20.times do |_|
  unit = HealthBodyMeasure.units.keys.sample
  chest = rand(85..95)
  waist = rand(58..70)
  hips = rand(85..95)

  if unit == 'inch'
    chest /= INCH_TO_CM_RATIO
    waist /= INCH_TO_CM_RATIO
    hips /= INCH_TO_CM_RATIO
  end

  account.health_body_measure.create!(
    chest: chest.round(2),
    waist: waist.round(2),
    hips: hips.round(2),
    unit: unit,
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome',
    created_at: DateTime.now - (rand * 21)
  )
end

20.times do |_|
  unit = ActivityOutdoorWalk.units.keys.sample
  distance = rand(3.0..10.5)
  distance /= MI_TO_KM_RATIO if unit == 'mi'

  account.activity_outdoor_walk.create!(
    distance: distance,
    distance_unit: unit,
    steps: rand(5_000..15_000),
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Day!',
    created_at: DateTime.now - (rand * 21)
  )
end

20.times do |idx|
  account.learning_article.create!(
    url: "https://example.com/#{idx}",
    title: "Post ##{idx}",
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Post!',
    created_at: DateTime.now - (rand * 21)
  )
end
