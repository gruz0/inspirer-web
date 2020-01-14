# frozen_string_literal: true

Account.destroy_all

email = 'robot@inspirer.app'
password = '8DC!Wtf#Wdt'

account = Account.create!(
  email: email,
  password: password,
  password_confirmation: password,
  name: 'Firstname Lastname',
  username: 'username',
  website: 'https://example.com/',
  bio: 'Some text about me'
)

puts "Email:    #{email}"
puts "Password: #{password}"

account.health_sleep.create!(
  woke_up_at_hour: (0...23).to_a.sample,
  woke_up_at_minutes: (0...59).to_a.sample,
  feeling: FEELINGS.keys.sample.to_s,
  notes: 'Some Text'
)

body_weight_unit = WEIGHT_UNITS.keys.sample
body_weight = rand(85.0..110.0).round(2)
body_weight *= KG_TO_LBS_RATIO if body_weight_unit == 'lbs'

account.health_body_weight.create!(
  weight: body_weight,
  unit: body_weight_unit,
  feeling: FEELINGS.keys.sample.to_s,
  notes: 'Awesome'
)

body_measure_unit = BODY_MEASURE_UNITS.keys.sample
chest = rand(85..95)
waist = rand(58..70)
hips = rand(85..95)

if body_measure_unit == 'inch'
  chest /= INCH_TO_CM_RATIO
  waist /= INCH_TO_CM_RATIO
  hips /= INCH_TO_CM_RATIO
end

account.health_body_measure.create!(
  chest: chest.round(2),
  waist: waist.round(2),
  hips: hips.round(2),
  unit: body_measure_unit,
  feeling: FEELINGS.keys.sample.to_s,
  notes: 'Awesome'
)

account.health_meditation.create!(
  notes: 'My Meditation',
  feeling: FEELINGS.keys.sample.to_s
)

distance_unit = DISTANCE_UNITS.keys.sample
distance = rand(3.0..10.5)
distance /= MI_TO_KM_RATIO if distance_unit == 'mi'

account.activity_outdoor_walk.create!(
  distance: distance,
  distance_unit: distance_unit,
  steps: rand(5_000..15_000),
  feeling: FEELINGS.keys.sample.to_s,
  notes: 'Awesome Day!'
)

account.activity_running.create!(
  distance: distance,
  distance_unit: distance_unit,
  feeling: FEELINGS.keys.sample.to_s,
  notes: 'Awesome Day!'
)

account.activity_custom_workout.create!(
  title: 'Pushups',
  notes: '20, 20, 20, 15, 10',
  feeling: FEELINGS.keys.sample.to_s
)

account.activity_yoga_asana.create!(
  notes: 'New Asana',
  feeling: FEELINGS.keys.sample.to_s
)

# rubocop:disable Metrics/BlockLength
20.times do |idx|
  account.learning_article.create!(
    url: "https://example.com/#{idx}",
    title: "Post ##{idx}",
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Post!',
    created_at: DateTime.now - (rand * 21)
  )

  account.learning_podcast.create!(
    url: "https://example.com/#{idx}",
    title: "Episode ##{idx}",
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Podcast!',
    created_at: DateTime.now - (rand * 21)
  )

  account.learning_video.create!(
    url: "https://example.com/#{idx}",
    title: "Video ##{idx}",
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Video!',
    created_at: DateTime.now - (rand * 21)
  )

  account.learning_book.create!(
    title: "Book ##{idx}",
    author: "Author #{idx}",
    url: "https://example.com/#{idx}",
    status: LEARNING_BOOK_STATUSES.keys.sample.to_s,
    feeling: FEELINGS.keys.sample.to_s,
    notes: 'Awesome Book!',
    created_at: DateTime.now - (rand * 21)
  )
end
# rubocop:enable Metrics/BlockLength
