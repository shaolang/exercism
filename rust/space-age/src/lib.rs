// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration {
    years: f64,
}

const SECS_IN_YEAR: f64 = 60.0 * 60.0 * 24.0 * 365.2425;

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration {
            years: (s as f64) / SECS_IN_YEAR,
        }
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64 {
        todo!("convert a duration ({d:?}) to the number of years on this planet for that duration");
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

macro_rules! years_during {
    ($planet:ty, $orbital_duration_in_earth_years:expr) => {
        impl Planet for $planet {
            fn years_during(d: &Duration) -> f64 {
                d.years / $orbital_duration_in_earth_years
            }
        }
    };
}

years_during!(Mercury, 0.2408467);
years_during!(Venus, 0.61519726);
years_during!(Earth, 1.0);
years_during!(Mars, 1.8808158);
years_during!(Jupiter, 11.862615);
years_during!(Saturn, 29.447498);
years_during!(Uranus, 84.016846);
years_during!(Neptune, 164.79132);
