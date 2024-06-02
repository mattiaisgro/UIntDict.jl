
#
# @class UIntDict
# An hash map with unsigned integer key and value
#


# Simple unsigned integer hash function with linear probing
function hashuint(key::UInt, size::UInt; coll::UInt = 0)

	return mod(mod(key, size) + coll, size) + 1
end



mutable struct UIntDict{K,V} <: AbstractDict{K, V}
	

	# Vector holding pairs
	table::Vector{Tuple{K, V}}

	# Total capacity of the table
	capacity::UInt

	# Number of allocated pairs
	size::UInt


	# Default constructor
	function UIntDict{K,V}() where V where K

		if !isa(K, UInt)
			# ERROR: Keys are not unsigned integer type!
		end

        size = 0
        capacity = 32
    	table = Vector{Tuple{K,V}}(undef, capacity)
    end

    # Copy constructor
    function UIntDict{K,V}(d::Dict{K,V}) where V where K

    	if !isa(K, UInt)
    		# ERROR: Keys are not unsigned integer type!
    	end

    	
    	table = Vector{Tuple{K,V}}(undef, d.capacity)
        
    	for pairs in d.table
    		# insert pair into table
    	end
    end
    	
    # Initialization constructor
    function UIntDict{K, V}(vec::Array{Tuple{K, V}}) where V where K

    	if !isa(K, UInt)
    		# ERROR: Keys are not unsigned integer type!
    	end

        
    	table = Vector{Tuple{K,V}}(undef, length(vec))

        for pair in vec
        	# insert pair into table
        end
    end


    # Initialization constructor
    function UIntDict{K, V}(pairs::Pair...) where {K, V}
        
        table = Vector{Tuple{K,V}}(undef, length(pairs))

        for pair in pairs
        	# insert pair into table
        end
    end
	
end


# Insert a key-value pair into the hash map
function insert!(d::UIntDict, key::UInt, value)

	for coll in 0:(length(d.table) - 1)

		index = hashuint(key, coll)
		
		# The key-value pair was found
		if(table[index].first == key)
			table[index] = (key, value)
		end

		# No collision => the key doesn't exist
		if(table[index].first == undef)
			table[index] = (key, value)
		end
	end

	# TO-DO Max collisions! Reallocate table immediately
end


# Get the value at the given key or otherwise
# return the default value if the key is empty
function get(d::UIntDict, key::UInt, default)

	# The maximum number of collisions is N - 1
	for coll in 0:(length(d.table) - 1)

		index = hashuint(key, coll)
		
		# The key-value pair was found
		if(table[index].first == key)
			return table[index].second
		end

		# No collision => the key doesn't exist
		if(table[index].first == undef)
			return default
		end
	end

	# TO-DO If all pairs collide, reallocate table immediately
	return default
end


# Get the value at the given key or otherwise
# return the default value if the key is empty,
# setting it to the default value
function get!(d::UIntDict, key::UInt, default)

	# The maximum number of collisions is N - 1
	for coll in 0:(length(d.table) - 1)

		index = hashuint(key, coll)
		
		# The key-value pair was found
		if(table[index].first == key)
			return table[index].second
		end

		# No collision => the key doesn't exist
		if(table[index].first == undef)

			# Set to default
			table[index] = (key, default);
			return default
		end
	end

	# TO-DO If all pairs collide, reallocate table immediately
	return default
end


# Delete the key value pair associated with the given key
function delete!(d::UIntDict, key::UInt)

end


# Delete and then return the value associated with
# the given key if it exists, otherwise return default
function pop!(d::UIntDict, key::UInt; default)

end


# Set a key value pair in the dictionary
function setindex!(d::UIntDict, val::UInt, key::UInt)
	
	# Find the key value pair if it already exists
	# or iterate to find the first empty pair after collisions
end


# Get the index of a key value pair with
# the given key
function getindex(d::UIntDict, key::UInt)

	# Iterate over the table by probing
	# and comparing the key to the pair's key
end


# Return whether the dictionary has a value corresponding
# to the given key
function haskey(d::UIntDict, key::UInt)

	# Iterate over possible locations of the key-value pair
	# by considering hash and collisions, up to n maximum collisions
end


function sizehint!(d::UIntDict, size)
	
	# Allocate at least <size> memory in d
	# If d was already initialized, copy the new table
end


# Return the key if the dictionary has an associated value,
# otherwise return the default value
getkey(d::UIntDict, key::UInt, default) = haskey(d, key) ? key : default


# Test UIntDict

# Square a number
function sqr(x)
	x * x
end

# Construct a dictionary using a generator
d = UIntDict{UInt, UInt}(1 => 2, 2 => 3)
