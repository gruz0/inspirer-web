# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :avatar

  has_many :health_sleep, dependent: :destroy
  has_many :health_body_weight, dependent: :destroy
  has_many :health_body_measure, dependent: :destroy
end
