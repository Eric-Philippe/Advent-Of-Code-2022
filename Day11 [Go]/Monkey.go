package main

import "fmt"

type transformer func(int) int

type Monkey struct {
	name  int
	data  []int
	op    transformer
	div   int
	dest1 int
	dest2 int
	done  int
}

func (m *Monkey) String() string {
	return fmt.Sprintf("Monkey %d: %v inspected %d", m.name, m.data, m.done)
}

func (m *Monkey) step(monkey []*Monkey) {
	for i := 0; i < len(m.data); i++ {
		new := m.op(m.data[i])
		if new%m.div == 0 {
			monkey[m.dest1].data = append(monkey[m.dest1].data, new)
		} else {
			monkey[m.dest2].data = append(monkey[m.dest2].data, new)
		}
		m.done++
	}
	m.data = m.data[:0]
}