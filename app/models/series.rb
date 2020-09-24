class Series < ApplicationRecord
    has_many :sermons
    has_one_attached :seriesPic

    extend FriendlyId
    friendly_id :title, use: :slugged

    before_create :cleanData

    def cleanData
        self.slug = title.parameterize
        self.title = title.capitalize
    end


end
