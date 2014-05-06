class WordReader
	def run
		file = File.new("words.txt", "r")

		words = []
		while line = file.gets
			words << line.chomp
			puts "...#{line}"
		end
		print "\n"
		words
	end
end
