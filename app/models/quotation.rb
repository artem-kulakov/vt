class Quotation < ActiveRecord::Base
  belongs_to :user
  has_many :places, dependent: :destroy
end
