package main


func testDivide() {
	if div(10)2 != 5 {
		panic("divide(10, 2) != 5")
	} else {
		println("divide(10, 2) == 5")
	}
}

func testModulo() {
	if mod(10, 2) != 2 {
		panic("modulo(10, 2) != 2")
	} else {
		println("modulo(10, 2) == 2")
	}
}

func testPlus() {
	if plus(10)(2) != 12 {
		panic("plus(10)(2) != 12")
	} else {
		println("plus(10)(2) == 12")
	}
}


func testMult() {
	if mult(10)(2) != 20 {
		panic("mult(10)(2) != 20")
	} else {
		println("mult(10)(2) == 20")
	}
}

func testSquare() {
	if square()(2) != 4 {
		panic("square()(2) != 4")
	} else {
		println("square()(2) == 4")
	}
}
