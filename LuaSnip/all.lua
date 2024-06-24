return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  s(
    { trig = "hi" },
    { t("Hello, world!") }
  ),
  s(
    { trig = "foo" },
    { t("Another snippet.") }
  ),

  s(
    { trig = "hahah" },
    { t("Another snippet.") }
  ),
}
