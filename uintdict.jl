
#
# @class UIntDict
# An hash map with unsigned integer key and value
#


# Simple unsigned integer hash function with linear probing
function hashuint(key::UInt, size::UInt; coll::UInt = 0)

	return ((key % size) + coll) % size
end



mutable struct UIntDict{K,V} <: AbstractDict{K,V} where K where V
	
	# Vector holding pairs
	table::Vector{Tuple{K, V}}

	# Total capacity of the table
	capacity::UInt

	# Number of allocated pairs
	size::UInt


	# Default constructor
	function Dict{K,V}() where V where K
        size = 0
        capacity = 0
    	# table = empty vector
    end

    # Copy constructor
    function UIntDict{K,V}(d::Dict{K,V}) where V where K
    	# allocate table with same size
        # copy pairs from d to this
    end
    	
    # Initialization constructor
    function UIntDict{K, V}(vec::Vector{Tuple{K, V}}) where {K, V}
        # allocate table
        # insert pairs into table
    end


    # Initialization constructor
    function UIntDict{K, V}(pairs::Pair...) where {K, V}
        
        # allocate table
        # insert pairs into table

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


function getkey(d::UIntDict, key::UInt, default)

end


function delete!(d::UIntDict, key::UInt)

end


function pop!(d::UIntDict, key::UInt; default)

end


function setindex!(d::UIntDict, val::UInt, key::UInt)

end


function getindex(d::UIntDict, key::UInt)

end


# Return whether the dictionary has a value corresponding
# to the given key
function haskey(d::UIntDict, key::UInt)

	# Iterate over possible locations of the key-value pair
	# by considering hash and collisions
end


function sizehint!(d::UIntDict, size)
	
	# Allocate at least <size> memory in d
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
