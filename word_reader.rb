class WordReader
	def run
		file = File.new("words.txt", "r")
		words = []
		while line = file.gets
			words << line.chomp
		end
		words
	end
end
