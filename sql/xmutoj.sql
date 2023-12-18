/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : xmutoj

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2023-12-14 11:00:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子';

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `post_favour`
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_postId` (`postId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子收藏';

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for `post_thumb`
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_postId` (`postId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子点赞';

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` bigint(20) NOT NULL COMMENT '创建题目用户 id',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text COLLATE utf8mb4_unicode_ci COMMENT '题目答案',
  `judgeCase` text COLLATE utf8mb4_unicode_ci COMMENT '判题用例（json 数组）',
  `judgeConfig` text COLLATE utf8mb4_unicode_ci COMMENT '判题配置（json 对象）',
  `submitNum` int(11) NOT NULL DEFAULT '0' COMMENT '题目提交数',
  `acceptedNum` int(11) NOT NULL DEFAULT '0' COMMENT '题目通过数',
  `thumbNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1734770960977956866 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1734735574025236481', '1731620803078791170', '模拟栈', '实现一个栈，栈初始为空，支持四种操作：\n\npush x – 向栈顶插入一个数 x\n；\n\npop – 从栈顶弹出一个数；\n\nempty – 判断栈是否为空；\n\nquery – 查询栈顶元素。\n\n现在要对栈进行 M\n 个操作，其中的每个操作 3\n 和操作 4\n 都要输出相应的结果。', '[\"栈\",\"中等\",\"算法\"]', '```java\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int m = sc.nextInt();\n\n        Stack<Integer> stk = new Stack<>();\n\n        while (m -- > 0) {\n            String op = sc.next();\n            if (\"push\".equals(op)) {\n                int x = sc.nextInt();\n                stk.push(x);\n            } else if (\"pop\".equals(op)) {\n                stk.pop();\n            } else if (\"empty\".equals(op)) {\n                if (stk.empty())\n                    System.out.println(\"YES\");\n                else\n                    System.out.println(\"NO\");\n            } else {\n                System.out.println(stk.peek());\n            }\n        }\n    }\n}\n```', '[{\"input\":\"10 push 5 query push 6 pop query pop empty push 4 query empty\",\"output\":\"5 5 YES 4 NO\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 08:42:45', '2023-12-13 08:42:45', '0');
INSERT INTO `question` VALUES ('1734736264302817281', '1731620803078791170', '斐波那契数列', '输入整数 N\n，求出斐波那契数列中的第 N\n 项是多少。\n\n斐波那契数列的第 0\n 项是 0\n，第 1\n 项是 1\n，从第 2\n 项开始的每一项都等于前两项之和。\n\n输入格式\n第一行包含整数 T\n，表示共有 T\n 个测试数据。\n\n接下来 T\n 行，每行包含一个整数 N\n。\n\n输出格式\n每个测试数据输出一个结果，每个结果占一行，\n\n结果格式为 Fib(N) = x，其中 N\n 为项数，x\n 为第 N\n 项的值。\n\n数据范围\n0≤N≤60', '[\"数组\",\"简单\",\"算法\",\"贪心\"]', '```java\nimport java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        long[] f = new long[61];\n        f[0] = 0;\n        f[1] = 1;\n        for (int i = 2; i <= 60; i ++ )\n            f[i] = f[i - 1] + f[i - 2];\n\n        int T = sc.nextInt();\n        while (T -- > 0) {\n            int n = sc.nextInt();\n            System.out.printf(\"Fib(%d) = %d\\n\", n, f[n]);\n        }\n    }\n}\n```', '[{\"input\":\"3 0 4 2\",\"output\":\"Fib(0) \\u003d 0 Fib(4) \\u003d 3 Fib(2) \\u003d 1\"}]', '{\"timeLimit\":1002,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 08:45:29', '2023-12-13 08:45:29', '0');
INSERT INTO `question` VALUES ('1734736737516777473', '1731620803078791170', 'A+B', '输入两个整数，求这两个整数的和是多少。\n\n输入格式\n输入两个整数A,B\n，用空格隔开\n\n输出格式\n输出一个整数，表示这两个数的和\n\n数据范围\n0≤A,B≤108', '[\"简单\",\"模拟\"]', '```java\nimport java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int x = sc.nextInt(), y = sc.nextInt();\n        System.out.println(x + y);\n    }\n}\n```', '[{\"input\":\"3 4\",\"output\":\"7\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '6', '5', '0', '0', '2023-12-13 08:47:22', '2023-12-13 08:47:22', '0');
INSERT INTO `question` VALUES ('1734737227533119489', '1731620803078791170', '差', '读取四个整数 A,B,C,D\n，并计算 (A×B−C×D)\n 的值。\n\n输入格式\n输入共四行，第一行包含整数 A\n，第二行包含整数 B\n，第三行包含整数 C\n，第四行包含整数 D\n。\n\n输出格式\n输出格式为 DIFERENCA = X，其中 X\n 为 (A×B−C×D)\n 的结果。\n\n数据范围\n−10000≤A,B,C,D≤10000', '[\"顺序结构\",\"简单\"]', '```java\nimport java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int a = sc.nextInt(), b = sc.nextInt();\n        int c = sc.nextInt(), d = sc.nextInt();\n        System.out.printf(\"DIFERENCA = %d\\n\", a * b - c * d);\n    }\n}\n```', '[{\"input\":\"5 6 7 8\",\"output\":\"DIFERENCA \\u003d -26\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 08:49:19', '2023-12-13 08:52:06', '0');
INSERT INTO `question` VALUES ('1734737675463815170', '1731620803078791170', '圆的面积', '计算圆的面积的公式定义为 A=πR2\n。\n\n请利用这个公式计算所给圆的面积。\n\nπ\n 的取值为 3.14159\n。\n\n输入格式\n输入包含一个浮点数，为圆的半径 R\n。\n\n输出格式\n输出格式为 A=X，其中 X\n 为圆的面积，用浮点数表示，保留四位小数。\n\n数据范围\n0<R<10000.00', '[\"简单\",\"顺序结构\"]', '```java\nimport java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        double r = sc.nextDouble();\n\n        System.out.printf(\"A=%.4f\\n\", r * r * 3.14159);\n    }\n}\n```', '[{\"input\":\"2.00\",\"output\":\"A\\u003d12.5664\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 08:51:06', '2023-12-13 08:51:06', '0');
INSERT INTO `question` VALUES ('1734760170141118466', '1731620803078791170', '用户分组', '有 n 个人被分成数量未知的组。每个人都被标记为一个从 0 到 n - 1 的唯一ID 。\n\n给定一个整数数组 groupSizes ，其中 groupSizes[i] 是第 i 个人所在的组的大小。例如，如果 groupSizes[1] = 3 ，则第 1 个人必须位于大小为 3 的组中。\n\n返回一个组列表，使每个人 i 都在一个大小为 groupSizes[i] 的组中。\n\n每个人应该 恰好只 出现在 一个组 中，并且每个人必须在一个组中。如果有多个答案，返回其中 任何 一个。可以 保证 给定输入 至少有一个 有效的解。\n示例 ：\n\n输入：groupSizes = [3,3,3,3,3,1,3]\n输出：[[5],[0,1,2],[3,4,6]]\n解释：\n第一组是 [5]，大小为 1，groupSizes[5] = 1。\n第二组是 [0,1,2]，大小为 3，groupSizes[0] = groupSizes[1] = groupSizes[2] = 3。\n第三组是 [3,4,6]，大小为 3，groupSizes[3] = groupSizes[4] = groupSizes[6] = 3。 \n其他可能的解决方案有 [[2,1,6],[5],[0,4,3]] 和 [[5],[0,6,2],[4,3,1]]。\n\n ', '[\"数组\",\"哈希表\",\"中等\"]', '\n```java\nclass Solution {\n    public List<List<Integer>> groupThePeople(int[] groupSizes) {\n        Map<Integer, List<Integer>> hash = new HashMap<>();\n        List<List<Integer>> res = new ArrayList<>();\n        for (int i = 0; i < groupSizes.length; i ++ ) {\n            int x = groupSizes[i];\n            if (hash.get(x) == null) hash.put(x, new ArrayList<>());\n            hash.get(x).add(i);\n            if (hash.get(x).size() == x) {\n                res.add(hash.get(x));\n                hash.put(x, null);\n            }\n        }\n        return res;\n    }\n}\n```', '[{\"input\":\"groupSizes \\u003d [2,1,3,3,3,2]\",\"output\":\"[[1],[0,5],[2,3,4]]\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 10:20:29', '2023-12-13 10:20:29', '0');
INSERT INTO `question` VALUES ('1734760786108215297', '1731620803078791170', '最大公约数', '输入两个整数 a\n 和 b\n，请你编写一个函数，int gcd(int a, int b), 计算并输出 a\n 和 b\n 的最大公约数。\n\n输入格式\n共一行，包含两个整数 a\n 和 b\n。\n\n输出格式\n共一行，包含一个整数，表示 a\n 和 b\n 的最大公约数。\n\n数据范围\n1≤a,b≤1000', '[\"基础\",\"简单\",\"函数\"]', '\n```java\nimport java.util.Scanner;\n\npublic class Main {\n    private static int gcd(int a, int b) {\n        for (int i = 1000; i > 0; i -- )\n            if (a % i == 0 && b % i == 0)\n                return i;\n        return 0;\n    }\n\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int a = sc.nextInt(), b = sc.nextInt();\n        System.out.println(gcd(a, b));\n    }\n}\n```', '[{\"input\":\"12 16\",\"output\":\"4\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 10:22:56', '2023-12-13 10:22:56', '0');
INSERT INTO `question` VALUES ('1734761295196057601', '1731620803078791170', '两个数的和', '输入两个浮点数 x\n 和 y\n，请你编写一个函数，double add(double x, double y)，计算并输出 x\n 与 y\n 的和。\n\n输入格式\n共一行，包含两个浮点数 x\n 和 y\n。\n\n输出格式\n共一行，包含一个浮点数，表示两个数的和，结果保留 2\n 位小数。\n\n数据范围\n−1000≤x,y≤1000', '[\"简单\",\"函数\"]', '\n```java\nimport java.util.Scanner;\n\npublic class Main {\n    private static double add(double x, double y) {\n        return x + y;\n    }\n\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        System.out.printf(\"%.2f\\n\", add(sc.nextDouble(), sc.nextDouble()));\n    }\n}\n```', '[{\"input\":\"1.11 2.22\",\"output\":\"3.33\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 10:24:57', '2023-12-13 10:24:57', '0');
INSERT INTO `question` VALUES ('1734761637199605761', '1731620803078791170', '最小公倍数', '输入两个整数 a\n 和 b\n，请你编写一个函数，int lcm(int a, int b)，计算并输出 a\n 和 b\n 的最小公倍数。\n\n输入格式\n共一行，包含两个整数 a\n 和 b\n。\n\n输出格式\n共一行，包含一个整数，表示 a\n 和 b\n 的最小公倍数。\n\n数据范围\n1≤a,b≤1000', '[\"简单\",\"基础\",\"函数\"]', '\n```\nimport java.util.Scanner;\n\npublic class Main {\n    private static int lcm(int a, int b) {\n        for (int i = 1; i <= a * b; i ++ )\n            if (i % a == 0 && i % b == 0)\n                return i;\n        return -1;\n    }\n\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        System.out.println(lcm(sc.nextInt(), sc.nextInt()));\n    }\n}\n```', '[{\"input\":\"6 8\",\"output\":\"24\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 10:26:19', '2023-12-13 10:26:19', '0');
INSERT INTO `question` VALUES ('1734762018646388738', '1731620803078791170', '数组翻转', '给定一个长度为 n\n 的数组 a\n 和一个整数 size\n，请你编写一个函数，void reverse(int a[], int size)，实现将数组 a\n 中的前 size\n 个数翻转。\n\n输出翻转后的数组 a\n。\n\n输入格式\n第一行包含两个整数 n\n 和 size\n。\n\n第二行包含 n\n 个整数，表示数组 a\n。\n\n输出格式\n共一行，包含 n\n 个整数，表示翻转后的数组 a\n。\n\n数据范围\n1≤size≤n≤1000\n,\n1≤a[i]≤1000', '[\"简单\",\"数组\",\"函数\"]', '```\nimport java.util.Scanner;\n\npublic class Main {\n    private static void reverse(int[] a, int size) {\n        for (int i = 0, j = size - 1; i < j; i ++, j -- ) {\n            int t = a[i];\n            a[i] = a[j];\n            a[j] = t;\n        }\n    }\n\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt(), size = sc.nextInt();\n        int[] a = new int[n];\n        for (int i = 0; i < n; i ++ )\n            a[i] = sc.nextInt();\n\n        reverse(a, size);\n        for (int i = 0; i < n; i ++ )\n            System.out.printf(\"%d \", a[i]);\n    }\n}\n```', '[{\"input\":\"5 3 1 2 3 4 5\",\"output\":\"3 2 1 4 5\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 10:27:50', '2023-12-13 10:27:50', '0');
INSERT INTO `question` VALUES ('1734770960977956865', '1731620803078791170', '模拟队列', '实现一个队列，队列初始为空，支持四种操作：\n\npush x – 向队尾插入一个数 x\n；\npop – 从队头弹出一个数；\nempty – 判断队列是否为空；\nquery – 查询队头元素。\n现在要对队列进行 M\n 个操作，其中的每个操作 3\n 和操作 4\n 都要输出相应的结果。\n\n输入格式\n第一行包含整数 M\n，表示操作次数。\n\n接下来 M\n 行，每行包含一个操作命令，操作命令为 push x，pop，empty，query 中的一种。\n\n输出格式\n对于每个 empty 和 query 操作都要输出一个查询结果，每个结果占一行。\n\n其中，empty 操作的查询结果为 YES 或 NO，query 操作的查询结果为一个整数，表示队头元素的值。\n\n数据范围\n1≤M≤100000\n,\n1≤x≤109\n,\n所有操作保证合法。', '[\"中等\",\"队列\"]', '```\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int m = sc.nextInt();\n\n        Queue<Integer> q = new LinkedList<>();\n        while (m -- > 0) {\n            String op = sc.next();\n            if (op.equals(\"push\")) {\n                int x = sc.nextInt();\n                q.add(x);\n            } else if (op.equals(\"pop\")) {\n                q.remove();\n            } else if (op.equals(\"empty\")) {\n                if (q.isEmpty()) {\n                    System.out.println(\"YES\");\n                } else {\n                    System.out.println(\"NO\");\n                }\n            } else {\n                System.out.println(q.peek());\n            }\n        }\n    }\n}\n```', '[{\"input\":\"10 push 6 empty query pop empty push 3 push 4 pop query push 6\",\"output\":\"NO 6 YES 4\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', '0', '0', '0', '0', '2023-12-13 11:03:22', '2023-12-13 11:03:22', '0');

-- ----------------------------
-- Table structure for `question_submit`
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `questionId` bigint(20) NOT NULL COMMENT '题目 id',
  `userId` bigint(20) DEFAULT NULL COMMENT '鍒涘缓鐢ㄦ埛 id',
  `judgeInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍒ら淇℃伅锛坖son 瀵硅薄锛?',
  `submitLanguage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编程语言',
  `submitCode` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户提交代码',
  `submitState` int(11) NOT NULL DEFAULT '0' COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_questionId` (`questionId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1734820133207068675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目提交';

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES ('1734738313711054849', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":143}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 08:53:38', '2023-12-13 08:53:39', '0');
INSERT INTO `question_submit` VALUES ('1734740376150994945', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":140}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:50', '2023-12-13 09:01:51', '0');
INSERT INTO `question_submit` VALUES ('1734740378092957697', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":124}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:50', '2023-12-13 09:01:51', '0');
INSERT INTO `question_submit` VALUES ('1734740378877292545', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":137}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:50', '2023-12-13 09:01:51', '0');
INSERT INTO `question_submit` VALUES ('1734740379602907137', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":113}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:51', '2023-12-13 09:01:51', '0');
INSERT INTO `question_submit` VALUES ('1734740380123000834', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":136}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:51', '2023-12-13 09:01:52', '0');
INSERT INTO `question_submit` VALUES ('1734740381628755970', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":131}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:51', '2023-12-13 09:01:52', '0');
INSERT INTO `question_submit` VALUES ('1734740382744440834', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":157}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:51', '2023-12-13 09:01:52', '0');
INSERT INTO `question_submit` VALUES ('1734740383470055425', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":124}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:52', '2023-12-13 09:01:52', '0');
INSERT INTO `question_submit` VALUES ('1734740384124366850', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":123}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:52', '2023-12-13 09:01:52', '0');
INSERT INTO `question_submit` VALUES ('1734740385370075138', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":129}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:52', '2023-12-13 09:01:53', '0');
INSERT INTO `question_submit` VALUES ('1734740386091495426', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":99}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 09:01:52', '2023-12-13 09:01:53', '0');
INSERT INTO `question_submit` VALUES ('1734776683480760321', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":134}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:26:06', '2023-12-13 11:26:07', '0');
INSERT INTO `question_submit` VALUES ('1734777086696062977', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":116}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:27:42', '2023-12-13 11:27:43', '0');
INSERT INTO `question_submit` VALUES ('1734777806350548993', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":149}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:30:34', '2023-12-13 11:30:35', '0');
INSERT INTO `question_submit` VALUES ('1734777934901678082', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":110}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:31:04', '2023-12-13 11:31:05', '0');
INSERT INTO `question_submit` VALUES ('1734778186417315841', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":109}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:32:04', '2023-12-13 11:32:05', '0');
INSERT INTO `question_submit` VALUES ('1734781775516913666', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":120}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:46:20', '2023-12-13 11:46:21', '0');
INSERT INTO `question_submit` VALUES ('1734782657180540930', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":138}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:49:50', '2023-12-13 11:49:51', '0');
INSERT INTO `question_submit` VALUES ('1734783065923833858', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":123}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:51:28', '2023-12-13 11:51:29', '0');
INSERT INTO `question_submit` VALUES ('1734783384963588098', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":107}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:52:44', '2023-12-13 11:52:45', '0');
INSERT INTO `question_submit` VALUES ('1734783775730049026', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":123}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:54:17', '2023-12-13 11:54:18', '0');
INSERT INTO `question_submit` VALUES ('1734784025534406657', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":129}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:55:17', '2023-12-13 11:55:17', '0');
INSERT INTO `question_submit` VALUES ('1734784538531373057', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":108}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:57:19', '2023-12-13 11:57:20', '0');
INSERT INTO `question_submit` VALUES ('1734784781859725313', '1734737227533119489', '1731620803078791170', '{\"message\":\"答案错误\",\"memory\":0,\"time\":111}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:58:17', '2023-12-13 11:58:18', '0');
INSERT INTO `question_submit` VALUES ('1734785139533279234', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":111}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 11:59:42', '2023-12-13 11:59:43', '0');
INSERT INTO `question_submit` VALUES ('1734785356332658689', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":113}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:00:34', '2023-12-13 12:00:35', '0');
INSERT INTO `question_submit` VALUES ('1734789908268126210', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":110}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:18:39', '2023-12-13 12:18:40', '0');
INSERT INTO `question_submit` VALUES ('1734790564076851202', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":152}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:21:15', '2023-12-13 12:21:17', '0');
INSERT INTO `question_submit` VALUES ('1734790940582744066', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":156}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:22:45', '2023-12-13 12:22:47', '0');
INSERT INTO `question_submit` VALUES ('1734791093226143746', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":191}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:23:22', '2023-12-13 12:23:23', '0');
INSERT INTO `question_submit` VALUES ('1734791508650917889', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":149}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 12:25:01', '2023-12-13 12:25:02', '0');
INSERT INTO `question_submit` VALUES ('1734811176782635010', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":104}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:43:10', '2023-12-13 13:43:11', '0');
INSERT INTO `question_submit` VALUES ('1734811670896717826', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":87}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:45:08', '2023-12-13 13:45:09', '0');
INSERT INTO `question_submit` VALUES ('1734812234456068098', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":76}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:47:22', '2023-12-13 13:47:23', '0');
INSERT INTO `question_submit` VALUES ('1734812234984550402', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":78}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:47:22', '2023-12-13 13:47:23', '0');
INSERT INTO `question_submit` VALUES ('1734812577914961922', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":103}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:48:44', '2023-12-13 13:48:45', '0');
INSERT INTO `question_submit` VALUES ('1734812667152973826', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":94}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:49:05', '2023-12-13 13:49:06', '0');
INSERT INTO `question_submit` VALUES ('1734813264275054594', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":98}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:51:28', '2023-12-13 13:51:28', '0');
INSERT INTO `question_submit` VALUES ('1734814577943760897', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":84}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:56:41', '2023-12-13 13:56:42', '0');
INSERT INTO `question_submit` VALUES ('1734814669039849474', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":104}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:57:03', '2023-12-13 13:57:03', '0');
INSERT INTO `question_submit` VALUES ('1734815330754117634', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":103}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 13:59:40', '2023-12-13 13:59:41', '0');
INSERT INTO `question_submit` VALUES ('1734815410869518338', '1734736737516777473', '1731620803078791170', '{\"message\":\"答案错误\",\"memory\":0,\"time\":111}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(1);\n    }\n}\n', '2', '2023-12-13 13:59:59', '2023-12-13 14:00:00', '0');
INSERT INTO `question_submit` VALUES ('1734816145413783553', '1734736737516777473', '1731620803078791170', '{\"message\":\"答案错误\",\"memory\":0,\"time\":100}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(111);\n    }\n}\n', '2', '2023-12-13 14:02:55', '2023-12-13 14:02:55', '0');
INSERT INTO `question_submit` VALUES ('1734818472896004097', '1734736737516777473', '1731620803078791170', '{\"message\":\"成功\",\"memory\":0,\"time\":76}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '2', '2023-12-13 14:12:09', '2023-12-13 14:12:10', '0');
INSERT INTO `question_submit` VALUES ('1734818805709889537', '1734736737516777473', '1731620803078791170', '{\"message\":\"答案错误\",\"memory\":0,\"time\":89}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(222);\n    }\n}\n', '2', '2023-12-13 14:13:29', '2023-12-13 14:13:30', '0');
INSERT INTO `question_submit` VALUES ('1734820133207068674', '1734770960977956865', '1731620803078791170', '{}', 'java', 'public class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n', '0', '2023-12-13 14:18:45', '2023-12-13 14:18:45', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `userName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
  `gender` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT '男' COMMENT '性别 男 女',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `userState` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '正常' COMMENT '状态:0-正常/1-注销/2-封号',
  `userRole` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_unionId` (`userAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=1731620803078791173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1731620803078791170', 'cool', 'fdec810a0ceeca3c94a2502df7a0b596', 'Cool', 'https://cool-xmut-oj.oss-cn-beijing.aliyuncs.com/2023/12/12/8e615e91cbca4b7f891c7245e2b59938-1f3a8c026517bb03.jpg', '测试1', '男', '11111222', '1111222', '正常', 'admin', '2023-12-04 18:25:46', '2023-12-13 01:20:37', '0');
INSERT INTO `user` VALUES ('1731620803078791171', 'user', '1b69e08da5851738e979649659d6bb0d', 'User', 'https://cdn.acwing.com/media/user/profile/photo/3768_lg_455d3c7262.png', '测试2', '男', '111111', '111111', '正常', 'user', '2023-12-13 10:29:05', '2023-12-13 10:29:47', '0');
INSERT INTO `user` VALUES ('1731620803078791172', 'ikun', 'null', 'admin', 'https://cdn.acwing.com/media/user/profile/photo/281272_lg_f85d2e96d6.bmp', 'ikun', '男', 'ikun', 'ikun', '封号', 'user', '2023-12-13 10:35:19', '2023-12-13 10:37:59', '0');

-- ----------------------------
-- Table structure for `user12`
-- ----------------------------
DROP TABLE IF EXISTS `user12`;
CREATE TABLE `user12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_unionId` (`unionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1734495952540094466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

-- ----------------------------
-- Records of user12
-- ----------------------------
INSERT INTO `user12` VALUES ('1', 'cool', 'fdec810a0ceeca3c94a2502df7a0b596', null, null, 'Cool', '\r\nhttps://cool-xmut-oj.oss-cn-beijing.aliyuncs.com/2023/12/12/8e615e91cbca4b7f891c7245e2b59938-1f3a8c026517bb03.jpg', 'test', 'admin', '2023-12-04 18:30:16', '2023-12-12 19:13:19', '0');
INSERT INTO `user12` VALUES ('1734495952540094465', 'user', 'fdec810a0ceeca3c94a2502df7a0b596', null, null, 'User', 'https://cool-xmut-oj.oss-cn-beijing.aliyuncs.com/2023/12/12/d1b5d2efa22c4c3f9d8a9ea65b4dbf2f1599607194827.jpeg', '高冷', 'user', '2023-12-12 16:50:35', '2023-12-13 00:42:26', '0');

-- ----------------------------
-- Table structure for `user_code`
-- ----------------------------
DROP TABLE IF EXISTS `user_code`;
CREATE TABLE `user_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userAccount` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户编号表';

-- ----------------------------
-- Records of user_code
-- ----------------------------
