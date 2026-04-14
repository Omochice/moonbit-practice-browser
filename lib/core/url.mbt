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

///|
pub fn Url::parse(self : Url) -> Result[Url, String] {
  if !self.is_http() {
    return Err("Only HTTP scheme is supported")
  }
}

///|
fn Url::is_http(self : Url) -> Bool {
  if self.url.contains("http://") {
    return true
  }
  false
}
