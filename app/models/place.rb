class Place < ActiveRecord::Base
  belongs_to :quotation
  belongs_to :user

before_save :geocode_endpoints

  private
  #To enable Geocoder to works with multiple locations
  def geocode_endpoints
    if address_changed?
      geocoded = Geocoder.search(address).first
    if address.present?
      if geocoded
        self.latitude = geocoded.latitude
        self.longitude = geocoded.longitude  
      else
        self.errors.add(:base, "Error, la dirección de salida no es válida")
        return false
      end
    end

    end
  end

end
