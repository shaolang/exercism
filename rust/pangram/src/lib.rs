pub fn is_pangram(sentence: &str) -> bool {
    let target = sentence.to_lowercase();

    "abcdefghijklmnopqrstuvwxyz".chars().all(|c| target.contains(c))
}
