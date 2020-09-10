pub fn is_valid_isbn(isbn: &str) -> bool {
    let cs = sanitize(isbn);

    valid_isbn(&cs) && (first_9_value(&cs) + last_char_value(&cs)) % 11 == 0
}

fn sanitize(s: &str) -> String {
    s.chars().filter(|c| c.is_digit(10) || *c == 'X').collect()
}

fn valid_isbn(s: &str) -> bool {
    s.len() == 10 && s[..9].parse::<u32>().is_ok()
}

fn first_9_value(s: &str) -> u32 {
    s[..9]
        .chars()
        .zip((2..=10).rev())
        .map(|p| p.0.to_digit(10).unwrap() * p.1)
        .sum()
}

fn last_char_value(s: &str) -> u32 {
    s.chars().last().unwrap_or('1').to_digit(10).unwrap_or(10)
}
