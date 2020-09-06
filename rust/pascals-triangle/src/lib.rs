pub struct PascalsTriangle {
    vec: Vec<Vec<u32>>,
}

impl PascalsTriangle {
    fn row_vec(prev_row: &[u32]) -> Vec<u32> {
        let mut row = prev_row
            .windows(2)
            .map(|pair| pair[0] + pair[1])
            .collect::<Vec<u32>>();

        row.insert(0, 1);
        row.push(1);
        row
    }

    fn row_vecs(row_count: u32) -> Vec<Vec<u32>> {
        (2..row_count).fold(vec![vec![1], vec![1, 1]], |acc, _| {
            let mut a = acc.to_owned();
            a.push(PascalsTriangle::row_vec(&acc.last().unwrap()));
            a
        })
    }

    pub fn new(row_count: u32) -> Self {
        PascalsTriangle {
            vec: match row_count {
                0 => vec![],
                1 => vec![vec![1]],
                n => PascalsTriangle::row_vecs(n),
            },
        }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        self.vec.clone()
    }
}
