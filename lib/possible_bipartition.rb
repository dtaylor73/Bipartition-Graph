require_relative './queue_implementation.rb'

# bfs
def possible_bipartition(dislikes)

  return true if dislikes.length == 0
  
  # one node can't be associated with both groups

  q = Queue.new

  # add first node to queue to start it
  start_node = 1
  q.enqueue(start_node)
  
  # create hash to document when a node has been visited
  visited = {}


  # set all nodes equal to false at first since none of them have been visited
  dislikes.length.times do |node|
    visited[node] = false
  end

  
  while !q.empty? do

    # remove a node from the queue when you are analyzing it
    current = q.dequeue

    # if that node has not been visitied, set its value equal to true. If it has already been visited, return false. 
    # one node can't be associated with more than one group.
    if !visited[current] 
      visited[current] = true
    elsif visited[current] 
      return false
    end 

    # pull adjacent nodes from the current node
    adjacent_nodes = dislikes[current]

    i = 0

    # check if adjacent nodes have already been visited. If it hasn't, add it to the queue
    while i < adjacent_nodes.length do

      if !visited[adjacent_nodes[i]] 
        q.enqueue(adjacent_nodes[i])
      end 
      i += 1
    end
  end

  return true
end


#dfs
def possible_bipartition(dislikes)

  return true if dislikes.length == 0


  stack = []
  starting_node = 1
  stack.push(starting_node)

  visited = {}

  node = 0 

  while node < dislikes.length 
    visited[node] = false
    node += 1
  end 


  while stack.length != 0 
    # you don't pop until you get a childless node 
    current_node = stack.pop

    if visited[current_node] == false
      visited[current_node] = true 
    else 
      return false 
    end 

    adjacent_nodes = dislikes[current_node]

    i = 0

    while i < adjacent_nodes.length 
      if !visited[adjacent_nodes[i]]
        stack.push(adjacent_nodes[i])
      end 
      i += 1
    end 
  end 

  return true
end





