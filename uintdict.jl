
#
# UIntDict
# An hash map with unsigned integer key and value
#


# Nearest primes to powers of 2
const uint_sizes = [
	31, 61, 127, 251, 509, 1021, 2039, 4093,
	8191, 16381, 32749, 65521, 131071, 262139, 524287,
	1048573, 2097143, 4194301 ]


# Simple unsigned integer hash function with linear probing
hashuint(key::UInt, size::UInt; coll::UInt = 0) = mod(mod(key, size) + coll, size) + 1



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

		new(Vector{Tuple{K,V}}(undef, 32), 32, 0)
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

		new(table, d.capacity, d.size)
	end
		

	# Initialization constructor
	function UIntDict{K, V}(vec::Array{Tuple{K, V}}) where V where K

		if !isa(K, UInt)
			# ERROR: Keys are not unsigned integer type!
		end

		
		new_dict = UIntDict{K, V}()

		for pair in vec
			# insert pair into table
		end

		return new_dict
	end


	# Initialization constructor
	function UIntDict{K, V}(pairs::Pair...) where {K, V}

		new_dict = UIntDict{K, V}()
		sizehint!(new_dict, length(pairs))

		for pair in pairs
			new_dict[pair.first] = pair.second
		end

		return new_dict
	end
	
end


# Reallocate the hashmap with a reallocation strategy
function reallocate(d::UIntDict)

	# Choose primes near powers of 2 ?
	sizehint!(d, 2 * d.capacity);
	
end


# Insert a key-value pair into the hash map
function insert!(d::UIntDict, key::UInt, value)

	for coll in 0:(length(d.table) - 1)

		index = hashuint(key, coll)
		
		# No collision => the key doesn't exist
		if(table[index].first == undef)
			table[index] = (key, value)
			return
		end

		# The key-value pair was found
		if(table[index].first == key)
			table[index] = (key, value)
			return
		end
	end

	# TO-DO Max collisions! Reallocate table immediately
	reallocate(d)
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

	reallocate(d)
	return default
end


# Delete the key value pair associated with the given key
function delete!(d::UIntDict, key::UInt)

	for coll in 0:(length(d.table) - 1)
		
		index = hashuint(key, coll)

		if d.table[index].first == key
			d.table[index] = undef
			break;
		end
	end
end


# Delete and then return the value associated with
# the given key if it exists, otherwise return default
function pop!(d::UIntDict, key::UInt; default)

	for coll in 0:(length(d.table) - 1)

		index = hashuint(key, coll)

		if d.table[index].first == key
			value = d.table[index].second
			d.table[index] = undef
			return value
		end

	end

	return default;
end


# Set the value associated to a given key
function setindex!(d::UIntDict, value, key::UInt)
	
	# Find the key value pair if it already exists
	# or iterate to find the first empty pair after collisions
end


# Get the value stored at the given key
function getindex(d::UIntDict, key::UInt)

	# Iterate over the table by probing
	# and comparing the key to the pair's key
end


# Return whether the dictionary has a value corresponding
# to the given key
function haskey(d::UIntDict, key::UInt)

	for coll in 0:(length(d.table) - 1)
		
		# The key was found
		if d.table[index].first == key
			return true
		end

		# No collision => Key doesn't exist
		if d.table[index] == undef
			return false
		end
	end

	# Max collisions
	return false
end


function sizehint!(d::UIntDict, size)
	
	# Allocate at least <size> memory in d
	# If d was already initialized, copy the new table
end


# Return the key if the dictionary has an associated value,
# otherwise return the default value
getkey(d::UIntDict, key::UInt, default) = haskey(d, key) ? key : default


# Test UIntDict


d = UIntDict{UInt, UInt}(1 => 2, 2 => 3)
println(d.table)
