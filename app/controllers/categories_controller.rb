# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Client.order(:razon_social).where('razon_social like ?', "%#{params[:term.upcase]}%")
    render json: @categories.map(&:razon_social)
  end
end
