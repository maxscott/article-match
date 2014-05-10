class IndexInverter
  def invert keywords, parent
    ret = {}
    keywords.each { |k| ret[k[:name]] = {parent => k[:val]} }
    ret
  end

  def join inversion1, inversion2
    inversion2.keys.each do |word|
      if inversion1[word] == nil
        inversion1[word] = inversion2[word]
      else
        inversion1[word] = inversion1[word].merge inversion2[word]
      end
    end
    inversion1
  end
end