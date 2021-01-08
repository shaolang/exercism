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
        (n, m) if n < m => {
            let mut sublist = false;

            for i in 0..=(m - n) {
                if &second_list[i..(i + n)] == first_list {
                    sublist = true;
                    break;
                }
            }

            if sublist { Comparison::Sublist } else { Comparison::Unequal }
        }
        _ => Comparison::Unequal,
    }
}
