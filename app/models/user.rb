class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :clients, dependent: :destroy
  has_many :buses, dependent: :destroy
  has_many :operators, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :quotations, dependent: :destroy
  has_many :places, dependent: :destroy
end
