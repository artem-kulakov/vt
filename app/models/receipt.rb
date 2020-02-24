class Receipt < ActiveRecord::Base
  belongs_to :bus
  belongs_to :expense

before_save :categoria
before_save :cantidad
before_save :nota
before_save :fecha

	def categoria
		self.categoria = self.expense.categoria
	end

	def cantidad
		self.cantidad = self.expense.cantidad
	end

	def nota
		self.nota = self.expense.nota
	end

	def fecha
		self.fecha = self.expense.fecha
	end

def month
  self.fecha.to_date.strftime('%G-%B')
end

  def year
    self.fecha.to_date.strftime('%G')
  end


end
