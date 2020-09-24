class Series < ApplicationRecord
    has_many :sermons
    has_one_attached :seriesPic

    extend FriendlyId
    friendly_id :title, use: :slugged

    before_create :cleanData
    validate :avatar_format

    def cleanData
        self.slug = title.parameterize
        self.title = title.capitalize
    end

    private

    def avatar_format
        return unless seriesPic.attached?
        if seriesPic.blob.content_type.start_with? 'image/'
          if seriesPic.blob.byte_size > 10.megabytes
            errors.add(:avatar, 'size needs to be less than 10MB')
            seriesPic.purge
          end
         else
            seriesPic.purge
           errors.add(:avatar, 'needs to be an image')
         end
       end

end
