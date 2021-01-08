#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (0, 0) => Comparison::Equal,
        (0, _) => Comparison::Sublist,
        (_, 0) => Comparison::Superlist,
        (n, m) if n == m => if first_list == second_list { Comparison::Equal } else { Comparison::Unequal },
        (n, m) if n < m => is_sublist(first_list, second_list, Comparison::Sublist),
        _ => is_sublist(second_list, first_list, Comparison::Superlist),
    }
}

fn is_sublist<T: PartialEq>(small: &[T], big: &[T], true_value: Comparison) -> Comparison {
    let n = small.len();

    for i in 0..=(big.len() - n) {
        if small == &big[i..(i + n)] {
            return true_value
        }
    }

    Comparison::Unequal
}
