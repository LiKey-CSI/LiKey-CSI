# -*- coding: utf-8 -*-
# @Author  : FuXianxin
# @Time    : 2023/9/22 15:57
# @File    : fixed_location_two_CNN.py
# @Software: PyCharm

import numpy as np
import scipy.io as scio
import tensorflow as tf
import pickle
from keras.utils.vis_utils import plot_model
import matplotlib.pyplot as plt

# ----------------------------------------------------------------------------------
# 第一步 加载数据集
# ----------------------------------------------------------------------------------
data_path = r'../0802按键特征/旋转特征/location_fixed/loc9/'
# data_path = r'../0704按键特征/snow版-new/location_fixed/loc9/'

Rev1_test_path = data_path + 'loc9_Rev1_test.mat'
Rev1_train_path = data_path + 'loc9_Rev1_train.mat'
Rev2_test_path = data_path + 'loc9_Rev2_test.mat'
Rev2_train_path = data_path + 'loc9_Rev2_train.mat'
test_label_path = data_path + 'test_label.mat'
train_label_path = data_path + 'train_label.mat'

Rev1_test_data = scio.loadmat(Rev1_test_path)
Rev1_test_data = list(Rev1_test_data.values())
Rev1_test_data = Rev1_test_data[-1]
where_are_nan = np.isnan(Rev1_test_data)
Rev1_test_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev1_test_data)
Rev1_test_data[where_are_inf] = 0

Rev1_train_data = scio.loadmat(Rev1_train_path)
Rev1_train_data = list(Rev1_train_data.values())
Rev1_train_data = Rev1_train_data[-1]
where_are_nan = np.isnan(Rev1_train_data)
Rev1_train_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev1_train_data)
Rev1_train_data[where_are_inf] = 0

Rev2_test_data = scio.loadmat(Rev2_test_path)
Rev2_test_data = list(Rev2_test_data.values())
Rev2_test_data = Rev2_test_data[-1]
where_are_nan = np.isnan(Rev2_test_data)
Rev2_test_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev2_test_data)
Rev2_test_data[where_are_inf] = 0


Rev2_train_data = scio.loadmat(Rev2_train_path)
Rev2_train_data = list(Rev2_train_data.values())
Rev2_train_data = Rev2_train_data[-1]
where_are_nan = np.isnan(Rev2_train_data)
Rev2_train_data[where_are_nan] = 0
where_are_inf = np.isinf(Rev2_train_data)
Rev2_train_data[where_are_inf] = 0

test_label = scio.loadmat(test_label_path)
test_label = list(test_label.values())
test_label = test_label[-1]

train_label = scio.loadmat(train_label_path)
train_label = list(train_label.values())
train_label = train_label[-1]

num = 9  # 类别数
train_label = tf.keras.utils.to_categorical(train_label, num)  # num为类别总数
test_label = tf.keras.utils.to_categorical(test_label, num)

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
optimizer = tf.keras.optimizers.Adam(learning_rate=0.0005)  # 定义学习率
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
    epochs=100,  # 迭代次数设置为100
    batch_size=64,  
    shuffle=True,  # 打乱数据集顺序，防止过拟合
    validation_data=([Rev1_test_data, Rev2_test_data], test_label),  # 导入验证集（注意验证集同样需要与训练集有完全相同的格式和数量）
)

with open('trainHistoryDict_fixed.txt', 'wb') as file_pi:
    pickle.dump(history.history, file_pi)

# 为了不重复训练，将训练模型保存下来
model_json = model.to_json()
with open(r"./model_fixed.json", 'w')as json_file:
    json_file.write(model_json)  # 权重不在json中,只保存网络结构
model.save_weights('model_fixed.h5')

# 同时将测试数据和测试标签保存下来，之后绘制结果使用
np.save("Rev1_test_data_fixed", Rev1_test_data)
np.save("Rev2_test_data_fixed", Rev2_test_data)
np.save("test_label_fixed", test_label)
