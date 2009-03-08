=begin
  analyzer.rb
  Your text analyzer will provide the following basic statistics:

   1. Character count
   2. Character count (excluding spaces)
   3. Line count
   4. Word count
   5. Sentence count
   6. Paragraph count
   7. Average number of words per sentence
   8. Average number of sentences per paragraph

=end

# Analyze the file for statistics
def analyze_file(file)
  empty_line = false
  stats  = Hash.new() {|k,v| k[v] = 0}
  file.each do |line|
    stats[:line_count] += 1
    stats[:char_count] += line.length
    stats[:count_non_space] += line.length - line.count(" ")
    stats[:word_count] += line.split(' ').length
    stats[:sentence_count] += line.scan(/[.!?]{1}/).length
    
    #prevent double empty lines from being counted.
    if (line.strip == '')
      stats[:paragraph_count] += 1 unless empty_line
      empty_line = true
    else
      empty_line = false
    end
  end
  
  # Last paragraph not counted if no blank line after it
  stats[:paragraph_count] += 1 unless empty_line
  return stats
end

file = File.open("text.txt", 'r+')
stats = analyze_file(file)

stats.each {|k,v| puts "#{k.id2name} is #{stats[k]}"}


