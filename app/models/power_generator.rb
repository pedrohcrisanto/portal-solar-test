class PowerGenerator < ApplicationRecord
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 40
  }
  validates :width, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  }
  validates :lenght, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 200
  }
  validates :weight, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 3000
  }
  paginates_per 6
  before_save :calc_cube_weight
  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]
  include PgSearch

  pg_search_scope :search, against: [:name], using: {
    tsearch: { prefix: true }
  }

  private

  def calc_cube_weight
    self.cube_weight = height * width * lenght * 300
  end
end
