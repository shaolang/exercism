pub fn reply(statement: &str) -> &str {
    if statement.trim() == "" {
        "Fine. Be that way!"
    } else if statement.trim().ends_with("?") {
        if uppercase_only(statement) {
            "Calm down, I know what I'm doing!"
        } else {
            "Sure."
        }
    } else if uppercase_only(statement) {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}

pub fn uppercase_only(s: &str) -> bool {
    s == s.to_uppercase() && s.contains(|c| c >= 'A' && c <= 'Z')
}
