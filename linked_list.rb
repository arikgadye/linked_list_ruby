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
 		if nxt.object_id == 8
 			"#{self.value} -- >"
 		else
 			"#{self.value} --------> #{nxt.value}"
 		end
 	end
 end


#Fun little program that randomly connects 0-8 nodes to eachother, then proceeds to connect all of the nodes in an acylic manner.
people = %w[Albert Alex Allison Ariel Arik Brian
	Bridgette Chandler Ernie Gannon Hethe Jared
	John Justin Kendall Lauren Matthew Michele
	Morgan Patrick Phillip Premila Puru Steven
	Tony William].shuffle.map {|name| Node.new(name)}

	people_sample = people

	rand(0..8).times {|idx| people[idx].nxt = 
		people_sample.delete_at(rand(people_sample.length))}

	puts people.join("\n")
	puts "-"*50

	people.each.with_index do |node, idx|
		node.nxt = people[idx + 1] unless node.nxt
	end

	puts people.join("\n")
	puts Node.cyclic?(people.first)



# #TESTS
# #linked_list number 1 (not cyclic)
# # first = Node.new("first")
# # second = Node.new("second")
# # third = Node.new("third")

# # #pointers
# # first.nxt = second
# # second.nxt = third
# # third.nxt
# # p Node.cyclic?(first) #false

# # arik = Node.new("arik")
# # bob = Node.new("bob")
# # john = Node.new("john")

# # #pointers
# # arik.nxt = bob
# # bob.nxt = john
# # john.nxt = arik
# # p Node.cyclic?(arik) #true

