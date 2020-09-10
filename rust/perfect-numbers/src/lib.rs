use std::cmp::Ordering;

#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    if num < 1 { return None; }

    let cap = num / 2;
    let sum: u64 = (1..=cap).filter(|n| num % n == 0).sum();

    Some(match sum.cmp(&num) {
        Ordering::Equal   => Classification::Perfect,
        Ordering::Greater => Classification::Abundant,
        _                 => Classification::Deficient,
    })
}
