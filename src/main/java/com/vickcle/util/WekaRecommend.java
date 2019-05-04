package com.vickcle.util;

import com.vickcle.model.GradeCreer;
import weka.clusterers.ClusterEvaluation;
import weka.clusterers.SimpleKMeans;
import weka.core.DistanceFunction;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class WekaRecommend {
    public static List<Integer> recommendCreertoStudent(List<GradeCreer> list,int creer_num){
        Instances ins = null;
        SimpleKMeans KM = null;
        DistanceFunction disFun = null;

        try {
            // 读入样本数据
            File file = new File("D:\\Library\\weka\\creer.txt");
            ArffLoader loader = new ArffLoader();
            loader.setFile(file);
            ins = loader.getDataSet();
            // 初始化聚类器 （加载算法）
            KM = new SimpleKMeans();
            KM.setNumClusters(creer_num); // 设置聚类要得到的类别数量
            KM.buildClusterer(ins); // 开始进行聚类
            System.out.println(KM.preserveInstancesOrderTipText());
            // 打印聚类结果
            //开始传入要聚类的数据：
            Instance instance = new Instance(list.size());
            for(int i = 0;i<list.size();i++){
                instance.setValue(i,list.get(i).getGrade_total());
            }
            System.out.println(KM.clusterInstance(instance));
            //如预期的一样，这里已经可以得到本数值可以得到的簇。要返回样本簇中的所有对象，由于数据是按照顺序写入的，也很容易知道其student_id;
            //这里必然要从头到尾读一次文件，取出文件中那些簇为所在簇的行级数据
            //可能需要读文件，但Weka已经做好了读文件的操作：
            ClusterEvaluation eval = new ClusterEvaluation();
            eval.setClusterer(KM);
            eval.evaluateClusterer(ins);
            double[] cnum = eval.getClusterAssignments();
            //按照样本顺序输出每行数据锁属于的簇，所以这里做一下整理就能知道哪些属于同一个簇了。
            List<Integer> value = new ArrayList<>();
            int tempValue = KM.clusterInstance(instance);
            for(int i = 0;i<cnum.length;i++){
                int temp = (int)cnum[i];
                //为测试方便，此时将结果弹出来
                System.out.println(temp);
                if(tempValue == temp){
                    value.add(i);
                }
            }
            return value;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
