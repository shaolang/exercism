pub fn abbreviate(phrase: &str) -> String {
    let phrase = phrase.replace(&['-', '_'][..], " ");

    phrase
        .split_whitespace()
        .map(split_camelcase)
        .collect::<Vec<String>>()
        .join(" ")
        .split_whitespace()
        .map(|s| s.chars().next().unwrap())
        .collect::<String>()
        .to_uppercase()
}

fn split_camelcase(s: &str) -> String {
    if s.to_uppercase() == s {
        s.to_owned()
    } else if let Some(index) = s.chars().skip(1).position(|c| ('A'..='Z').contains(&c)) {
            let (first, second) = s.split_at(index + 1);
            format!("{} {}", first, second)
    } else {
        s.to_owned()
    }
}
