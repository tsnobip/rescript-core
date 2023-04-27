open RescriptCore

let shouldHandleNullableValues = () => {
  let tNull: Nullable.t<string> = %raw("null")
  let tUndefined: Nullable.t<string> = %raw("undefined")
  let tPresent: Nullable.t<string> = %raw(`"hello"`)

  Test.run(
    __POS_OF__("Should handle null"),
    switch tNull {
    | Null => true
    | Present(_) | Undefined => false
    },
    \"==",
    true,
  )

  Test.run(
    __POS_OF__("Should handle undefined"),
    switch tUndefined {
    | Undefined => true
    | Present(_) | Null => false
    },
    \"==",
    true,
  )

  Test.run(
    __POS_OF__("Should handle present"),
    switch tPresent {
    | Present("hello") => true
    | _ => false
    },
    \"==",
    true,
  )
}

shouldHandleNullableValues()
