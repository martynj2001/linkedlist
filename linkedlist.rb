#The OdinProject, Advanced Ruby - Data Structures assignment. Linked list Class

class LinkedList

	attr_accessor :head, :tail
	
	def initialize
		@head = nil
		@tail = nil
	end

	def append data
	
		if @head.nil? 
			@head = Node.new(data)	
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
		
		if @tail.nil?
			@tail = Node.new(data)
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
	
	end
	
	def tail
	
	end
	
	def at index
	
	end
	
	def pop
	
	end
	
	def contains?
	
	end
	
	def find data
	
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