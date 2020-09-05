pub fn nth(n: u32) -> u32 {
    let mut no: u32 = 2;
    let mut nth = 0;

    loop {
        if nth == n { return no }

        no += 1;
        let max: u32 = (no as f64).sqrt().round() as u32;
        let is_prime = (2..=max).all(|i| no % i != 0);
        if is_prime { nth += 1; }
    }
}
