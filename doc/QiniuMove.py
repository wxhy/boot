# -*- coding:utf-8 -*- 

from qiniu import Auth
from qiniu import BucketManager,build_batch_move


accessKey = "3QwcYlLnnsmKAb_y2thYWhMthLnLJE4BhgEg5CMP"
secretKey = "VbTcSVpXEyGkUCo2WEdVnzT3mnqWn0gtnXde9sBU"
bucket = "otcars"
new = "evcar"


def main():
	items = []
	keys = dict()
	q = Auth(accessKey, secretKey)
	bucketManager = BucketManager(q)
	data = bucketManager.list(bucket)
	if data[0].get("items"):
		items = data[0].get("items")
	for value in items:
		keys[value.get("key")] = value.get("key")
	# force为true时强制同名覆盖, 字典的键为原文件，值为目标文件
	ops = build_batch_move(bucket, keys, new, force='true')
	ret, info = bucketManager.batch(ops)
	print(ret)
	print(info)
	pass




if __name__  == "__main__":
	main()