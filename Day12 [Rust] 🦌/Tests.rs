mod day12;

use std::convert::TryInto;

#[test]
fn test_parse() {
    let input = "aSbS"
        .lines()
        .map(|l| l.as_bytes()
            .iter()
            .map(|&c| (c, match c {
                b'S' => 1,
                b'E' => 26,
                _ => c - b'a' + 1,
            }))
            .collect())
        .collect::<Vec<_>>();
    assert_eq!(input, day12::parse("aSbS"));
}

