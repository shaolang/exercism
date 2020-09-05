pub fn is_armstrong_number(num: u32) -> bool {
    let cs: String = num.to_string();
    let n = cs.len() as u32;

    num == cs.chars().map(|c| c.to_digit(10).unwrap().pow(n)).sum()
}
