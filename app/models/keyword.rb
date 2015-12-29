class Keyword < ActiveRecord::Base
  before_validation :upcase_keyword

  validates_uniqueness_of :keyword

  private

  def upcase_keyword
    self.keyword = self.keyword.upcase
  end
end
