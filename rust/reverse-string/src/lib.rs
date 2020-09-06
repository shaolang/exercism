pub fn reverse(input: &str) -> String {
    let s: String = input.to_string();
    s.chars().rev().collect()
}
