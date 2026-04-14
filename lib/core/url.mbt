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

///|
fn Url::extract_host(self : Url) -> String {
  let url_parts = self.url.trim_start(chars="http://").split("/").collect()
  match url_parts[0].find(":") {
    Some(i) => url_parts[0].sub(start=0, end=i).to_string()
    None => url_parts[0].to_string()
  }
}

///|
fn Url::extract_port(self : Url) -> String {
  let url_parts = self.url.trim_start(chars="http://").split("/").collect()
  match url_parts[0].find(":") {
    Some(i) => url_parts[0].sub(start=i + 1).to_string()
    None => "80"
  }
}

///|
fn Url::extract_path(self : Url) -> String {
  match self.url.trim_start(chars="http://").after("/") {
    Some(s) => s.before("?").unwrap_or("").to_string()
    None => ""
  }
}
