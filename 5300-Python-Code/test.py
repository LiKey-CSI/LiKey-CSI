# -*- coding: utf-8 -*-
# @Author  : FuXianxin
# @Time    : 2023/7/6 23:03
# @File    : test.py.py
# @Software: PyCharm

import numpy as np
import scipy.io as scio
import tensorflow as tf

# 纯测试一些功能

Rev1_test_data = np.load("Rev1_test_data.npy")
Rev2_test_data = np.load("Rev2_test_data.npy")
test_label = np.load("test_label.npy")

data_path = r'../0618按键特征/深度学习分类特征/双分支CNN/'

Rev1_data_path = data_path + 'Rev1_double_feature.mat'
Rev2_data_path = data_path + 'Rev2_double_feature.mat'
label_data_path = data_path + 'label.mat'

Rev1_data = scio.loadmat(Rev1_data_path)
Rev1_data = list(Rev1_data.values())
Rev1_data = Rev1_data[-1]
where_are_nan = np.isnan(Rev1_data)
Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev1_data)
Rev1_data[where_are_inf] = 0

Rev2_data = scio.loadmat(Rev2_data_path)
Rev2_data = list(Rev2_data.values())
Rev2_data = Rev2_data[-1]
where_are_nan = np.isnan(Rev2_data)
Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev2_data)
Rev2_data[where_are_inf] = 0

label_data = scio.loadmat(label_data_path)
label_data = list(label_data.values())
label_data = label_data[-1]


index = [i for i in range(len(Rev1_data))]

np.random.shuffle(index)

Rev1_data = Rev1_data[index]

Rev2_data = Rev2_data[index]

label_data = label_data[index]

# 选取前70%作为训练集，后30%作为测试集
train_num = int(0.7 * len(Rev1_data))

Rev1_train_data = Rev1_data[0:train_num, :, :]
Rev1_test_data = Rev1_data[train_num:len(Rev1_data), :, :]
Rev2_train_data = Rev2_data[0:train_num, :, :]
Rev2_test_data = Rev2_data[train_num:len(Rev2_data), :, :]
train_label = label_data[0:train_num]
test_label = label_data[train_num:len(label_data)]

num = 9  # 类别数
train_label = tf.keras.utils.to_categorical(train_label, num)  # num为类别总数
test_label = tf.keras.utils.to_categorical(test_label, num)

print(Rev1_test_data.shape)
print(Rev2_test_data.shape)
print(test_label.shape)

np.save("Rev1_test_data", Rev1_test_data)
np.save("Rev2_test_data", Rev2_test_data)
np.save("test_label", test_label)
