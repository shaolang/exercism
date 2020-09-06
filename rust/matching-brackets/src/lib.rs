pub fn brackets_are_balanced(string: &str) -> bool {
    let mut closes: Vec<char> = vec![];

    for c in string.chars() {
        match c {
            '('     => closes.push(')'),
            '['     => closes.push(']'),
            '{'     => closes.push('}'),
            ')' | ']' | '}' if closes.pop() != Some(c) => { return false; }
            _       => {}
        }
    }

    closes.is_empty()
}
