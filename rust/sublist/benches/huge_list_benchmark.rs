use criterion::{black_box, criterion_group, criterion_main, Criterion};
use sublist::sublist;

fn criterion_benchmark(c: &mut Criterion) {
    let v1: Vec<u64> = (10..1_000_001).collect();
    let v2: Vec<u64> = (1..1_000_000).collect();

    c.bench_function(
        "huge list",
        |b| b.iter(|| sublist(black_box(&v1), black_box(&v2))));
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
