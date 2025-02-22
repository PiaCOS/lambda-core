import booleans
import church
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn booleans_bool_test() {
  let t = booleans.true_
  let f = booleans.false_

  booleans.true_(t)(f)
  |> booleans.to_gleam_bool()
  |> should.be_true

  booleans.false_(t)(f)
  |> booleans.to_gleam_bool()
  |> should.be_false
}

pub fn booleans_not_test() {
  booleans.true_
  |> booleans.not
  |> booleans.to_gleam_bool()
  |> should.be_false

  booleans.false_
  |> booleans.not
  |> booleans.to_gleam_bool()
  |> should.be_true
}

pub fn booleans_and_test() {
  booleans.and(booleans.true_)(booleans.true_)
  |> booleans.to_gleam_bool()
  |> should.be_true

  booleans.and(booleans.true_)(booleans.false_)
  |> booleans.to_gleam_bool()
  |> should.be_false

  booleans.and(booleans.false_)(booleans.true_)
  |> booleans.to_gleam_bool()
  |> should.be_false

  booleans.and(booleans.false_)(booleans.false_)
  |> booleans.to_gleam_bool()
  |> should.be_false
}

pub fn booleans_or_test() {
  booleans.or(booleans.true_)(booleans.true_)
  |> booleans.to_gleam_bool()
  |> should.be_true

  booleans.or(booleans.true_)(booleans.false_)
  |> booleans.to_gleam_bool()
  |> should.be_true

  booleans.or(booleans.false_)(booleans.true_)
  |> booleans.to_gleam_bool()
  |> should.be_true

  booleans.or(booleans.false_)(booleans.false_)
  |> booleans.to_gleam_bool()
  |> should.be_false
}

pub fn church_to_int_test() {
  church.zero
  |> church.to_gleam_int()
  |> should.equal(0)
}

pub fn church_succ_test() {
  church.zero
  |> church.succ
  |> church.to_gleam_int()
  |> should.equal(1)

  church.zero
  |> church.succ
  |> church.succ
  |> church.to_gleam_int()
  |> should.equal(2)
}

pub fn church_pred_test() {
  church.zero
  |> church.succ
  |> church.pred
  |> church.to_gleam_int()
  |> should.equal(0)

  church.from_gleam_int(7)
  |> church.pred
  |> church.pred
  |> church.to_gleam_int()
  |> should.equal(5)
}

pub fn church_add_test() {
  church.from_gleam_int(3)
  |> church.add(church.from_gleam_int(4))
  |> church.to_gleam_int()
  |> should.equal(7)
}

pub fn church_multiply_test() {
  church.from_gleam_int(3)
  |> church.multiply(church.from_gleam_int(4))
  |> church.to_gleam_int()
  |> should.equal(12)
}

pub fn church_power_test() {
  church.from_gleam_int(2)
  |> church.power(church.from_gleam_int(4))
  |> church.to_gleam_int()
  |> should.equal(16)
}
