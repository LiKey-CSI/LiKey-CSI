# -*- coding: utf-8 -*-
# @Author  : FuXianxin
# @Time    : 2023/7/6 15:13
# @File    : Two_CNN.py.py
# @Software: PyCharm

import numpy as np
import scipy.io as scio
import tensorflow as tf
import pickle
from keras.utils.vis_utils import plot_model
import matplotlib.pyplot as plt

# 双分支CNN卷积网络——特征值为double，而不是复数
# 选取3个位置为训练，两个位置为测试

# ----------------------------------------------------------------------------------
# 第一步 加载数据集
# ----------------------------------------------------------------------------------

data_path = r'../0618按键特征/深度学习分类特征/双分支CNN_位置分离/'

Train_Rev1_data_path = data_path + 'Train_Rev1_feature.mat'
Train_Rev2_data_path = data_path + 'Train_Rev2_feature.mat'
Train_label_data_path = data_path + 'Train_label.mat'

Test_Rev1_data_path = data_path + 'Test_Rev1_feature.mat'
Test_Rev2_data_path = data_path + 'Test_Rev2_feature.mat'
Test_label_data_path = data_path + 'Test_label.mat'

Train_Rev1_data = scio.loadmat(Train_Rev1_data_path)
Train_Rev1_data = list(Train_Rev1_data.values())
Train_Rev1_data = Train_Rev1_data[-1]
where_are_nan = np.isnan(Train_Rev1_data)
Train_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(Train_Rev1_data)
Train_Rev1_data[where_are_inf] = 0

Train_Rev2_data = scio.loadmat(Train_Rev2_data_path)
Train_Rev2_data = list(Train_Rev2_data.values())
Train_Rev2_data = Train_Rev2_data[-1]
where_are_nan = np.isnan(Train_Rev2_data)
Train_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(Train_Rev2_data)
Train_Rev2_data[where_are_inf] = 0

Train_label_data = scio.loadmat(Train_label_data_path)
Train_label_data = list(Train_label_data.values())
Train_label_data = Train_label_data[-1]

Test_Rev1_data = scio.loadmat(Test_Rev1_data_path)
Test_Rev1_data = list(Test_Rev1_data.values())
Test_Rev1_data = Test_Rev1_data[-1]
where_are_nan = np.isnan(Test_Rev1_data)
Test_Rev1_data[where_are_nan] = 0
where_are_inf = np.isinf(Test_Rev1_data)
Test_Rev1_data[where_are_inf] = 0

Test_Rev2_data = scio.loadmat(Test_Rev2_data_path)
Test_Rev2_data = list(Test_Rev2_data.values())
Test_Rev2_data = Test_Rev2_data[-1]
where_are_nan = np.isnan(Test_Rev2_data)
Test_Rev2_data[where_are_nan] = 0
where_are_inf = np.isinf(Test_Rev2_data)
Test_Rev2_data[where_are_inf] = 0

Test_label_data = scio.loadmat(Test_label_data_path)
Test_label_data = list(Test_label_data.values())
Test_label_data = Test_label_data[-1]

# ----------------------------------------------------------------------------------
# 第二步 将数据集进行划分，划分为训练集和测试集
# ----------------------------------------------------------------------------------


Rev1_train_data = Train_Rev1_data
Rev1_test_data = Test_Rev1_data
Rev2_train_data = Train_Rev2_data
Rev2_test_data = Test_Rev1_data
train_label = Train_label_data
test_label = Test_label_data

num = 9  # 类别数
train_label = tf.keras.utils.to_categorical(train_label, num)  # num为类别总数
test_label = tf.keras.utils.to_categorical(test_label, num)

# ----------------------------------------------------------------------------------
# 第三步 模型搭建、定义、编译
# ----------------------------------------------------------------------------------

input_1 = tf.keras.Input(shape=Rev1_train_data[0].shape, name="input_1")
input_2 = tf.keras.Input(shape=Rev2_train_data[0].shape, name="input_2")  # 分别定义input_1和input_2的标签

input_1 = tf.keras.layers.Dropout(0.5)(input_1)

input_1_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_1)  # 将输入数据input1输入到网络中

input_1_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=2)(input_1_features)

input_2 = tf.keras.layers.Dropout(0.5)(input_2)

input_2_features = tf.keras.layers.Conv1D(filters=64,
                                          kernel_size=4,
                                          padding='same',
                                          activation=tf.nn.relu)(input_2)  # 将输入数据input2输入到网络中


input_2_features = tf.keras.layers.MaxPool1D(pool_size=2, strides=2)(input_2_features)

x = tf.keras.layers.concatenate([input_1_features, input_2_features])  # 将两个处理好的分支做concatenate处理，变为一个数据块
x2 = tf.keras.layers.Flatten()(x)
department_pred = tf.keras.layers.Dense(num, name="output", activation='softmax')(x2)  # 做展平处理最终的分类结果。将输出标记为"output"

# 模型定义
model = tf.keras.Model(
    inputs=[input_1, input_2],
    outputs=department_pred,
)

# 模型编译
optimizer = tf.keras.optimizers.Adam(learning_rate=0.01)  # 定义学习率
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

# plot_model(model, to_file='model.png', show_shapes=True, show_layer_names=True, rankdir='TB')  # TB:top-bottom
# plt.figure(figsize=(10, 10))
# img = plt.imread('model.png')
# plt.imshow(img)
# plt.axis('off')
# plt.show()

history = model.fit(
    {"input_1": Rev1_train_data, "input_2": Rev2_train_data},  # 导入训练集input_1,input_2
    {"output": train_label},  # 导入训练集标签（这里的数据和标签分别对应之前模型定义时赋予各数据的标签）
    epochs=400,  # 迭代次数设置为2000
    batch_size=32,  # 每次送入32个数据进行训练（如果少于32则会直接带入当前全部）
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
np.save("loc_Rev1_test_data", Rev1_test_data)
np.save("loc_Rev2_test_data", Rev2_test_data)
np.save("loc_test_label", test_label)
