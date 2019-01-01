#The OdinProject, Advanced Ruby - Data Structures assignment. Linked list Class

class LinkedList

	attr_accessor :head, :tail
	
	def initialize
		@head = nil
		@tail = nil
	end

	def append data
	
		if @head.nil? # List is empty
			@head = Node.new(data)
			@tail = @head	
		else
			new_node = Node.new(data)
			new_node.next_node = @head
			@head = new_node
		end
	end
	
	def plist
		puts @head.data
	end
	
	def prepend data
		
		if @tail.nil? #List is empty
			@tail = Node.new(data)
			@head = @tail
		else
			new_node = Node.new(data)
			@tail.next_node = new_node
			@tail = new_node
		end
	end
	
	def size
		count = 0
		if @head.nil?
			count
		else
			current_node = @head
			while !current_node.next_node.nil?
				count += 1
				current_node = current_node.next_node
			end
			count += 1
		end
	end
	
	def head
		@head
	end
	
	def tail
		@tail
	end
	
	def at index #Assumes @head is index 0
		current_node = @head
		current_index = 0
		if self.size > index
			while !current_node.next_node.nil? 
				return current_node if current_index == index
				current_node = current_node.next_node
				current_index += 1
			end
		else
			return nil
		end
		return @tail
	end
	
	def pop
		size = self.size
		@tail = self.at(self.size - 2)
		@tail.next_node = nil
	end
	
	def contains? value
		current_node = @head
		while !current_node.next_node.nil? 
			return true if current_node.data == value
			current_node = current_node.next_node
		end
		return false
	end
	
	def find value
	
		index = 0
		current_node = @head
		while !current_node.next_node.nil? 
			return index if current_node.data == value
			current_node = current_node.next_node
			index += 1
		end
		# Check @tail
		return index if current_node.data == value
		# Not found, return nil	
		return nil
	end
	
	def to_s
		slist = []
		node = self.each_node { slist << current_node.data.to_s }
		slist << node.to_s
		
		slist.each {|a| p "( #{a} ) -> "}
		
	end
	
	def each_node
		current_node = @head
		while !current_node.next_node.nil?
			yield
			current_node = current_node.next_node
		end
	end
end

class Node

	attr_accessor :data, :next_node
	
	def initialize (value)
		@data = value
		@next_node = nil
	end

end

list = LinkedList.new
list.append 1
list.append 2
list.append 3
list.append 4

puts "Added 4 Nodes"
puts "#size says LinkedList has #{list.size} nodes"

list.append 5
puts "Added another node"
puts "#size says LinkedList has #{list.size} nodes"

puts "@head data is #{list.head.data}"

list.size # => 5
puts "Node at index 3 contains the data: #{list.at(3).data}"

puts "@tail data is #{list.tail.data}"
list.pop
puts "@tail data is #{list.tail.data}"

puts "The list contains 3" if list.contains?(3)
puts "The value 3 is at node #{list.find(3)}"

list.to_s

# >> Added 4 Nodes
# >> #size says LinkedList has 4 nodes
# >> Added another node
# >> #size says LinkedList has 5 nodes
# >> @head data is 5
# >> Node at index 3 contains the data: 2
# >> @tail data is 1
# >> @tail data is 2