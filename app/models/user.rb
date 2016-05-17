class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { small: "35x35>", medium: "300x300#" },
                    default_url: "/avatars/:style/missing.png",
                    :storage => :ftp,
                    :path => "public_html/mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :url => "http://mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :ftp_servers => [
                        {
                            :host     => "ftp.mighty12.com",
                            :user     => "milieu",
                            :password => "ziraeprubu",
                            :passive  => true
                        },
                    ],
                    :ftp_connect_timeout => 5, # optional, nil by default (OS default timeout)
                    :ftp_ignore_failing_connections => true, # optional, false by default
                    :ftp_keep_empty_directories => true # optional, false by default

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :posts, dependent: :destroy
  has_many :comments
end
