# ENCNet_paddle


## 1 简介
![images](images/network.png)  
本项目基于paddlepaddle框架复现了ENCNet语义分割模型，ENCNet提取出特征图中的类别信息，同时引出注意力机制损失(se_loss)来提升网络性能。

**论文：**
- [1] Hang Zhang, Kristin Dana, Jianping Shi, Zhongyue Zhang, Xiaogang Wang, Ambrish Tyagi, Amit Agrawal. [Context Encoding for Semantic Segmentation](https://paperswithcode.com/paper/context-encoding-for-semantic-segmentation)

**项目参考：**
- [https://github.com/open-mmlab/mmsegmentation/tree/master/configs/encnet](https://github.com/open-mmlab/mmsegmentation/tree/master/configs/encnet)

## 2 复现精度
>在CityScapes val数据集的测试效果如下表。


|NetWork |steps|opt|image_size|batch_size|dataset|memory|card|mIou|config|weight|log|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|DMNet|80K|SGD|1024x512|8|CityScapes|32G|4|78.70|[encnet_cityscapes_1024x512_80k.yml](configs/encnet/encnet_cityscapes_1024x512_80k.yml)|[link](https://bj.bcebos.com/v1/ai-studio-cluster-infinite-task/outputs/105022.tar?authorization=bce-auth-v1%2F0ef6765c1e494918bc0d4c3ca3e5c6d1%2F2021-11-24T10%3A37%3A31Z%2F-1%2F%2F1d0504cbdf4fac38dc60c1298e9b632e739d1a2f952485056a8f50ff45f3344b)|[log](log/trainer-0.log)|

## 3 数据集
[CityScapes dataset](https://www.cityscapes-dataset.com/)

- 数据集大小:
    - 训练集: 2975
    - 验证集: 500

## 4 环境依赖
- 硬件: Tesla V100 * 4

- 框架:
    - PaddlePaddle == 2.2.0
  
    
## 快速开始

### 第一步：克隆本项目
```bash
# clone this repo
git clone https://github.com/justld/ENCNet_paddle.git
cd ENCNet_paddle
```

**安装第三方库**
```bash
pip install -r requirements.txt
```


### 第二步：训练模型
单卡训练：
```bash
python train.py --config configs/encnet_cityscapes_1024x512_80k.yml  --do_eval --use_vdl --log_iter 100 --save_interval 1000 --save_dir output
```
多卡训练：
```bash
python -m paddle.distributed.launch train.py --config configs/encnet_cityscapes_1024x512_80k.yml  --do_eval --use_vdl --log_iter 100 --save_interval 1000 --save_dir output
```

### 第三步：测试
output目录下包含已经训练好的模型参数以及对应的日志文件。
```bash
python val.py --config configs/encnet_cityscapes_1024x512_80k.yml --model_path 
```

### 第四步：tipc
在linux下，进入ENCNet_paddle文件夹，运行命令
```bash
bash test_train_inference_python.sh
```

## 5 代码结构与说明
**代码结构**
```
├─configs                          
├─images                         
├─output                           
├─paddleseg       
├─test_tipc                                            
│  export.py                     
│  predict.py                        
│  README.md                        
│  README_CN.md                     
│  requirements.txt                      
│  setup.py                   
│  train.py                
│  val.py                       
```
**说明**
1、本项目在Aistudio平台，使用Tesla V100 * 4 脚本任务训练80K miou达到78.70%。  
2、本项目基于PaddleSeg开发。  

## 6 模型信息

相关信息:

| 信息 | 描述 |
| --- | --- |
| 作者 | 郎督|
| 日期 | 2021年11月 |
| 框架版本 | PaddlePaddle==2.2.0 |
| 应用场景 | 语义分割 |
| 硬件支持 | GPU、CPU |
| 在线体验 | [notebook](https://aistudio.baidu.com/aistudio/projectdetail/3001104?contributionType=1), [Script](https://aistudio.baidu.com/aistudio/clusterprojectdetail/2998787)|


