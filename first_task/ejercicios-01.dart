int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

String reverse(String s) {
  if (s.isEmpty) {
    return s;
  } else {
    return reverse(s.substring(1)) + s[0];
  }
}

int max(List<int> list) {
  if (list.length == 1) {
    return list[0];
  } else {
    int subMax = max(list.sublist(1));
    print(subMax);
    return list[0] > subMax ? list[0] : subMax;
  }
}

bool isPrime(int n, [int i = 2]) {
  if (n <= 2) {
    return n == 2;
  }
  if (n % i == 0) {
    return false;
  }
  if (i * i > n) {
    return true;
  }
  return isPrime(n, i + 1);
}

void main() {
    assert(factorial(5) == 120);
    assert(reverse("hello") == "olleh");
    assert(max([1, 2, 3, 4, 5]) == 5);
    assert(isPrime(7) == true);
}
