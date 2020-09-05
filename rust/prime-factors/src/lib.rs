pub fn factors(n: u64) -> Vec<u64> {
    let mut fs: Vec<u64> = vec![];
    let mut i = n;
    let mut f = 2;

    loop {
        if i == 1 { return fs; }

        if i % f == 0 {
            fs.push(f);
            i = i / f;
        } else {
            f += 1;
        }
    }
}
