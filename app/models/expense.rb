class Expense < ActiveRecord::Base
before_save :fecha

	def fecha
		self.fecha = "#{self.ano}-#{self.mes}-01 00:00:00"
	end

def month
  self.fecha.to_date.strftime('%G-%B')
end

end
