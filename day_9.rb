@day = 1
new_day_content = <<~FILE
\n# Day #{@day}

Write a new knowledge

[See example](./day_#{@day}.rb)
FILE

puts 'I can write a file (File.write), with append mode, instead replace all content with the following line:'

puts "\nFile.write('CHALLENGES.md', new_day_content, mode: 'a')"