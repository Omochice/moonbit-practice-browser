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
test "Url MUST has host.com when host.example.com" {
  let url = "http://host.example.com"
  let expected = Ok(Url::{
    url,
    host: "host.example.com",
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

///|
test "Parse MUST fail when http:// appears in the middle of the URL" {
  let url = "abchttp://example.com"
  let expected = Err("Only HTTP scheme is supported.")
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has searchpart when path is missing" {
  let url = "http://example.com?a=1"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "80",
    path: "",
    searchpart: "a=1",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has port and searchpart when path is missing" {
  let url = "http://example.com:8888?a=1"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "8888",
    path: "",
    searchpart: "a=1",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST has empty path when input ends with trailing slash" {
  let url = "http://example.com/"
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
test "Url MUST has searchpart when path is empty after slash" {
  let url = "http://example.com/?a=1"
  let expected = Ok(Url::{
    url,
    host: "example.com",
    port: "80",
    path: "",
    searchpart: "a=1",
  })
  assert_eq(expected, Url::new(url).parse())
}

///|
test "Url MUST parse complex string" {
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
