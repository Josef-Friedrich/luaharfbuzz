local harfbuzz = require("harfbuzz")

describe("harfbuzz.Buffer", function()
  it("can be created", function()
    harfbuzz.Buffer.new()
  end)

  it("can add a UTF8 string to the buffer", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("Some String")
  end)

  it("can call guess_segment_properties", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("Some String")
    b:guess_segment_properties()
  end)

  it("can get and set the direction of a buffer", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("abc")
    b:set_direction("rtl")
    assert.are_equal("rtl", b:get_direction())
  end)

  it("throws an error if direction is invalid", function()
    local b = harfbuzz.Buffer.new()
    assert.has_error(function() b:set_direction("fff") end, "Invalid direction")
  end)

  it("can get the direction correctly", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("یہ")
    b:guess_segment_properties()
    assert.are_equal("rtl", b:get_direction())
  end)

  it("can get and set the language of a buffer", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("یہ")
    b:set_language("urd")
    assert.are_equal("urd", b:get_language())
  end)

  it("throws an error if language is invalid", function()
    local b = harfbuzz.Buffer.new()
    assert.has_error(function() b:set_language("") end, "Invalid language")
  end)

  it("can get the language correctly", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("یہ")
    b:guess_segment_properties()
  end)

  it("can get and set the script of a buffer", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("abc")
    b:set_script("latn")
    assert.are_equal("Latn", b:get_script())
  end)

  it("throws an error if script is invalid", function()
    local b = harfbuzz.Buffer.new()
    assert.has_error(function() b:set_script("xxx") end, "Unknown script")
  end)

  it("can get the script correctly", function()
    local b = harfbuzz.Buffer.new()
    b:add_utf8("یہ")
    assert.are_equal("", b:get_script())
    b:guess_segment_properties()
    assert.are_equal("Arab", b:get_script())
  end)
end)


