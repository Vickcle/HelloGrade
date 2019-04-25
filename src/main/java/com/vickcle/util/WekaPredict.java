package com.vickcle.util;

import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Attribute;
import weka.core.FastVector;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class WekaPredict {
    public static Map<String,String> useWekaPredict(double current){
        Map map = new  HashMap<String,String>();
        File inputFile = new File("D:\\out.txt");// 该文为从List导出的信息生成的文件
        ArffLoader atf = new ArffLoader();
        try {
            atf.setFile(inputFile);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        Instances instancesTrain = null;
        try {
            instancesTrain = atf.getDataSet();
        } catch (IOException e) {
            e.printStackTrace();
        }
        instancesTrain.setClassIndex(1);// 设置训练数据集的类属性，即对哪个数据列进行预测（属性的下标从0开始）

        // 读入测试集数据
        FastVector attrs = new FastVector();

        Attribute ratio = new Attribute("CUR", 1);// 创建属性，参数为属性名称和属性号，但属性号并不影响FastVector中属性的顺序
        Attribute preratio = new Attribute("PRE", 2);

        attrs.addElement(ratio);// 向FastVector中添加属性，属性在FastVector中的顺序由添加的先后顺序确定。
        attrs.addElement(preratio);

        Instances instancesTest = new Instances("bp", attrs, attrs.size());// 创建实例集，即数据集，参数为名称，FastVector类型的属性集，以及属性集的大小（即数据集的列数）

        instancesTest.setClass(preratio);// 设置数据集的类属性，即对哪个数据列进行预测

        Instance ins = new Instance(attrs.size());// 创建实例，即一条数据
        ins.setDataset(instancesTest);// 设置该条数据对应的数据集，和数据集的属性进行对应
        ins.setValue(ratio, current);// 设置数据每个属性的值
        // ins.setValue(preratio, 90);
        instancesTest.add(ins);// 将该条数据添加到数据集中
        MultilayerPerceptron m_classifier = new MultilayerPerceptron();// 创建算法实例，要使用其他的算法，只用把类换做相应的即可
        // Classifier m_classifier = new J48();
        try {
            m_classifier.buildClassifier(instancesTrain); // 进行训练
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 测试分类结果
        // instancesTest.instance(i)获得的是用模型预测的结果值，instancesTest.instance(i).classValue()获得的是测试集类属性的值
        // 此处是把预测值和实际值同时输出，进行对比
        try {
//            System.out.println(m_classifier.classifyInstance(instancesTest.instance(0)) + "----"
//                    + instancesTest.instance(0).classValue());
            map.put("predict",m_classifier.classifyInstance(instancesTest.instance(0))+"");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
