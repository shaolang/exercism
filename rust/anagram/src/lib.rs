use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let lword = word.to_lowercase();
    let target = sort_chars_in_string(&lword);

    possible_anagrams
        .into_iter()
        .filter(|w| {
            let lw = w.to_lowercase();
            lw != lword && sort_chars_in_string(&lw) == target
        })
        .map(|w| *w)
        .collect::<HashSet<&str>>()
}

fn sort_chars_in_string(s: &str) -> String {
    let mut chars: Vec<char> = s.chars().collect();
    chars.sort();
    String::from_iter(chars)
}
