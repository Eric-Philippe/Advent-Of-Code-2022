mod day12;

use std::convert::TryInto;

fn parse(input: &str) -> Vec<Vec<(u8, u8)>> {
    input.lines()
        .map(|l| l.as_bytes()
            .iter()
            .map(|&c| (c, match c {
                b'S' => 1,
                b'E' => 26,
                _ => c - b'a' + 1,
            }))
            .collect())
        .collect()
}

fn bfs(
    grid: &[Vec<(u8, u8)>],
    start: (usize, usize),
    end: (usize, usize),
) -> Option<u32> {
    std::iter::once((
        std::collections::VecDeque::from([(start, 0)]),
        vec![vec![false; grid[0].len()]; grid.len()],
    )).fold(None, |a, (mut q, mut v)| {
        while let Some((pos, dist)) = q.pop_front() {
            match pos {
                _ if pos == end => return Some(dist),
                (x, y) => IntoIterator::into_iter([(-1, 0), (1, 0), (0, -1), (0, 1)])
                    .into_iter()
                    .flat_map(|(dx, dy)| Some((
                        TryInto::<usize>::try_into((x as isize) + dx).ok()?,
                        TryInto::<usize>::try_into((y as isize) + dy).ok()?)))
                    .filter(|&(a, b)| a < grid.len() && b < grid[0].len())
                    .filter(|&(a, b)| grid[a][b].1 <= grid[x][y].1 + 1)
                    .for_each(|(a, b)| if !v[a][b] {
                        (0..2).for_each(|i| match i {
                            0 => v[a][b] = true,
                            _ => q.push_back(((a, b), dist + 1)),
                        })
                    })
            }
        }

        a
    })
}