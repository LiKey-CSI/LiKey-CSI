# -*- coding: utf-8 -*-
# @Author  : FuXianxin
# @Time    : 2023/7/27 20:17
# @File    : plot_result.py.py
# @Software: PyCharm

import pickle
import matplotlib.pyplot as plt
import tensorflow as tf
from keras.models import model_from_json
import numpy as np
import scipy.io as scio
from sklearn.metrics import confusion_matrix, classification_report, ConfusionMatrixDisplay

# ----------------------------------------------------------------------------------
# 导入之前网络训练迭代的结果，绘制loss和acc随迭代次数变化的曲线
# ----------------------------------------------------------------------------------


with open('trainHistoryDict_fixed.txt', 'rb') as file_pi:
    history = pickle.load(file_pi)

epochs = range(len(history['loss']))
plt.figure()
plt.plot(epochs, history['accuracy'], 'b', label='Training acc')
plt.plot(epochs, history['val_accuracy'], 'r', label='Validation acc')
plt.title('Training and Validation accuracy')
plt.legend()
plt.show()

plt.figure()
plt.plot(epochs, history['loss'], 'b', label='Training loss')
plt.plot(epochs, history['val_loss'], 'r', label='Validation val_loss')
plt.title('Training and Validation loss')
plt.legend()
plt.show()

# ----------------------------------------------------------------------------------
# 加载之前训练的模型，和之前划分的测试数据集
# ----------------------------------------------------------------------------------

# 加载模型用做预测
json_file = open(r"./model_fixed.json", "r")
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json)
loaded_model.load_weights("model_fixed.h5")
print("loaded model from disk")
optimizer = tf.keras.optimizers.Adam(learning_rate=0.01)  # 定义学习率
loaded_model.compile(loss='categorical_crossentropy', optimizer=optimizer, metrics=['accuracy'])

Rev1_test_data = np.load("Rev1_test_data_fixed.npy")
Rev2_test_data = np.load("Rev2_test_data_fixed.npy")
test_label = np.load("test_label_fixed.npy")

# ----------------------------------------------------------------------------------
# 计算最后测试集的分类精度并绘制混淆矩阵
# ----------------------------------------------------------------------------------

# 分类准确率
print("The accuracy of the classification model:")
scores = loaded_model.evaluate([Rev1_test_data, Rev2_test_data], test_label, verbose=0)
print('%s: %.2f%%' % (loaded_model.metrics_names[1], scores[1] * 100))

# 输出预测类别
predicted = loaded_model.predict([Rev1_test_data, Rev2_test_data])
predicted_label = np.argmax(predicted, axis=1)
actual_label = np.argmax(test_label, axis=1)
print("predicted label:\n " + str(predicted_label))
print("actually label:\n " + str(actual_label))

# 图像化展示结果
plt.figure(figsize=(10, 6))
plt.plot(range(1, len(actual_label)+1), predicted_label, 'o:', label='Predict', color='red')
plt.plot(range(1, len(actual_label)+1), actual_label, label='Actual', color='blue')
plt.xlabel('Test sample number')
plt.ylabel('label')
plt.title('The classification results —— Accuracy:%.2f%%' % (scores[1] * 100))
plt.legend()
plt.show()

print(u'算法评价')
print(classification_report(actual_label, predicted_label))
# 得到混淆矩阵并绘制
cm = confusion_matrix(actual_label, predicted_label, normalize='true')
print("Confusion Matrix: ")
print(cm)
show_labels = range(1, 10)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=show_labels)
disp.plot(cmap='Blues')
plt.savefig("cm-loc1.png", dpi=600, format="png", bbox_inches='tight')
plt.show()


