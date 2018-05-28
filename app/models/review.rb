class Review < ActiveRecord::Base
  belongs_to :operator

def year
  self.created_at.to_date.strftime('%G')
end

end
