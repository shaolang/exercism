fn bottle_text(num: i32) -> String {
    match num {
        -1 => "99 bottles".to_string(),
        0  => "No more bottles".to_string(),
        1  => "1 bottle".to_string(),
        _  =>  format!("{} bottles", num)
    }
}

pub fn verse(num: i32) -> String {
    let before = bottle_text(num);
    let after = bottle_text(num - 1);
    let action = match num {
        0 => "Go to the store and buy some more",
        1 => "Take it down and pass it around",
        _ => "Take one down and pass it around",
    };

    format!("{} of beer on the wall, {} of beer.\n{}, {} of beer on the wall.\n",
            before, before.to_lowercase(), action, after.to_lowercase())
}

pub fn sing(start: i32, end: i32) -> String {
    (end..=start).rev().map(|i| verse(i)).
        fold(String::new(), |acc, s| acc + "\n" + &s ).trim_start().to_string()
}
