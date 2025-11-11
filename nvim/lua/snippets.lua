-- ============================================================================
-- LUASNIP SNIPPETS
-- ============================================================================

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- ============================================================================
-- C++ SNIPPETS
-- ============================================================================

ls.add_snippets("cpp", {
    -- Main competitive programming template
    s("main", {
        t({
            "#include <bits/stdc++.h>",
            "#define endl '\\n'",
            "",
            "namespace Dungeon {",
            "    using namespace std;",
            "    ",
            "    auto Equip_Weapons = []() {",
            "        ios::sync_with_stdio(false);",
            "        cin.tie(nullptr);",
            "   };",
            "    ",
            "    bool __dungeons = true;",
            "}",
            "",
            "using namespace Dungeon;",
            "",
            "void Conquer_Dungeon() {",
            "    ",
        }),
        i(1),
        t({
            "",
            "}",
            "",
            "signed main() {",
            "    Equip_Weapons();",
            "    ",
            "    int dungeons = 1;",
            "    if (__dungeons) cin >> dungeons;",
            "    while (dungeons--) {",
            "       Conquer_Dungeon();",
            "    }",
            "    return 0;",
            "}",
            "",
        })
    }),

    -- Combinator (recursive lambda)
    s("com", {
        t({
            "template <class Fun>",
            "class recursive_lambda {",
            "    Fun fun_;",
            "public:",
            "    template <class T> explicit recursive_lambda(T &&fun): fun_(std::forward<T>(fun)) {}",
            "    template <class ...Args>",
            "    decltype(auto) operator()(Args &&...args) {",
            "        return fun_(std::ref(*this), std::forward<Args>(args)...);",
            "    }",
            "};",
            "",
            "template <class Fun>",
            "decltype(auto) combinator(Fun &&fun) {",
            "    return recursive_lambda<std::decay_t<Fun>>(std::forward<Fun>(fun));",
            "}",
            "",
        })
    }),

    -- Run-length encoding
    s("rle", {
        t({
            "template <typename T, typename T_iterable>",
            "vector<pair<T, int>> run_length_encoding(const T_iterable &items) {",
            "    vector<pair<T, int>> runs;",
            "    T previous = T();",
            "    int count = 0;",
            "",
            "    for (const T &item : items)",
            "        if (item == previous) {",
            "            count++;",
            "        } else {",
            "            if (count > 0)",
            "                runs.emplace_back(previous, count);",
            "",
            "            previous = item;",
            "            count = 1;",
            "        }",
            "",
            "    if (count > 0)",
            "        runs.emplace_back(previous, count);",
            "",
            "    return runs;",
            "}",
            "",
        })
    }),

    -- Check prime
    s("cp", {
        t({
            "auto is_prime = [](int n) -> bool{",
            "    if (n < 2) return false;",
            "    if (n == 2) return true;",
            "    if (n % 2 == 0) return false;",
            "    for (int i = 3; i * i <= n; i += 2)",
            "        if (n % i == 0) return false;",
            "    return true;",
            "};",
            "",
        })
    }),

    -- Vector of primes (sieve)
    s("vop", {
        t({
            "auto sieve = [](int n) -> vector<int> {",
            "    vector<bool> is_prime(n + 1, true);",
            "    vector<int> primes;",
            "    is_prime[0] = is_prime[1] = false;",
            "    for (int i = 2; i <= n; i++) {",
            "        if (is_prime[i]) {",
            "            primes.push_back(i);",
            "            for (int64_t x = (int64_t)i * i; x <= n; x += i)",
            "                is_prime[x] = false;",
            "        }",
            "    }",
            "    return primes;",
            "};",
            "",
        })
    }),

    -- Vector of factors
    s("vof", {
        t({
            "auto factors = [](int n) -> vector<int> {",
            "    vector<int> res;",
            "    for (int i = 1; i * i <= n; i++) {",
            "        if (n % i == 0) {",
            "            res.push_back(i);",
            "            if (i != n / i) res.push_back(n / i);",
            "        }",
            "    }",
            "    sort(res.begin(), res.end());",
            "    return res;",
            "};",
            "",
        })
    }),

    -- Perfect square check
    s("psq", {
        t({
            "auto is_psq = [](int64_t n) -> bool {",
            "    if (n < 0) return false;",
            "    if (n == 0) return true;",
            "    ",
            "    int64_t l = 1, r = min(n, (int64_t)1e9);",
            "    while (l <= r) {",
            "        int64_t m = l + (r - l) / 2;",
            "        int64_t sq = m * m;",
            "        if (sq == n) return true;",
            "        (sq < n) ? l = m + 1 : r = m - 1;",
            "    }",
            "    return false;",
            "};",
            "",
        })
    }),

    -- Debug macro
    s("dbg", {
        t({
            "#ifdef DEBUG",
            '#include "lib/debug.h"',
            "#else",
            "#define debug(...) 123",
            "#endif",
            "",
        })
    }),

    -- Fenwick tree
    s("fen", {
        t({
            "struct Fenwick {",
            "    vector<int> fen;",
            "    int n;",
            "    ",
            "    Fenwick(int n) : n(n), fen(n + 1) {}",
            "    ",
            "    void update(int i, int val) {",
            "        while (i <= n) {",
            "            fen[i] += val;",
            "            i += (i & -i);",
            "        }",
            "    }",
            "    ",
            "    int64_t query(int i) {",
            "        int64_t sum = 0;",
            "        while (i > 0) {",
            "            sum += fen[i];",
            "            i -= (i & -i);",
            "        }",
            "        return sum;",
            "    }",
            "    ",
            "    int64_t range_query(int l, int r) {",
            "        return (l > r) ? 0LL : query(r) - query(l - 1);",
            "    }",
            "};",
            "",
        })
    })
})
