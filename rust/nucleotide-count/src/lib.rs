use std::collections::HashMap;

pub fn count(target: char, dna: &str) -> Result<usize, char> {
    if !"ACTG".contains(target) { return Err(target); }
    if let Some(e) = invalid_dna(dna) { return Err(e); }

    Ok(dna.chars().filter(|c| *c == target).count())
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    unimplemented!("yet");
}

fn invalid_dna(dna: &str) -> Option<char> {
    dna.chars().find(|c| !"ACTG".contains(*c))
}
