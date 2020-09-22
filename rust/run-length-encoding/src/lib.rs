pub fn encode(source: &str) -> String {
    if source == "" {
        "".to_string()
    } else {
        chunk(source)
            .iter()
            .map(|(n, c)|
                 match *n {
                     1 => c.to_string(),
                     n => format!("{}{}", n, c)
                 })
            .collect()
    }
}

fn chunk(s: &str) -> Vec<(u8, char)> {
    let mut letter = s.chars().next().unwrap();
    let mut result: Vec<(u8, char)> = Vec::with_capacity(s.len());
    let mut count = 0u8;

    for c in s.chars() {
        if letter == c {
            count += 1;
        } else {
            result.push((count, letter));
            letter = c;
            count = 1;
        }
    }

    result.push((count, letter));

    result
}

pub fn decode(source: &str) -> String {
    source.to_string()
}
