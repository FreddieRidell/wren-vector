import "./base" for Base

class Vector is Base {
	x { this[0] }
	y { this[1] }
	z { this[2] }
	w { this[3] }

	x=(val){ this[0] = val }
	y=(val){ this[1] = val }
	z=(val){ this[2] = val }
	w=(val){ this[3] = val }

	construct new(x, y){
		super(x, y)
	}

	construct new(x, y, z){
		super(x, y, z)
	}

	construct new(x, y, z, w){
		super(x, y, z, w)
	}
}
