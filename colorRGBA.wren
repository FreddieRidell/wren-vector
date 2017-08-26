import "./base" for Base

class Vector is Base {
	r { this[0] }
	g { this[1] }
	b { this[2] }
	a { this[3] }

	r=(val){ this[0] = val }
	g=(val){ this[1] = val }
	b=(val){ this[2] = val }
	a=(val){ this[3] = val }

	construct new(r, g){
		super(r, g)
	}

	construct new(r, g, b){
		super(r, g, b)
	}

	construct new(r, g, b, a){
		super(r, g, b, a)
	}
}

