-- File: go_snippets.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Unix Time Stamp
  s("tst", {
    t("timestamp := strconv.FormatInt(time.Now().UTC().UnixNano(), 10)"),
    t({ "", "" }),
    i(1),
  }),

  -- Go Priority Queue
  s("goPriorityQueue", {
    t({
      "// Item is something we manage in a priority queue.",
      "type Item struct {",
      "\tvalue    string // The value of the item.",
      "\tpriority int    // The priority of the item in the queue.",
      "\tindex    int    // The index of the item in the heap.",
      "}",
      "",
      "// PriorityQueue implements heap.Interface and holds Items.",
      "type PriorityQueue []*Item",
      "",
      "func (pq PriorityQueue) Len() int { return len(pq) }",
      "",
      "func (pq PriorityQueue) Less(i, j int) bool {",
      "\t// Pop returns the highest priority item, so use greater than here.",
      "\treturn pq[i].priority > pq[j].priority",
      "}",
      "",
      "func (pq PriorityQueue) Swap(i, j int) {",
      "\tpq[i], pq[j] = pq[j], pq[i]",
      "\tpq[i].index = i",
      "\tpq[j].index = j",
      "}",
      "",
      "func (pq *PriorityQueue) Push(x any) {",
      "\titem := x.(*Item)",
      "\titem.index = len(*pq)",
      "\t*pq = append(*pq, item)",
      "}",
      "",
      "func (pq *PriorityQueue) Pop() any {",
      "\told := *pq",
      "\tn := len(old)",
      "\titem := old[n-1]",
      "\told[n-1] = nil  // Avoid memory leak",
      "\titem.index = -1 // Mark as removed",
      "\t*pq = old[0 : n-1]",
      "\treturn item",
      "}",
      "",
      "// Update modifies the priority and value of an Item in the queue.",
      "func (pq *PriorityQueue) update(item *Item, value string, priority int) {",
      "\titem.value = value",
      "\titem.priority = priority",
      "\theap.Fix(pq, item.index)",
      "}",
    }),
  }),

  -- Go Int Heap
  s("goIntHeap", {
    t({
      "import (",
      '\t"container/heap"',
      '\t"fmt"',
      ")",
      "",
      "// IntHeap is a min-heap of ints.",
      "type IntHeap []int",
      "",
      "func (h IntHeap) Len() int           { return len(h) }",
      "func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] }",
      "func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }",
      "",
      "func (h *IntHeap) Push(x any) {",
      "\t// Push uses a pointer receiver to modify the slice's length.",
      "\t*h = append(*h, x.(int))",
      "}",
      "",
      "func (h *IntHeap) Pop() any {",
      "\told := *h",
      "\tn := len(old)",
      "\tx := old[n-1]",
      "\t*h = old[0 : n-1]",
      "\treturn x",
      "}",
    }),
  }),
}
