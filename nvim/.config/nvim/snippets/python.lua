local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- Import TensorFlow and list GPUs
  s("tfgpu", {
    t({
      "import tensorflow as tf",
      "print(tf.config.list_physical_devices('GPU'))",
    }),
  }),
}
