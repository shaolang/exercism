pub fn annotate(minefield: &[&str]) -> Vec<String> {
    if minefield.is_empty() { return vec![]; }

    minefield.iter().map(|row| row.to_string()).collect()
}
