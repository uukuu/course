## 记录大学课程和一些资料

<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>

<div style="width: 100%; height: 600px;">
<canvas id="pdf-canvas" style="border: 1px solid;"></canvas>
</div>

<script>
var url = 'https://github.com/uukuu/course/blob/master/整理.pdf';

// 使用pdf.js渲染和显示PDF
pdfjsLib.getDocument(url).promise.then(function(pdfDoc) {
 var canvas = document.getElementById('pdf-canvas');
 var context = canvas.getContext('2d');

 // 获取PDF的第一页
 pdfDoc.getPage(1).then(function(page) {
   var viewport = page.getViewport({scale: 1});
   canvas.height = viewport.height;
   canvas.width = viewport.width;

   // 渲染PDF页面到canvas
   page.render({canvasContext: context, viewport: viewport});
 });
});
</script>
