# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

series = Series.create([
    {
        title: "Accepting God Into Your Life"
    },
    {
        title: "Prayer On The Go"
    }
])

sermons = Sermon.create([
    {
        title: "Accepting God Into Your Home",
        description: "The sermon will walk you through the best steps you can take in order to bring God more fully into your home every day.",
        series: series.first
    },
    {
        title: "Accepting God Into Your Workplace",
        description: "The sermon will walk you through the best steps you can take in order to bring God more fully into your work environment every day.",
        series: series.first
    }
])