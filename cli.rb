input_array = ARGV.each do |arg|
  if arg.start_with?('--day=')
    splitted = arg.split('=')
    @day = splitted.size > 1 ? arg.split('=').last : nil
  end
end

if @day.nil? || @day.empty?
  puts "use the flag day for create a new one: --day=" 
  return
end

new_day_content = <<~FILE
\n# Day #{@day}

Write a new knowledge

[See example](./day_#{@day}.rb)
FILE

challenges = File.write("CHALLENGES.md", new_day_content, mode: "a")