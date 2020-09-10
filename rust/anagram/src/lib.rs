use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let word = word.to_lowercase();
    let letters = sort_as_lowercase(&word);

    possible_anagrams.to_owned()
        .into_iter()
        .filter(|w| w.to_lowercase() != word && sort_as_lowercase(w) == letters)
        .collect::<HashSet<&'a str>>()
}


fn sort_as_lowercase(s: &str) -> Vec<char> {
    let mut ss = s.to_lowercase().chars().collect::<Vec<char>>();
    ss.sort();

    ss
}
