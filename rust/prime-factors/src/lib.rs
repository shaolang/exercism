pub fn factors(n: u64) -> Vec<u64> {
    let mut fs: Vec<u64> = vec![];
    let mut i = n;
    let mut f = 2;

    while i > 1 {
        while i % f == 0 {
            fs.push(f);
            i /= f;
        }

        f += 1;
    }

    return fs;
}
