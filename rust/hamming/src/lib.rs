pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    if s1.len() != s2.len() {
        None
    } else {
        Some(s1.chars().zip(s2.chars()).filter(|pair| pair.0 != pair.1).count())
    }
}
