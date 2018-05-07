class Expense < ActiveRecord::Base
has_many :receipts, dependent: :destroy
accepts_nested_attributes_for :receipts, :reject_if => lambda { |a| a[:bus_id].blank? }, :allow_destroy => true
before_save :fecha

	def fecha
		self.fecha = "#{self.ano}-#{self.mes}-01 00:00:00"
	end

def month
  self.fecha.to_date.strftime('%G-%B')
end

end
