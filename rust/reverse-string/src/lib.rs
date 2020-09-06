use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    let mut s: Vec<&str> = UnicodeSegmentation::graphemes(input, true).collect::<Vec<&str>>();
    s.reverse();
    s.join("")
}
