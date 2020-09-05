pub fn square_of_sum(num: i32) -> i32 {
    let sum: i32 = (1..=num).sum();
    sum * sum
}

pub fn sum_of_squares(num: i32) -> i32 {
    (1..=num).fold(0, |acc, i| acc + i * i)
}

pub fn difference(num: i32) -> i32 {
    square_of_sum(num) - sum_of_squares(num)
}
