import gleeunit
import gleeunit/should
import staffa/router
import wisp/testing

pub fn main() {
  gleeunit.main()
}

pub fn hello_world_test() {
  let response = router.handle_request(testing.get("/", []))

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "application/json")])

  response
  |> testing.string_body
  |> should.equal("Hello, World!")
}

pub fn hello_name_test() {
  let response = router.handle_request(testing.get("/Jack", []))

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "application/json")])

  response
  |> testing.string_body
  |> should.equal("Hello, Jack!")
}

pub fn hello_name_capitalise_name_test() {
  let response = router.handle_request(testing.get("/jack", []))

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "application/json")])

  response
  |> testing.string_body
  |> should.equal("Hello, Jack!")
}
