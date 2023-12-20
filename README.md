                                               Credit Card Fraud Detection - R Programming
This R project aims to build a classifier that can detect credit card fraudulent transactions. 
We will use a variety of machine learning algorithms that will be able to discern fraudulent from non-fraudulent ones. 
By the end of this machine learning project, you will learn how to implement machine learning algorithms to perform classification.
The dataset is loaded and explored using R, and summary statistics provide insights into its structure. The 'Amount' feature undergoes normalization to facilitate model training. Time information is removed from the dataset to focus on relevant features.

The project involves training logistic regression models using the glm function, and the results are analyzed and visualized. The ROC curve is employed to assess the model's performance, achieving approximately 90% accuracy.

Additionally, a decision tree model is implemented using the rpart package, offering an alternative approach to fraud detection. Visualization of the decision tree structure provides interpretability.

Furthermore, a small neural network (NN) is constructed using the neuralnet package, showcasing the application of deep learning techniques in fraud detection. The neural network is trained and visualized to understand its architecture.

In summary, this project employs diverse machine learning methods, including logistic regression, decision trees, and neural networks, to detect credit card fraud effectively. The use of ROC curves and visualization tools enhances the interpretability of model outcomes, contributing to a comprehensive fraud detection system.
