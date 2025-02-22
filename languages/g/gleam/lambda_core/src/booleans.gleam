pub fn true_(x) {
  fn(_y) { x }
}

pub fn false_(_x) {
  fn(y) { y }
}

pub fn not(b) {
  b(false_)(true_)
}

pub fn and(p) {
  fn(q) { p(q)(false_) }
}

pub fn or(p) {
  fn(q) { p(true_)(q) }
}

pub fn to_gleam_bool(b) -> Bool {
  b(True)(False)
}

pub fn from_gleam_bool(b: Bool) {
  case b {
    True -> true_
    False -> false_
  }
}
