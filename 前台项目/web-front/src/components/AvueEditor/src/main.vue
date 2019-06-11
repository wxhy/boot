<template>
  <div class="avue-ueditor">
    <div id="editorElem" style="margin-bottom: 15px;min-width: 650px;"></div>
    <el-button size="small" icon="el-icon-edit-outline" @click="handleHtml">编辑HTML代码</el-button>
    <el-button size="small" icon="el-icon-view" @click="handlePrew">全屏预览</el-button>
    <el-button size="small" icon="el-icon-delete" @click="handleClear">清空</el-button>

    <el-dialog title="预览" fullscreen append-to-body :visible.sync="prewVisible">
      <div v-html="text"></div>
    </el-dialog>

    <el-dialog append-to-body title="编辑HTML代码" :visible.sync="editorVisible">
      <el-input type="textarea" :rows="20" v-model="text"></el-input>

      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleSubmit">确定保存</el-button>
      </span>
    </el-dialog>
  </div>
</template>



<script>
import E from "wangeditor";
import filterXSS from 'xss';
export default {
  name: "AvueEditor",
  data() {
    return {
      editor: null,
      prewVisible: false,
      text: undefined,
      editorVisible: false
    };
  },
  props: {
    value: {
      type: String,
      default: ""
    }
  },
  mounted() {
    this.init();
  },
  watch: {
    isClear(val) {
      //触发清除文本域内容
      if (val) {
        this.editor.txt.clear();
        this.text = null;
      }
    },
    value(val) {
      //使用v-model设置初始值
      this.editor.txt.html(val);
    }
  },
  methods: {
    init() {
      this.editor = new E("#editorElem");
      //禁止粘贴图片
      this.editor.customConfig.pasteIgnoreImg = false;
      this.editor.customConfig.zIndex = 100
      this.editor.customConfig.onchange = html => {
        // html 即变化之后的内容
        this.text = filterXSS(html) ;
        this.$emit("change", this.text);
      };
      this.editor.create();

      this.text = this.value;
      this.editor.txt.html(this.value);
    },
    handlePrew() {
      this.prewVisible = true;
    },
    handleClear() {
      this.editor.txt.clear();
    },
    handleHtml() {
      this.editorVisible = true;
    },
    handleSubmit(){
      this.editorVisible = false;
      this.editor.txt.html(this.text)
    }
  }
};
</script>


