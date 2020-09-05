pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit)
        .map(|i| if factors.iter().any(|f| is_factor(i, *f)) { i } else { 0 })
        .sum()
}

fn is_factor(n: u32, factor: u32) -> bool {
    factor > 0 && n % factor == 0
}
