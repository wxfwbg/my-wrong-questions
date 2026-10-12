# 我的错题本 - 产品需求文档

## 1. 产品概述
- **产品名称**: 我的错题本
- **目标用户**: 高中生（深圳）
- **核心价值**: 拍照录入试卷→自动批改→错题收集→随时刷题
- **使用场景**: 地铁、公交等碎片化时间刷题

## 2. 功能模块

### 2.1 用户系统
- 注册（用户名 + 密码）
- 登录/登出
- 登录状态本地存储

### 2.2 试卷管理
- 拍照上传试卷（调用手机摄像头）
- 显示已上传试卷列表
- 删除试卷

### 2.3 自动批改
- 拍照后识别题目（简化版：用户手动录入答案）
- 与标准答案对比
- 自动计算得分
- 错题自动标记

### 2.4 错题库
- 自动收集所有错题
- 支持单独拍照录入错题
- 错题分类（按科目）
- 错题详情查看

### 2.5 刷题模式
- 题目随机抽取
- 选择/判断题型
- 提交后立即显示答案
- 记录刷题进度

## 3. 技术方案

### 前端
- HTML5 + CSS3 + JavaScript
- 移动端优先设计
- PWA支持（可添加到桌面）

### 存储
- LocalStorage 本地存储
- IndexedDB 存储图片数据

### 拍照
- HTML5 MediaDevices API
- input[type=file] 兼容方案

## 4. 数据结构

### 用户
```
{
  username: string,
  password: string (简化，不加密)
}
```

### 试卷
```
{
  id: string,
  subject: string,  // 科目
  date: string,     // 上传日期
  score: number,    // 得分
  totalScore: number, // 总分
  wrongQuestions: [] // 错题ID列表
}
```

### 错题
```
{
  id: string,
  subject: string,
  question: string,   // 题目内容
  answer: string,     // 正确答案
  userAnswer: string, // 用户答案
  source: string,     // 来源（试卷/手动录入）
  imageUrl: string,   // 题目光敏URL
  times: number,      // 练习次数
  lastPractice: string // 上次练习时间
}
```

## 5. 界面设计

### 页面结构
1. 登录/注册页
2. 首页（功能入口）
3. 拍照上传页
4. 批改结果页
5. 错题库列表页
6. 刷题页
7. 个人中心

### 设计风格
- 简洁清晰
- 大按钮适合触控
- 高对比度便于阅读
- 蓝色主色调（学习氛围）
