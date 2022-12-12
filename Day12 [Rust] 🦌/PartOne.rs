mod day12;

use std::convert::TryInto; 

fn solve(input: &str, start_at: u8) -> u32 {
    std::iter::once(parse(input))
        .map(|grid| (
            (0..grid.len())
                .flat_map(|row| std::iter::repeat(row)
                    .zip(0..grid[0].len()))
                .collect::<Vec<_>>(),
            grid
        ))
        .flat_map(|(coords, grid)| Some((
            coords.iter()
                .copied()
                .filter(|&(x, y)| grid[x][y].0 == start_at)
                .collect::<Vec<_>>(),
            coords.iter()
                .copied()
                .find(|&(x, y)| grid[x][y].0 == b'E')?,
            grid,
        )))
        .fold(0, |_, (start, end, grid)| {
            start.into_iter()
                .flat_map(|start| bfs(&grid, start, end))
                .min()
                .unwrap_or_default()
        })
}

pub fn part1(input: &str) -> u32 {
    solve(input, b'S')
}