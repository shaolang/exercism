use std::fmt;

#[derive(Debug, PartialEq, Eq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

const MINUTES_A_DAY: i32 = 1440;

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = MINUTES_A_DAY + (hours * 60 + minutes) % MINUTES_A_DAY;

        Clock {
            hours: (total_minutes / 60) % 24,
            minutes: total_minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
