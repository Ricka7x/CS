class Course < ActiveRecord::Base
	has_many :tasks
	has_many :subscriptions
	has_many :users, through: :subscriptions

	  validates :name, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 500 }
    validates :price, presence: true, numericality: { only_integer: true }

    has_attached_file :image, styles: { medium: "680x370.24>", thumb: "275.5x150>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	def price_in_cents
  		price * 100
  	end
end
