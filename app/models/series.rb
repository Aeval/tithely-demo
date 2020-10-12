class Series < ApplicationRecord
    #Define relationships
    has_many :sermons
    has_one_attached :seriesPic

    #Use slugs for series in URLs rather than ID
    extend FriendlyId
    friendly_id :title, use: :slugged

    #Before save: create slug from title and capitialize first letter of title
    before_save :cleanData

    #Validate attachment format
    validate :seriesPic_format

    validates_presence_of :title

    def cleanData
        self.slug = title.parameterize
        self.title = title.strip.capitalize
    end

    private

    #Validate attachment format
    def seriesPic_format
        return unless seriesPic.attached?
        if seriesPic.blob.content_type.start_with? 'image/'
          if seriesPic.blob.byte_size > 10.megabytes
            errors.add(:seriesPic, 'size needs to be less than 10MB')
            seriesPic.purge
          end
         else
            seriesPic.purge
           errors.add(:seriesPic, 'needs to be an image')
         end
       end
    end
