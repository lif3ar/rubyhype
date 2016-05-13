class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { small: "350x250>", medium: "700x500#" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
