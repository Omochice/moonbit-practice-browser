///|
pub struct Url {
  url : String
  host : String
  port : String
  path : String
  searchpart : String
} derive(Show, Eq)

///|
pub fn Url::new(url : String) -> Url {
  { url, host: "", port: "", path: "", searchpart: "" }
}
