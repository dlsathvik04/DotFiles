local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Print to console
  s("sout", {
    t("console.log('"),
    i(1),
    t("');"),
    t({ "", "" }),
    i(2),
  }),

  -- Create basic Express App
  s("!!express", {
    t({
      "// initialize dotenv for environment variable setup",
      "require('dotenv').config()",
      "// require the dependecies here",
      "const express = require('express')",
      "const authRouter = require('./controllers/AuthRouter')",
      "// create express application",
      "const app = express()",
      "// configure Middleware here",
      "app.use(express.json())",
      "// configure root behaviour if need",
      'app.get("/", (req, res) => {',
      '    res.send("This is the root of the application")',
      "})",
      "// configure routers here",
      "app.use('/auth', authRouter)",
      "// Declare the port number",
      "const portNumber = process.env.PORT_NUMBER || 5001",
      "// Start listening on the given port number",
      "const server = app.listen(process.env.PORT_NUMBER, () => {",
      "    console.log(`listening on port portNumber`)",
      "})",
      "// Write the server event managers here",
      "server.on('connection', (client) => {",
      "    console.log(`Connection from ${client.address().address}`)",
      "})",
    }),
  }),

  -- Create redux slice
  s("!!redux-slice", {
    t("import { createSlice, createSelector } from '@reduxjs/toolkit';"),
    t({ "", "" }),
    t("const "),
    i(1, "sliceName"),
    t(" = createSlice({"),
    t({ "", "  name: '" }),
    i(2, "name"),
    t("',"),
    t({ "", "  initialState: " }),
    i(3, "initialState"),
    t(","),
    t({ "", "  reducers: {", "    // Reducers here", "  }," }),
    t({ "", "  selectors: {", "    // Selectors here", "  }," }),
    t({ "", "});", "" }),
    t("export const { } = "),
    i(1),
    t(".actions;"),
    t({ "", "export const { } = " }),
    i(1),
    t(".selectors;"),
    t({ "", "export default " }),
    i(1),
    t(".reducer;"),
  }),

  -- Create redux store
  s("!!redux-store", {
    t("import { combineReducers, configureStore, getDefaultMiddleware } from '@reduxjs/toolkit';"),
    t({ "", "" }),
    t("const reducer = combineReducers({"),
    t("  // Reducers here"),
    t("});"),
    t({ "", "" }),
    t("export default function () {"),
    t("  return configureStore({"),
    t("    reducer,"),
    t("    middleware: [...getDefaultMiddleware(),]"),
    t("  });"),
    t("}"),
  }),
}
