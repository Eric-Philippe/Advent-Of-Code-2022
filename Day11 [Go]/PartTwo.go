package main

import (
	_ "embed"
	"sort"
)

func runPartTwo() int {
	monkeys := GenMonkeys(2)
	for i := 0; i < 10000; i++ {
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