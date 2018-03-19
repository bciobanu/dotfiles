// Compile with g++ / clang++ [your other options here ..] -x c++-header -o debug.h.gch debug.h 
#ifndef PRECOMPILED_DEBUG_H_
#define PRECOMPILED_DEBUG_H_
#include <bits/stdc++.h>

#define Debug(...) \
    do { \
        cerr << __PRETTY_FUNCTION__ << ":" << __LINE__ << " - "; \
        Base::__debugE(#__VA_ARGS__, __VA_ARGS__); \
    } while (0)

namespace Base {

template<typename Iter>
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

template<typename T>
std::ostream& PrintInteger(std::ostream& out, T x, 
        const int base=10, const size_t mn_size=0) {
    std::vector<int> digits;
    do {
        digits.push_back(x % base);
        x /= base;
    } while (x);

    while (digits.size() < mn_size) {
        digits.push_back(0);
    }
    PrintArray(out, digits.crbegin(), digits.crend());
    out << std::endl;
    return out;
}

template<typename T>
std::ostream& operator<<(std::ostream& out, const std::vector<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template<typename T, size_t N>
std::ostream& operator<<(std::ostream& out, const std::array<T, N>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::deque<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::list<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::forward_list<T>& rhs) {
    return PrintArray(out, rhs.cbegin(), rhs.cend());
}

template<typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::pair<T, T2>& rhs) {
    out << "{" << rhs.first << ",\t" << rhs.second << "}";
    return out;
}

template<typename Iter>
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

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::set<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::unordered_set<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::multiset<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template<typename T>
std::ostream& operator <<(std::ostream& out, const std::unordered_multiset<T>& rhs) {
    return PrintSet(out, rhs.cbegin(), rhs.cend());
}

template<typename Iter>
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

template<typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::map<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template<typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::multimap<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template<typename T, typename T2>
std::ostream& operator<<(std::ostream& out, const std::unordered_map<T, T2>& rhs) {
    return PrintMap(out, rhs.cbegin(), rhs.cend());
}

template<typename T, typename T2>
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

template<typename T>
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

template<typename T>
void _debug(const char*& txt, T&& t) {
    Print(txt, t);
}

template<typename T, typename... Args>
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
#endif  // PRECOMPILED_DEBUG_H_
