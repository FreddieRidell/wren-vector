class Vector {
	x { _x }
	y { _y }
	z { _z }
	w { _w }
	size { _size }

	toString { 
		if( _size == 2 ){
			return "[ %( _x ), %( _y ), ]"
		}
		if( _size == 3 ){
			return "[ %( _x ), %( _y ), %( _z ), ]"
		}
		if( _size == 4 ){
			return "[ %( _x ), %( _y ), %( _z ), %( _w ), ]"
		}
	}

	magnitude { 
		var acc = 0
		for ( i in 0..._size ){
			acc = acc + ( this[i] * this[i] )
		}
		return acc.sqrt
	}

	normalise { this / this.magnitude }

	abs { 
		var v = Vector.ofSize(_size)
		for( i in 0..._size ){
			v[i] = this[i].abs
		}

		return v
	}
	
	floor { 
		var v = Vector.ofSize(_size)
		for( i in 0..._size ){
			v[i] = this[i].floor
		}

		return v
	}
	
	ceil { 
		var v = Vector.ofSize(_size)
		for( i in 0..._size ){
			v[i] = this[i].ceil
		}

		return v
	}

	[ i ] {
		if(i == 0){
			return _x
		}
		if(i == 1){
			return _y
		}
		if(i == 2 && _size > 2){
			return _z
		}
		if(i == 3 && _size > 2){
			return _w
		}

		return null
	}

	x=(val){ _x = val }
	y=(val){ _y = val }
	z=(val){ _z = val }
	w=(val){ _w = val }

	[ i ]=(val) {
		if(i == 0){
			_x = val
		}
		if(i == 1){
			_y = val
		}
		if(i == 2 && _size > 2){
			_z = val
		}
		if(i == 3 && _size > 2){
			_w = val
		}

		return null
	}

	== (other) {
		if( _size != other.size ){
			Fiber.abort("can not compare vectors of un-equal size")
		}

		var acc = true
		for ( i in 0..._size ){
			acc = acc && this[i] == other[i]
		}
		return acc
	}

	+ (other) {
		if( _size != other.size ){
			Fiber.abort("can not add vectors of un-equal size")
		}

		var v = Vector.ofSize(_size)
		for ( i in 0..._size ){
			v[i] = this[i] + other[i]
		}
		return v
	}

	- (other) {
		if( _size != other.size ){
			Fiber.abort("can not subtract vectors of un-equal size")
		}

		var v = Vector.ofSize(_size)
		for ( i in 0..._size ){
			v[i] = this[i] - other[i]
		}
		return v
	}

	* (other) {
		if(other is Vector){
			if( _size != other.size ){
				Fiber.abort("can not divide vectors of un-equal size")
			}

			var v = Vector.ofSize(_size)
			for ( i in 0..._size ){
				v[i] = this[i] * other[i]
			}
			return v
		} 

		if (other is Num) {
			var v = Vector.ofSize(_size)
			for ( i in 0..._size ){
				v[i] = this[i] * other
			}
			return v
		}

		Fiber.abort("can only multiply a Vector by a Num or another Vector")
	}

	/ (other) {
		if(other is Vector){
			if( _size != other.size ){
				Fiber.abort("can not divide vectors of un-equal size")
			}

			var v = Vector.ofSize(_size)
			for ( i in 0..._size ){
				v[i] = this[i] / other[i]
			}
			return v
		} 

		if (other is Num) {
			var v = Vector.ofSize(_size)
			for ( i in 0..._size ){
				v[i] = this[i] / other
			}
			return v
		}

		Fiber.abort("can only divide a Vector by a Num or another Vector")
	}

	dot(other) {
		//the dot product, returns a Num
		if( _size != other.size ){
			Fiber.abort("can not dot product vectors of un-equal size")
		}

		var acc = 0
		for ( i in 0..._size ){
			acc = acc + ( this[i] * other[i] )
		}

		return acc
	}

	cross(other) {
		//the cross product, returns a Vector
		if( _size != 3 ){
			Fiber.abort("can only cross product vectors of size 3")
		}

		var x = ( this[1] * other[2] ) - ( this[2] * other[1] )
		var y = ( this[2] * other[0] ) - ( this[0] * other[2] )
		var z = ( this[0] * other[1] ) - ( this[1] * other[0] )

		return Vector.new(x, y, z)
	}

	construct new(x, y) {
		_size = 2
		_x = x
		_y = y
	}

	construct new(x, y, z) {
		_size = 3
		_x = x
		_y = y
		_z = z
	}

	construct new(x, y, z, w) {
		_size = 4
		_x = x
		_y = y
		_z = z
		_w = w
	}

	static ofSize(n) {
		if( n == 2 ){
			return Vector.new(0, 0)
		}
		if( n == 3 ){
			return Vector.new(0, 0, 0)
		}
		if( n == 4 ){
			return Vector.new(0, 0, 0, 0)
		}
	}
}
