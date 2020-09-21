use std::collections::HashMap;

#[derive(Debug, PartialEq)]
pub struct DNA {
    strand: String,
}

#[derive(Debug, PartialEq)]
pub struct RNA {
    strand: String,
}

impl DNA {
    pub fn new(dna: &str) -> Result<DNA, usize> {
        match dna.find(|c| !"ACGT".contains(c)) {
            None => Ok(DNA { strand: dna.to_string() }),
            Some(n) => Err(n)
        }
    }

    pub fn into_rna(self) -> RNA {
        let m: HashMap<char, char> = "GCTA".chars().zip("CGAU".chars()).collect();
        let s: String = self.strand.chars().map(|c| m.get(&c).unwrap()).collect();

        RNA { strand : s }
    }
}

impl RNA {
    pub fn new(rna: &str) -> Result<RNA, usize> {
        match rna.find(|c| !"ACGU".contains(c)) {
            None => Ok(RNA { strand: rna.to_string() }),
            Some(n) => Err(n)
        }
    }
}
