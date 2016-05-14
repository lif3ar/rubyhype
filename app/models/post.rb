class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { small: "350x250>", medium: "700x500#" },
                    default_url: "/images/:style/missing.png",
                    :storage => :ftp,
                    :path => "public_html/mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :url => "http://mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :ftp_servers => [
                        {
                            :host     => "ftp.mighty12.com",
                            :user     => "milieu",
                            :password => "ziraeprubu"
                        },
                    ],
                    :ftp_connect_timeout => 5, # optional, nil by default (OS default timeout)
                    :ftp_ignore_failing_connections => true, # optional, false by default
                    :ftp_keep_empty_directories => true # optional, false by default

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
