
原项目为单账户，其他形式多账户的pages代码，以及相关操作拓展教程，请关注：[博客视频教程](https://ygkkk.blogspot.com/2022/05/heroku-cloudflare-workers-pages.html)

Gitlab也支持Cloudflare Pages在线直接上传（建议私有化）

修改`_worker.js`中的`url.hostname="example.com"`中的`example.com`为你要反代的网址

-------------------------------------------------------------------------------------------------------------------

下图为Gitlab如何下载代码文件

![c14a9fd3dfe0361393dcc7cd693cc36](https://user-images.githubusercontent.com/107276912/173172932-142f6c9a-7f7f-424b-a178-aa43772a7511.png)

然后上传至Github的操作

修改`_worker.js`中的`url.hostname="example.com"`中的`example.com`为你要反代的网址

可直接下载项目的js文件并自己创建私有项目。跳过第一步！

![ce078c09077094baa84ada792bbe8f9](https://user-images.githubusercontent.com/90416692/170857036-420878c8-2215-4f31-8039-5e21de900992.png)

![27cd7e367656e1346541d91f87ee10e](https://user-images.githubusercontent.com/90416692/170857041-8cc326f6-36a8-4e54-9669-8a410d2d684c.png)

![6e0a1d439ddca7da2b87907f94e2dc9](https://user-images.githubusercontent.com/90416692/170857045-de8467a0-085e-43d8-b29b-62a1fe2e6610.png)

![de4d778f6afa9a7e42d4f288c8b76f1](https://user-images.githubusercontent.com/90416692/170857046-8bcc0394-c63e-4149-aa53-d9ffd6d3601a.png)

![c7fd66d80b5ff497bc3494c2908f29b](https://user-images.githubusercontent.com/90416692/170857049-eda83d96-27d7-4ebf-95b7-8e2ea726e2ec.png)
