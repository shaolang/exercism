use regex::Regex;

pub fn translate(input: &str) -> String {
    let words: Vec<String> = input.split_whitespace().map(pig_word).collect();
    words.join(" ")
}

fn pig_word(input: &str) -> String {
    let re = Regex::new("^[aeiou]|^[xy][^aeiou]").unwrap();

    if re.is_match(input) {
        format!("{}ay", input)
    } else {
        let re = Regex::new("^((?:qu|[^aeiou])+)([aeiouy].+)$").unwrap();
        re.replace(input, "${2}${1}ay").to_owned().to_string()
    }
}
