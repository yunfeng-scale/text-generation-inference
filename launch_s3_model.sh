base_name=$(basename $1)
echo "Loading $base_name"

./s5cmd cp $1 .
mkdir -p model_files
tar -xf $base_name -C model_files
rm $base_name

text-generation-launcher --model-id ./model_files --num-shard $2 --port 5005 --hostname :: $3
