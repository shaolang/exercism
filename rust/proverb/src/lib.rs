pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 { return "".to_string() }

    let mut phrases: Vec<String> = (0..(list.len() - 1))
        .map(|i| format!("For want of a {} the {} was lost.", list[i], list[i + 1]))
        .collect();

    phrases.push(format!("And all for the want of a {}", list[0]));

    format!("{}.", phrases.join("\n"))
}
