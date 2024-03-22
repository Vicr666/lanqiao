## 牛的学术圈 I

+ 排序 + 双指针

时间复杂度$O(n + logn)$

```c++
#include <iostream>
#include <cstring>
#include <algorithm>

using namespace std;

const int N = 100010;

int n, m, w[N];

bool compare(int a, int b) {
    return a > b;
}

int main()
{
    scanf("%d%d", &n, &m);
    
    for (int i = 1; i <= n; i ++ ) scanf("%d", &w[i]);
    sort(w + 1, w + n + 1, compare);
    
    int res = 0;
    for (int i = 1, j = n; i <= n; i ++ ) {
        while (j && w[j] < i) j -- ;
        if (w[i] >= i - 1 && i - j <= m) res = i;
    }
    
    cout << res;
    
    return 0;
}
```



* 二分

时间复杂度$O(nlogn)$

```c++
#include <iostream>
#include <cstring>
#include <algorithm>

using namespace std;

const int N = 100010;

int n, L;
int w[N];

bool check(int mid)
{
    //通过个数来判断
    int a = 0, b = 0;
    for (int i = 1; i <= n; i ++ )
        if (w[i] >= mid) a ++ ;
        else if (w[i] == mid - 1) b ++ ;
    return a + min(b, L) >= mid;
}

int main()
{
    scanf("%d%d", &n, &L);
    for (int i = 1; i <= n; i ++ ) scanf("%d", &w[i]);

    int l = 0, r = n;
    while (l < r)
    {
        int mid = l + r + 1 >> 1;
        if (check(mid)) l = mid;
        else r = mid - 1;
    }

    printf("%d\n", r);
    return 0;
}
```

