// Compile with g++ / clang++ [your other options here ..] -x c++-header -o debug.h.gch debug.h
#ifndef _DEBUG_HPP_
#define _DEBUG_HPP_

#include <bits/stdc++.h>

#define DEBUG(...) \
    do { \
        std::cerr << __PRETTY_FUNCTION__ << ":" << __LINE__ << " - "; \
        Debug::__debugE(#__VA_ARGS__, __VA_ARGS__); \
    } while (0)

#define START_TIMER(P, ...) Debug::Profiler P(#__VA_ARGS__)
#define GET_TIME(P) P.get()
#define PRINT_DIGITS(X, ...) Debug::PrintInteger(X, __VA_ARGS__)

namespace Debug {

struct Profiler {
    Profiler(const std::string name_="") :
        name(name_),
        start_time(std::chrono::high_resolution_clock::now())
    {}

    ~Profiler() { get(); }

    void get() {
        std::cerr << name << ": " <<
            std::chrono::duration_cast<std::chrono::duration<double>>
                (std::chrono::high_resolution_clock::now() - start_time).count() << std::endl;
    }

    void reset(const std::string name_="") {
        *this = Profiler(name_);
    }

    std::string name;
    std::chrono::high_resolution_clock::time_point start_time;
};

template <typename Iter>
std::ostream& PrintArray(std::ostream& out, Iter b, Iter e) {
    out << "[";
    for (auto iter = b; iter != e; ++iter) {
        if (iter != b) {
            out << ",\t";
        }
        out << *iter;
    }
    out << "]";
    return out;
}

template <typename T>
void PrintInteger(T x, const int base=10, const size_t mn_size=0) {
    std::vector<int> digits;
    do {
        digits.push_back(x % base);
        x /= base;
    } while (x);

    while (digits.size() < mn_size) {
        digits.push_back(0);
    }
    PrintArray(std::cerr, digits.crbegin(), digits.crend());
    std::cerr << std::endl;
}

template <typename T>
std::ostream& operator<<(std::ostream& out, const std::vector<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template <typename T, size_t N>
std::ostream& operator<<(std::ostream& out, const std::array<T, N>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::deque<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::list<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::forward_list<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template <typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::pair<T, T2>& rhs) {
    out << "{" << rhs.first << ",\t" << rhs.second << "}";
    return out;
}

template <typename Iter>
std::ostream& PrintSet(std::ostream& out, Iter b, Iter e) {
    out << "{";
    for (auto iter = b; iter != e; ++iter) {
        if (iter != b) {
            out << ", ";
        }
        out << *iter;
    }
    out << "}";
    return out;
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::set<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::unordered_set<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::multiset<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template <typename T>
std::ostream& operator <<(std::ostream& out, const std::unordered_multiset<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template <typename Iter>
std::ostream& PrintMap(std::ostream& out, Iter b, Iter e) {
    out << "[";
    for (auto iter = b; iter != e; ++iter) {
        if (iter != b) {
            out << ", ";
        }
        out << "{" << iter->first << ", " << iter->second << "}";
    }
    out << "]";
    return out;
}

template <typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::map<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template <typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::multimap<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template <typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::unordered_map<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template <typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::unordered_multimap<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

void Print(const char*& txt, const char* _txt) {
    std::string name = "";
    while (*txt != '\0' and *txt != ',') {
        name += *txt;
        txt++;
    }

    while (*txt != '\0' and (*txt == ',' or *txt == ' ')) {
        txt++;
    }

    if (name == "\"\\n\"") {
        std::cerr << std::endl;
        return ;
    }

    std::string txt_ = _txt;
    if (name.substr(1, txt_.size()) == txt_) {
        std::cerr << txt_ << '\t';
    } else {
        std::cerr << name << " = " << txt_ << '\t';
    }
}

template <typename T>
void Print(const char*& txt, T&& t) {
    std::string name = "";
    while (*txt != '\0' and *txt != ',') {
        name += *txt;
        txt++;
    }

    while (*txt != '\0' and (*txt == ',' or *txt == ' ')) {
        txt++;
    }

    std::cerr << name << " = " << t << '\t';
}

template <typename T>
void _debug(const char*& txt, T&& t) {
    Print(txt, t);
}

template <typename T, typename... Args>
void _debug(const char*& txt, T&& t, Args&&... args) {
    Print(txt, t);
    _debug(txt, args...);
}

template <typename... Args>
void __debugE(const char* txt, Args&&... args) {
    _debug(txt, args...);
    std::cerr << std::endl;
}

}

#endif  // _DEBUG_HPP_
