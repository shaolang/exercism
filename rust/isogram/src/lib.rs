use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let chars = candidate.to_lowercase().chars().filter(|c| *c >= 'a' && *c <= 'z').collect::<String>();
    let uniques = chars.chars().collect::<HashSet<char>>();

    chars.len() == uniques.len()
}
