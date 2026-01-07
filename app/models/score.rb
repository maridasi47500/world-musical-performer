class Score < ApplicationRecord
belongs_to :musicalinstrument
before_create :hey
before_update :hey
def hey
    @results=`ruby instrumentscorebing.rb "#{composer}" "#{title}" "#{link}" "#{musicalinstrument.description}" `
    self.scores=@results


end
end
