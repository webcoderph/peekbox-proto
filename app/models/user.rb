class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

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
	has_many :picture, :through => :album
	has_many :comments

end
