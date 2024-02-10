# -*- coding: utf-8 -*-
# @Author  : FuXianxin
# @Time    : 2023/7/27 15:13
# @File    : Two_CNN.py.py
# @Software: PyCharm

import numpy as np
import scipy.io as scio
import tensorflow as tf
import pickle
from keras.utils.vis_utils import plot_model
import matplotlib.pyplot as plt

# 双分支CNN卷积网络——特征值为double，而不是复数

# 该python代码尝试 只利用几个位置的数据作为训练，其它几个位置的数据作为测试

# ----------------------------------------------------------------------------------
# 第一步 加载数据集
# ----------------------------------------------------------------------------------

data_path = r'../0704按键特征/snow版/location_sum/'

loc1_data_path = data_path + 'loc1/'
loc2_data_path = data_path + 'loc2/'
loc3_data_path = data_path + 'loc3/'
loc4_data_path = data_path + 'loc4/'
loc5_data_path = data_path + 'loc5/'

loc1_Rev1_data_path = loc1_data_path + 'loc1_Rev1_feature_mat.mat'
loc1_Rev2_data_path = loc1_data_path + 'loc1_Rev2_feature_mat.mat'
loc1_label_data_path = loc1_data_path + 'label.mat'

loc1_Rev1_data = scio.loadmat(loc1_Rev1_data_path)
loc1_Rev1_data = list(loc1_Rev1_data.values())
loc1_Rev1_data = loc1_Rev1_data[-1]
where_are_nan = np.isnan(loc1_Rev1_data)
loc1_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(loc1_Rev1_data)
loc1_Rev1_data[where_are_inf] = 0

loc1_Rev2_data = scio.loadmat(loc1_Rev2_data_path)
loc1_Rev2_data = list(loc1_Rev2_data.values())
loc1_Rev2_data = loc1_Rev2_data[-1]
where_are_nan = np.isnan(loc1_Rev2_data)
loc1_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(loc1_Rev2_data)
loc1_Rev2_data[where_are_inf] = 0

loc1_label_data = scio.loadmat(loc1_label_data_path)
loc1_label_data = list(loc1_label_data.values())
loc1_label_data = loc1_label_data[-1]

loc2_Rev1_data_path = loc2_data_path + 'loc2_Rev1_feature_mat.mat'
loc2_Rev2_data_path = loc2_data_path + 'loc2_Rev2_feature_mat.mat'
loc2_label_data_path = loc2_data_path + 'label.mat'

loc2_Rev1_data = scio.loadmat(loc2_Rev1_data_path)
loc2_Rev1_data = list(loc2_Rev1_data.values())
loc2_Rev1_data = loc2_Rev1_data[-1]
where_are_nan = np.isnan(loc2_Rev1_data)
loc2_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(loc2_Rev1_data)
loc2_Rev1_data[where_are_inf] = 0

loc2_Rev2_data = scio.loadmat(loc2_Rev2_data_path)
loc2_Rev2_data = list(loc2_Rev2_data.values())
loc2_Rev2_data = loc2_Rev2_data[-1]
where_are_nan = np.isnan(loc2_Rev2_data)
loc2_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(loc2_Rev2_data)
loc2_Rev2_data[where_are_inf] = 0

loc2_label_data = scio.loadmat(loc2_label_data_path)
loc2_label_data = list(loc2_label_data.values())
loc2_label_data = loc2_label_data[-1]

loc3_Rev1_data_path = loc3_data_path + 'loc3_Rev1_feature_mat.mat'
loc3_Rev2_data_path = loc3_data_path + 'loc3_Rev2_feature_mat.mat'
loc3_label_data_path = loc3_data_path + 'label.mat'

loc3_Rev1_data = scio.loadmat(loc3_Rev1_data_path)
loc3_Rev1_data = list(loc3_Rev1_data.values())
loc3_Rev1_data = loc3_Rev1_data[-1]
where_are_nan = np.isnan(loc3_Rev1_data)
loc3_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(loc3_Rev1_data)
loc3_Rev1_data[where_are_inf] = 0

loc3_Rev2_data = scio.loadmat(loc3_Rev2_data_path)
loc3_Rev2_data = list(loc3_Rev2_data.values())
loc3_Rev2_data = loc3_Rev2_data[-1]
where_are_nan = np.isnan(loc3_Rev2_data)
loc3_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(loc3_Rev2_data)
loc3_Rev2_data[where_are_inf] = 0

loc3_label_data = scio.loadmat(loc3_label_data_path)
loc3_label_data = list(loc3_label_data.values())
loc3_label_data = loc3_label_data[-1]

loc4_Rev1_data_path = loc4_data_path + 'loc4_Rev1_feature_mat.mat'
loc4_Rev2_data_path = loc4_data_path + 'loc4_Rev2_feature_mat.mat'
loc4_label_data_path = loc4_data_path + 'label.mat'

loc4_Rev1_data = scio.loadmat(loc4_Rev1_data_path)
loc4_Rev1_data = list(loc4_Rev1_data.values())
loc4_Rev1_data = loc4_Rev1_data[-1]
where_are_nan = np.isnan(loc4_Rev1_data)
loc4_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(loc4_Rev1_data)
loc4_Rev1_data[where_are_inf] = 0

loc4_Rev2_data = scio.loadmat(loc4_Rev2_data_path)
loc4_Rev2_data = list(loc4_Rev2_data.values())
loc4_Rev2_data = loc4_Rev2_data[-1]
where_are_nan = np.isnan(loc4_Rev2_data)
loc4_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(loc4_Rev2_data)
loc4_Rev2_data[where_are_inf] = 0

loc4_label_data = scio.loadmat(loc4_label_data_path)
loc4_label_data = list(loc4_label_data.values())
loc4_label_data = loc4_label_data[-1]

loc5_Rev1_data_path = loc5_data_path + 'loc5_Rev1_feature_mat.mat'
loc5_Rev2_data_path = loc5_data_path + 'loc5_Rev2_feature_mat.mat'
loc5_label_data_path = loc5_data_path + 'label.mat'

loc5_Rev1_data = scio.loadmat(loc5_Rev1_data_path)
loc5_Rev1_data = list(loc5_Rev1_data.values())
loc5_Rev1_data = loc5_Rev1_data[-1]
where_are_nan = np.isnan(loc5_Rev1_data)
loc5_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(loc5_Rev1_data)
loc5_Rev1_data[where_are_inf] = 0

loc5_Rev2_data = scio.loadmat(loc5_Rev2_data_path)
loc5_Rev2_data = list(loc5_Rev2_data.values())
loc5_Rev2_data = loc5_Rev2_data[-1]
where_are_nan = np.isnan(loc5_Rev2_data)
loc5_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(loc5_Rev2_data)
loc5_Rev2_data[where_are_inf] = 0

loc5_label_data = scio.loadmat(loc5_label_data_path)
loc5_label_data = list(loc5_label_data.values())
loc5_label_data = loc5_label_data[-1]


# ----------------------------------------------------------------------------------
# 第二步 将数据集进行划分，划分为训练集和测试集
# ----------------------------------------------------------------------------------

# 选取三个位置的数据作为训练集，另外两个位置的数据作为测试集

Rev1_train_data = np.concatenate((loc1_Rev1_data, loc4_Rev1_data, loc5_Rev1_data))
Rev1_test_data = np.concatenate((loc2_Rev1_data, loc3_Rev1_data))
Rev2_train_data = np.concatenate((loc1_Rev2_data, loc4_Rev2_data, loc5_Rev2_data))
Rev2_test_data = np.concatenate((loc2_Rev2_data, loc3_Rev2_data))
train_label = np.concatenate((loc1_label_data, loc4_label_data, loc5_label_data))
test_label = np.concatenate((loc2_label_data, loc3_label_data))

# Rev1_train_data = loc1_Rev1_data
# Rev1_test_data = np.concatenate((loc2_Rev1_data, loc3_Rev1_data, loc4_Rev1_data, loc5_Rev1_data))
# Rev2_train_data = loc1_Rev2_data
# Rev2_test_data = np.concatenate((loc2_Rev2_data, loc3_Rev2_data, loc4_Rev2_data, loc5_Rev2_data))
# train_label = loc1_label_data
# test_label = np.concatenate((loc2_label_data, loc3_label_data, loc4_label_data, loc5_label_data))

num = 9  # 类别数
train_label = tf.keras.utils.to_categorical(train_label, num)  # num为类别总数
test_label = tf.keras.utils.to_categorical(test_label, num)

# Rev1_train_data = np.expand_dims(Rev1_train_data, 1)
# Rev1_test_data = np.expand_dims(Rev1_test_data, 1)
# Rev2_train_data = np.expand_dims(Rev2_train_data, 1)
# Rev2_test_data = np.expand_dims(Rev2_test_data, 1)

# ----------------------------------------------------------------------------------
# 第三步 模型搭建、定义、编译
# ----------------------------------------------------------------------------------

input_1 = tf.keras.Input(shape=Rev1_train_data[0].shape, name="input_1")
input_2 = tf.keras.Input(shape=Rev2_train_data[0].shape, name="input_2")  # 分别定义input_1和input_2的标签

input_1_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_1)  # 将输入数据input1输入到网络中

input_1_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=1)(input_1_features)

input_1_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_1_features)  # 将输入数据input1输入到网络中

input_1_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=1)(input_1_features)

# input_1_features = tf.keras.layers.LSTM(128)(input_1_features)

# input_1_features = tf.keras.layers.Dropout(0.5)(input_1_features)

input_2_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_2)  # 将输入数据input2输入到网络中


input_2_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=1)(input_2_features)

input_2_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_2_features)  # 将输入数据input2输入到网络中


input_2_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=1)(input_2_features)

# input_2_features = tf.keras.layers.LSTM(128)(input_2_features)

# input_2_features = tf.keras.layers.Dropout(0.5)(input_2_features)

x = tf.keras.layers.concatenate([input_1_features, input_2_features])  # 将两个处理好的分支做concatenate处理，变为一个数据块


x2 = tf.keras.layers.Flatten()(x)

# x2 = tf.keras.layers.BatchNormalization()(x2)
# x2 = tf.keras.layers.Dense(512, activation='relu')(x2)
# x2 = tf.keras.layers.BatchNormalization()(x2)
x2 = tf.keras.layers.Dropout(0.5)(x2)

department_pred = tf.keras.layers.Dense(num, name="output", activation='softmax')(x2)  # 做展平处理最终的分类结果。将输出标记为"output"

# 模型定义
model = tf.keras.Model(
    inputs=[input_1, input_2],
    outputs=department_pred,
)

# 模型编译
optimizer = tf.keras.optimizers.Adam(learning_rate=0.001)  # 定义学习率
model.compile(optimizer=optimizer,  # 导入上面的学习率
              loss='categorical_crossentropy',  # 选择损失函数
              metrics=['accuracy']  # 在训练时输出对训练集的精确度（可删）
              )

# ----------------------------------------------------------------------------------
# 第四步 模型训练并输出结果
# ----------------------------------------------------------------------------------

print(Rev1_train_data.shape)
print(Rev2_train_data.shape)

print(model.summary())

# plot_model(model, to_file='model_loc.png', show_shapes=True, show_layer_names=True, rankdir='TB')  # TB:top-bottom
# plt.figure(figsize=(10, 10))
# img = plt.imread('model_loc.png')
# plt.imshow(img)
# plt.axis('off')
# plt.show()

history = model.fit(
    {"input_1": Rev1_train_data, "input_2": Rev2_train_data},  # 导入训练集input_1,input_2
    {"output": train_label},  # 导入训练集标签（这里的数据和标签分别对应之前模型定义时赋予各数据的标签）
    epochs=40,  # 迭代次数设置为2000
    batch_size=64,  # 每次送入32个数据进行训练（如果少于32则会直接带入当前全部）
    shuffle=True,  # 打乱数据集顺序，防止过拟合
    validation_data=([Rev1_test_data, Rev2_test_data], test_label),  # 导入验证集（注意验证集同样需要与训练集有完全相同的格式和数量）
)

with open('trainHistoryDict_loc.txt', 'wb') as file_pi:
    pickle.dump(history.history, file_pi)

# 为了不重复训练，将训练模型保存下来
model_json = model.to_json()
with open(r"./model_loc.json", 'w')as json_file:
    json_file.write(model_json)  # 权重不在json中,只保存网络结构
model.save_weights('model_loc.h5')

# 同时将测试数据和测试标签保存下来，之后绘制结果使用
np.save("Rev1_test_data_loc", Rev1_test_data)
np.save("Rev2_test_data_loc", Rev2_test_data)
np.save("test_label_loc", test_label)
