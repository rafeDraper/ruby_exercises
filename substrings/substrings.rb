class Excercise
    def self.count_string(search, array)
        result = Hash.new
        search = search.downcase


        array.each do |e|
            times = search.scan(e).count
            result[e] = times if times > 0
        end
        result
    end
end

# Aditional dictionary made along side codeacademy

puts "Ok, lets make a dictionary, please enter some sort of words, poem, whatever you think, but at least make a sentence"
text = gets.chomp

words = text.split(" ")
frequencies = Hash.new(0)

words.each do |word|
  word = frequencies[word] += 1
end

frequencies = frequencies.sort_by do |word, count|
  count
end
frequencies.reverse!

frequencies.each do |word, value|
	puts word + " " + value.to_s
end
