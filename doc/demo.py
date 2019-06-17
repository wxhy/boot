# -*- coding:utf-8 -*- 

from qiniu import Auth
from qiniu import BucketManager,build_batch_move


accessKey = "3QwcYlLnnsmKAb_y2thYWhMthLnLJE4BhgEg5CMP"
secretKey = "VbTcSVpXEyGkUCo2WEdVnzT3mnqWn0gtnXde9sBU"
bucket = "otcars"
new = "evcar"


def main():
	items = []
	keys = []
	q = Auth(accessKey, secretKey)
	bucketManager = BucketManager(q)
	data = bucketManager.list(bucket)
	if data[0].get("items"):
		items = data[0].get("items")
	for value in items:
		keys.append(value.get("key"))
# force为true时强制同名覆盖, 字典的键为原文件，值为目标文件
ops = build_batch_move(src_bucket_name, {'src_key1': 'target_key1', 'src_key2': 'target_key2'}, target_bucket_name, force='true')
	build_batch_move(bucket,)
	pass




if __name__  == "__main__":
	main()