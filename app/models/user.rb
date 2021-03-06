class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def notifications
    received_notifications + sent_notifications
  end

  def requested?(request = Request, user_2_id)
    request.where(user_1: self.id, user_2: user_2_id, status: 'pending').length > 0
  end

  def requests
    { received: received_requests, sent: sent_requests }
  end

  private

  def received_notifications(request = Request)
    request.where(user_2: self.id, status: 'pending').length
  end

  def sent_notifications(request = Request)
    request.where(user_1: self.id, status: 'accepted').length
  end

  def sent_requests(request = Request)
    {
      pending: request.where(user_1: self.id, status: 'pending'),
      accepted: request.where(user_1: self.id, status: 'accepted')
    }
  end

  def received_requests(request = Request)
    {
      pending: request.where(user_2: self.id, status: 'pending'),
      accepted: request.where(user_2: self.id, status: 'accepted')
    }
  end
end
