module Similarity
  def self.magnitude list
    Math.sqrt( list.map { |a| a ** 2}.inject(:+) )
  end

  def self.all_magnitudes article_list
    mags = {}
    article_list.each { |a| mags[a.id] = magnitude(a.keywords.map { |w| w[:val] }) }
    mags
  end
end