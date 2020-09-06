#[derive(Debug)]
pub struct HighScores {
    scores: Vec<u32>,
}

impl HighScores {
    pub fn new(scores: &[u32]) -> Self {
        HighScores {
            scores: scores.to_vec(),
        }
    }

    pub fn scores(&self) -> &[u32] {
        &self.scores
    }

    pub fn latest(&self) -> Option<u32> {
        if let Some(n) = self.scores.last() {
            Some(*n)
        } else {
            None
        }
    }

    pub fn personal_best(&self) -> Option<u32> {
        if self.scores.is_empty() {
            None
        } else {
            Some(self.scores.iter().fold(0, |hi, x| std::cmp::max(hi, *x)))
        }
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut vs = Vec::with_capacity(self.scores.len());
        vs.extend(&self.scores);
        vs.sort();
        vs.reverse();

        let n = std::cmp::min(3, vs.len());

        vs[0..n].to_vec()
    }
}
