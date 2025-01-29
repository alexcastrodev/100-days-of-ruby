trace = TracePoint.new(:c_call) do |trace|
  puts "C method called: #{trace.callee_id} | Defined in: #{trace.defined_class}"
end

trace.enable

string = "hello"

# C method called: upcase | Defined in: String
string.upcase

# C method called: disable | Defined in: TracePoint
trace.disable