import gleam/http.{Get}
import gleam/string_builder
import staffa/web
import wisp.{type Request, type Response}

/// The HTTP request handler- your application!
/// 
pub fn handle_request(req: Request) -> Response {
  // Apply the middleware stack for this request/response.
  use _req <- web.middleware(req)

  case wisp.path_segments(req) {
    [] -> hello_world(req)
    [name] -> hello_name(req, name)
    _ -> wisp.not_found()
  }
}

fn hello_world(req: Request) {
  use <- wisp.require_method(req, Get)
  let response = string_builder.from_string("Hello, World!")

  wisp.ok()
  |> wisp.json_body(response)
}

fn hello_name(req: Request, name: String) {
  use <- wisp.require_method(req, Get)

  let response =
    string_builder.from_string("Hello, ")
    |> string_builder.append(name)
    |> string_builder.append("!")

  wisp.ok()
  |> wisp.json_body(response)
}
