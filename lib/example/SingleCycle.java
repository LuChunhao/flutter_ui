package example;

import java.util.Scanner;

public class SingleCycle {

    private static Scanner scanner;

    public static void main(String[] args) {
        System.out.println("输入偶数个羽毛球队伍：");
        scanner = new Scanner(System.in);
        int n = 0;
        n = scanner.nextInt();
        if (n % 2 != 0 || n <= 0) {
            System.out.println("输入错误，程序退出！");
            System.exit(0);
        }
        int[] a = new int[n];
        /*使用双重循环实现球队单循环制轮换
         * i:局数循环； j:每局的球队赋值
         */
//        for (int i = 0; i < n; i++) {
//            for (int j = 0; j < n; j++) {
//                a[(j + i) % n] = j + 1;     // i=2   a[2] = 1  a3 = 2  a0 = 3 a1 = 4
//            }
//            /**
//             * i=0:  a[0]=1 a[1]=2 a[2]=3 a[3]=4
//             * i=1:  a[1]=1 a[2]=2 a[3]=3 a[0]=4
//             * i=2:  a[2]=1 a[3]=2 a[0]=3 a[1]=4
//             * i=3:  a[3]=1 a[0]=2 a[1]=3 a[2]=4
//             */
//            System.out.println("第" + (i + 1) + "局的对阵：");
//            showArray(a);
//        }

        for (int i = 0; i < n; i++) {//a[0]=1 a[1]=2 a[2]=3 a[3]=4
            a[i] = i + 1;
        }
        showArrayNew(a);

    }

    private static void showArray(int[] a) {

        for (int m = 0; m < a.length; m++)
            for (int n = a.length - 1; n > m; n--) {
                if (m + n + 1 == a.length) {
                    System.out.print(a[m] + "-" + a[n] + " ");
                }
            }

        System.out.println();

    }

    private static void showArrayNew(int[] a) {

        for (int j = 0; j < a.length; j++) {
            for (int k = a.length - 1; k < j; k--) {
                if (j + k + 1 == a.length) {
                    System.out.print(a[j] + "-" + a[k] + "\t");
                }
            }
        }
    }
}

