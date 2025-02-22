// A church numeral `n` is the result of a function `f` applied `n` times to `x`.
// Then passing `f = fn(x) {x + 1}` and `0` to `n` allows us to count how many 
// time `f` is applied. Thus getting `n` as an Int. 

pub fn to_gleam_int(n) -> Int {
  let f = fn(x) { x + 1 }
  n(f)(0)
}

pub fn zero(_f) {
  fn(x) { x }
}

// λn.λf.λx.f(n(f)(x))
pub fn succ(n) {
  fn(f) { fn(x) { f(n(f)(x)) } }
}

// λn.λf.λx.n(λg.λh.h(g(f)))(λu.x)(λa.a)
pub fn pred(n) {
  fn(f) { fn(x) { n(fn(g) { fn(h) { h(g(f)) } })(fn(_u) { x })(fn(a) { a }) } }
}

// λm.λn.n(succ)(m)
pub fn add(m) {
  fn(n) { n(succ)(m) }
}

// λm.λn.λf.m(n(f))
pub fn multiply(m) {
  fn(n) { fn(f) { m(n(f)) } }
}

// λb.λn.n(b)
pub fn power(b) {
  fn(n) { n(b) }
}

pub fn from_gleam_int(n) {
  from_gleam_int_loop(n, zero)
}

fn from_gleam_int_loop(n, acc) {
  case n {
    0 -> acc
    _ -> from_gleam_int_loop(n - 1, succ(acc))
  }
}
