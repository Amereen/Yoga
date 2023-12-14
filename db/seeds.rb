# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
new_youga1 = Yoga.create(
  name: 'Extended Yoga Session',
  description: 'Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health. Yoga was developed as a spiritual practice thousands of years ago. Today, most Westerners who do yoga do it for exercise or to reduce stress.',
  duration: 30,
  video_url: 'GK28p-OdM4Y'
)

new_youga1.picture.attach( io: File.open(Rails.root.join('db/images/avrielle-suleiman-GpVak9-cL6E-unsplash.jpg')),
                           filename: 'avrielle-suleiman-GpVak9-cL6E-unsplash.jpg')

new_youga2 = Yoga.create(
  name: 'Quick Yoga Session',
  description: 'Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health. Yoga was developed as a spiritual practice thousands of years ago. Today, most Westerners who do yoga do it for exercise or to reduce stress.',
  duration: 10,
  video_url: 'klmBssEYkdU'
)
new_youga2.picture.attach( io: File.open(Rails.root.join('db/images/yannic-laderach-Dqx4XWuXu7w-unsplash.jpg')),
                           filename: 'yannic-laderach-Dqx4XWuXu7w-unsplash.jpg')


new_youga3 = Yoga.create(
  name: 'Standard Yoga Session',
  description: 'This balancing and strength-building Feel Good Flow practice assists you in developing both stability and flexibility in your joints while connecting and moving from your core. With a focus on the upper body, prepare to use asana and breath technique to move your whole body, regulate your nervous system, and release tension in the neck and shoulders. Use this time to connect to your breath, learn more about your current mental state, and cultivate an abundance of peace within.',
  duration: 25,
  video_url: '62rrpPfiAoI'
)
new_youga3.picture.attach( io: File.open(Rails.root.join('db/images/patrick-malleret-p-v1DBkTrgo-unsplash.jpg')),
                           filename: 'patrick-malleret-p-v1DBkTrgo-unsplash.jpg')