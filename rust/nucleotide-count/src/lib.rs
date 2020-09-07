use std::collections::HashMap;

pub fn count(target: char, dna: &str) -> Result<usize, char> {
    if invalid_target(target) { return Err(target); }
    if let Some(e) = invalid_dna(dna) { return Err(e); }

    Ok(dna.chars().filter(|c| *c == target).count())
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    if let Some(e) = invalid_dna(dna) { return Err(e); }

    Ok("ACGT".chars().map(|c| (c, count(c, dna).unwrap())).collect())
}

fn invalid_target(target: char) -> bool {
    !"ACGT".contains(target)
}

fn invalid_dna(dna: &str) -> Option<char> {
    dna.chars().find(|c| !"ACGT".contains(*c))
}
