# frozen_string_literal: true

class Account < ApplicationRecord
  include HTMLSanitizer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :zxcvbnable

  has_one_attached :avatar

  has_many :health_sleep, dependent: :destroy
  has_many :health_body_weight, dependent: :destroy
  has_many :health_body_measure, dependent: :destroy
  has_many :activity_outdoor_walk, dependent: :destroy
  has_many :activity_yoga_asana, dependent: :destroy
  has_many :learning_article, dependent: :destroy
  has_many :learning_podcast, dependent: :destroy
  has_many :learning_video, dependent: :destroy
  has_many :learning_book, dependent: :destroy

  before_validation :sanitize_username
  before_validation :sanitize_name
  before_validation :sanitize_bio

  validates :website, url: true, allow_blank: true

  private

  def sanitize_username
    self.username = sanitize_html(username)
  end

  def sanitize_name
    self.name = sanitize_html(name)
  end

  def sanitize_bio
    self.bio = sanitize_html(bio)
  end
end
