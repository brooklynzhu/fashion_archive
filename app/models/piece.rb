class Piece < ActiveRecord::Base
  belongs_to :client
  belongs_to :pickup
  belongs_to :delivery

  def self.search(search)
    where('designer LIKE ?', "%#{search}%")
  end

  
  CATEGORIES = %w[Garments Bags Shoes Accessories]
  LOCATIONS = ["On Site", "At Client"]
  CONDITIONS = %w[New Good Fair Poor]

  has_attached_file :photo, 
          styles: {
                thumb: '100x100>',
                square: '200x200#',
                medium: '300x300>'
              },
          :bucket => :fashionarchive

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :photo, :designer, :description, :size, :color, :pattern, :material, :category, :sub_category, :location, :condition, presence: true


end
