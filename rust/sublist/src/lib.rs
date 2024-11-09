#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (flen, slen) if flen == slen && first_list == second_list => Comparison::Equal,
        (flen, slen) if flen > slen => _sublist(second_list, first_list, Comparison::Superlist),
        (flen, slen) if flen < slen => _sublist(first_list, second_list, Comparison::Sublist),
        _ => Comparison::Unequal,
    }
}

fn _sublist<T: PartialEq>(short: &[T], long: &[T], retval: Comparison) -> Comparison {
    let slen = short.len();
    let llen = long.len();

    if &long[0..slen] == short {
        retval
    } else if let Some(idx) = long[1..llen].iter().position(|t| *t == short[0]) {
        _sublist(short, &long[idx + 1..llen], retval)
    } else {
        Comparison::Unequal
    }
}
