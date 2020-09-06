pub fn brackets_are_balanced(string: &str) -> bool {
    let mut opens: Vec<char> = vec![];

    for c in string.chars() {
        let balanced = match c {
            '(' | '[' | '{' => { opens.push(c); true }
            ')' | ']' | '}' if matching(opens.last(), c) => { opens.pop().unwrap(); true }
            ')' | ']' | '}' => false,
            _ => true,
        };

        if !balanced { return false; }
    }

    opens.is_empty()
}

fn matching(open: Option<&char>, close: char) -> bool {
    match open {
        Some('(') if close == ')' => true,
        Some('[') if close == ']' => true,
        Some('{') if close == '}' => true,
        _ => false,
    }
}
