#ifndef DEBUG_H
#define DEBUG_H

#include <bits/stdc++.h>
using namespace std;

#define RESET   "\033[0m"
#define RED     "\033[38;2;186;52;45m"
#define GREEN   "\033[32m"
#define BLUE    "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN    "\033[36m"

#define debug(...) cerr << CYAN << "[" << #__VA_ARGS__ << "]:" << RESET << " "; _print(__VA_ARGS__); cerr << endl;

void _print() {}

template <typename T>
void _print(T t) {
    cerr << CYAN << t << RESET;
}

void _print(char c) {
    string q = "'";
    cerr << CYAN << q << c << q << RESET;
}

void _print(string s) {
    char q = '"';
    cerr << CYAN << q << s << q << RESET;
}

void _print(bool b) {
    cerr << (b ? GREEN "true" : RED "false") << RESET;
}

template <typename T, typename U>
void _print(pair<T, U> p) {
    cerr << MAGENTA << "{" << RESET;
    _print(p.first);
    cerr << MAGENTA << ", " << RESET;
    _print(p.second);
    cerr << MAGENTA << "}" << RESET;
}

template <typename T>
void _print(vector<T> v) {
    cerr << MAGENTA << "[" << RESET;
    for (int i = 0; i < (int)v.size(); i++) {
        _print(v[i]);
        if (i != (int)v.size() - 1) cerr << MAGENTA << ", " << RESET;
    }
    cerr << MAGENTA << "]" << RESET;
}

template <typename T>
void _print(set<T> s) {
    cerr << MAGENTA << "{" << RESET;
    bool first = true;
    for (auto x : s) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(x);
        first = false;
    }
    cerr << MAGENTA << "}" << RESET;
}

template <typename T>
void _print(multiset<T> ms) {
    cerr << MAGENTA << "{" << RESET;
    bool first = true;
    for (auto x : ms) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(x);
        first = false;
    }
    cerr << MAGENTA << "}" << RESET;
}

template <typename T, typename U>
void _print(map<T, U> m) {
    cerr << MAGENTA << "{" << RESET;
    bool first = true;
    for (auto p : m) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(p);
        first = false;
    }
    cerr << MAGENTA << "}" << RESET;
}

template <typename T>
void _print(unordered_set<T> us) {
    cerr << MAGENTA << "{" << RESET;
    bool first = true;
    for (auto x : us) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(x);
        first = false;
    }
    cerr << MAGENTA << "}" << RESET;
}

template <typename T, typename U>
void _print(unordered_map<T, U> um) {
    cerr << MAGENTA << "{" << RESET;
    bool first = true;
    for (auto p : um) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(p);
        first = false;
    }
    cerr << MAGENTA << "}" << RESET;
}

template <typename T>
void _print(queue<T> q) {
    cerr << MAGENTA << "[" << RESET;
    bool first = true;
    while (!q.empty()) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(q.front());
        q.pop();
        first = false;
    }
    cerr << MAGENTA << "]" << RESET;
}

template <typename T>
void _print(priority_queue<T> pq) {
    cerr << MAGENTA << "[" << RESET;
    bool first = true;
    while (!pq.empty()) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(pq.top());
        pq.pop();
        first = false;
    }
    cerr << MAGENTA << "]" << RESET;
}

template <typename T>
void _print(stack<T> st) {
    cerr << MAGENTA << "[" << RESET;
    bool first = true;
    while (!st.empty()) {
        if (!first) cerr << MAGENTA << ", " << RESET;
        _print(st.top());
        st.pop();
        first = false;
    }
    cerr << MAGENTA << "]" << RESET;
}

template <typename T, typename... Args>
void _print(T t, Args... args) {
    _print(t);
    cerr << MAGENTA << ", " << RESET;
    _print(args...);
}

template <typename T, size_t N>
void _print(T (&arr)[N]) {
    cerr << MAGENTA << "[" << RESET;
    for (size_t i = 0; i < N; i++) {
        _print(arr[i]);
        if (i != N - 1) cerr << MAGENTA << ", " << RESET;
    }
    cerr << MAGENTA << "]" << RESET;
}

#endif
