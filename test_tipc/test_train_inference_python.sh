rm -rf test_tipc/data  
mkdir test_tipc/data  
wget -P test_tipc/data https://paddleseg.bj.bcebos.com/humanseg/data/mini_supervisely.zip  
cd test_tipc/data && unzip -oq mini_supervisely.zip && cd ../../   
python train.py --config test_tipc/encnet_humanseg_192x192_mini_supervisely.yml --do_eval --use_vdl --log_iter 10  --save_dir output
python predict.py --config test_tipc/encnet_humanseg_192x192_mini_supervisely.yml --model_path output/best_model/model.pdparams --image_path test_tipc/data/mini_supervisely/Images --save_dir output/result