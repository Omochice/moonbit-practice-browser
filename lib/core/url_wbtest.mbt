///|
test "Url MUST has port 80 defaultly" {
  let url = "http://example.com"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "80",
    path: "",
    searchpart: "",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has port 8888 when input http://example.com:8888" {
  let url = "http://example.com:8888"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "8888",
    path: "",
    searchpart: "",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has path when input http://example.com:8888/index.html" {
  let url = "http://example.com:8888/index.html"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "8888",
    path: "index.html",
    searchpart: "",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has port 80 when input http://example.com/index.html" {
  let url = "http://example.com/index.html"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "80",
    path: "index.html",
    searchpart: "",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has searchquery when input http://example.com:8888/index.html?a=123&b=456" {
  let url = "http://example.com:8888/index.html?a=123&b=456"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "8888",
    path: "index.html",
    searchpart: "a=123&b=456",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Parse MUST fail when scheme is missing" {
  let url = "example.com"
  let expected = Err("Only HTTP scheme is supported.")
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Parse MUST fail when unsupported scheme is specified" {
  let url = "https://example.com:8888/index.html"
  let expected = Err("Only HTTP scheme is supported.")
  assert_eq(expected, Url::new(url).parse())
}
