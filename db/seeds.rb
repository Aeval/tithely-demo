# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

25.times do
    Series.create(
        title: Faker::Lorem.unique.sentence
    )
end

25.times do
    Sermon.create(
        title: Faker::Lorem.unique.sentence,
        description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 3),
        series_id: Faker::Number.between(from: 0, to: 25)
    )
end