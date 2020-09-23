class Series < ApplicationRecord
    has_many :sermons
    has_one_attached :seriesPic

    before_create :cleanData

    def cleanData
        self.slug = title.parameterize
        self.title = title.capitalize
    end


end
