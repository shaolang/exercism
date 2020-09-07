pub fn score(word: &str) -> u32 {
    word.to_lowercase()
        .chars()
        .map(|c|
             if "aeioulnrst".contains(c) {
                 1
             } else if "dg".contains(c) {
                 2
             } else if "bcmp".contains(c) {
                 3
             } else if "fhvwy".contains(c) {
                 4
             } else if c == 'k' {
                 5
             } else if "jx".contains(c) {
                 8
             } else if "qz".contains(c) {
                 10
             } else {
                 0
             }
            )
        .sum()
}
