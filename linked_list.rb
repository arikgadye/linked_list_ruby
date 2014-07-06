# Please develop a method to check that a linked list isn't cyclic.
# The list is 1-directional, and can cycle between nodes that aren't in their regular order in memory.

class Node
	attr_accessor :nxt, :value, :frequencies
	@frequencies = Hash.new(0)

	def initialize(val = nil)
		@value = val
	end

	def self.cyclic?(node)
		@frequencies[node.object_id] += 1
		if @frequencies[node.object_id] > 1
			return true
		elsif node.nil?
			return false
		end
 		cyclic?(node.nxt) #recursive call on the next node
	end

	def to_s
		"#{self.class}[#{self.object_id}] --> #{nxt.object_id}"
	end
end

# TESTS (trying to model a real world example)
#The first ten people have passed a message to ten random people out of 80. Goal: make sure everyone is connected with no repeats.
people = Array.new(50) {Node.new}

10.times {|idx| people[idx].nxt = people.sample }

puts people.join("\n")

puts "-"*50
people.each.with_index do |node, idx|
	node.nxt = people[idx + 1] unless node.nxt
end

puts people.join("\n")

p Node.cyclic?(people.first)

#TESTS
#linked_list number 1 (not cyclic)
# first = Node.new("first")
# second = Node.new("second")
# third = Node.new("third")

# #pointers
# first.nxt = second
# second.nxt = third
# third.nxt
# p Node.cyclic?(first) #false

# arik = Node.new("arik")
# bob = Node.new("bob")
# john = Node.new("john")

# #pointers
# arik.nxt = bob
# bob.nxt = john
# john.nxt = arik
# p Node.cyclic?(arik) #true

