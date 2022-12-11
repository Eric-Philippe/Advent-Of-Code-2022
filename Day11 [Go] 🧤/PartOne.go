package main

import (
	_ "embed"
	"sort"
)

func plus(a int) transformer {
	return func(b int) int {
		return a + b
	}
}

func mult(a int) transformer {
	return func(b int) int {
		return a * b
	}
}

func square() transformer {
	return func(b int) int {
		return b * b
	}
}

func div(a int, t transformer) transformer {
	return func(b int) int {
		return int(float64(t(b)) / float64(a))
	}
}

func mod(a int, t transformer) transformer {
	return func(b int) int {
		return t(b) % a
	}
}

func GenMonkeys(part int) []*Monkey {
	monkeys := []*Monkey{
		{0, []int{76, 88, 96, 97, 58, 61, 67}, mult(19), 3, 2, 3, 0},
		{1, []int{93, 71, 79, 83, 69, 70, 94, 98}, plus(8), 11, 5, 6, 0},
		{2, []int{50, 74, 67, 92, 61, 76}, mult(13), 19, 3, 1, 0},
		{3, []int{76, 92}, plus(6), 5, 1, 6, 0},
		{4, []int{74, 94, 55, 87, 62}, plus(5), 2, 2, 0, 0},
		{5, []int{59, 62, 53, 62}, square(), 7, 4, 7, 0},
		{6, []int{62}, plus(2), 17, 5, 7, 0},
		{7, []int{85, 54, 53}, plus(3), 13, 4, 0, 0},
	}
	for _, m := range monkeys {
		if part == 1 {
			m.op = div(3, m.op)
		} else {
			p := 2 * 17 * 19 * 3 * 5 * 13 * 7 * 11
			m.op = mod(p, m.op)
		}
	}
	return monkeys
}
func runPartOne() int {
	monkeys := GenMonkeys(1)
	for i := 0; i < 20; i++ {
		for _, m := range monkeys {
			m.step(monkeys)
		}
	}
	work := make([]int, len(monkeys))
	for i, m := range monkeys {
		work[i] = m.done
	}
	sort.Ints(work)
	return work[len(work)-1] * work[len(work)-2]
}