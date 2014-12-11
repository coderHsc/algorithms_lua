--lua 实现的双向队列
queue = {}

function queue.new()
	return {first = 0,last = -1 }
end

function queue.pushBack(queue,value)
	local last  = queue.last + 1
	queue.last  = last
	queue[last] = value
end

function queue.pushFront(queue,value)
	local first  = queue.first -1
	queue.first  = first
	queue[first] = value
end

function queue.popBack(queue)
	local last = queue.last
   	if queue.first > last then
       print("List is empty")
   	end
   	local value = queue[last]
   	queue[last] = nil
   	queue.last = last - 1
   	return value
end

function queue.popFront(queue)
	local first = queue.first

    if first > queue.last then
         print("List is empty")
    end

    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
end

function queue.isEmpty(queue)
	if queue.first > queue.last then 
		return true 
	end
	return false 
end

function queue.clear(queue)
	queue.first = 0 
	queue.last  = -1
end

function queue.copy(copyQueue)
	local tmpQueue = queue.new()
	while queue.isEmpty(copyQueue) == false do 
		local value = queue.popFront(copyQueue)
		queue.pushBack(tmpQueue,value)
	end
	return tmpQueue
end