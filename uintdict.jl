
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
	function Dict{K,V}() where V where K
        size = 0
        capacity = 32
    	table = Vector{Tuple{K,V}}(undef, capacity)
    end

    # Copy constructor
    function UIntDict{K,V}(d::Dict{K,V}) where V where K
    	
    	table = Vector{Tuple{K,V}}(undef, d.capacity)
        
    	for pairs in d.table
    		# insert pair into table
    	end
    end
    	
    # Initialization constructor
    function UIntDict{K, V}(vec::Vector{Tuple{K, V}}) where {K, V}
        
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


# Get the value at the given key or otherwise
# return the default value if the key is empty
function get(d::UIntDict, key::UInt, default)

end


# Get the value at the given key or otherwise
# return the default value if the key is empty,
# setting it to the default value
function get!(d::UIntDict, key::UInt, default)

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
d = UIntDict(i => sqr(i) for i = 1:100)
