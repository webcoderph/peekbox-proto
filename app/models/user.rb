class User < ActiveRecord::Base
	after_update :reprocess_profile, :if => :cropping?
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	mount_uploader :profilepic, ProfileUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :crop_x, :crop_y, :crop_w, :crop_h
	attr_accessor :crop_x, :crop_y, :crop_h, :crop_w

	scope :is_admin, where(:admin => true)

	validates	 :username, :uniqueness => true, :presence => true

	has_many :friends, :through => :friendships
	has_many :friendships, :dependent => :destroy
	#has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
	#has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
	#has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
	#has_many :friends, :through => :friendships, :condition => "status = 'accepted'"
	has_many :events
	has_many :videos
	has_many :albums
	has_many :pictures, :through => :albums
	has_many :comments
	
	def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def profile_geometry
    img = Magick::Image::read(self.profilepic_url).first
    @geometry = {:width => img.columns, :height => img.rows }
  end

	private
  def reprocess_profile
    self.profilepic.recreate_versions!
  end

end
