<{$toolbar}>
<{if $level_css}>
  <style>
    <{$level_css}>
  </style>
<{/if}>
<!--列出所有資料-->
<{if $all_content}>
  <{if $isAdmin}>
    <script type="text/javascript">
    function delete_tad_evaluation_func(evaluation_sn){
      var sure = window.confirm("<{$smarty.const._TAD_DEL_CONFIRM}>");
      if (!sure)  return;
      location.href="<{$action}>?op=delete_tad_evaluation&evaluation_sn=" + evaluation_sn;
    }
    </script>
  <{/if}>

  <{foreach from=$all_content item=data}>
    <div class="row">
      <div class="well">
        <h2><a href='index.php?evaluation_sn=<{$data.evaluation_sn}>'><{$data.evaluation_title}></a></h2>
        <div style="font-size:12px;color:gray;text-align:right;">
          <{$data.evaluation_date}>
          <i class="icon-folder-open"></i> <{$data.evaluation_cates}>
          <i class="icon-file"></i> <{$data.evaluation_files}>
        </div>
      </div>

    </div>
  <{/foreach}>

  <{if $isAdmin}>
  <div style="text-align:right;">
    <a href="admin/main.php?op=tad_evaluation_form" class="btn btn-info"><{$smarty.const._TAD_ADD}></a>
  </div>
  <{/if}>

<{elseif $now_op=="list_tad_evaluation"}>
  <div class="jumbotron">
    <{if $isAdmin}>
      <a href="admin/main.php?op=tad_evaluation_form" class="btn btn-info"><{$smarty.const._TAD_ADD}></a>
    <{/if}>
  </div>
<{/if}>


<!--顯示某一筆資料-->
<{if $now_op=="show_one_tad_evaluation"}>
  <link rel="stylesheet" href="<{$xoops_url}>/modules/tadtools/css/iconize.css" type="text/css" media="all" />
  <{$fancybox_code}>

  <h1><{$evaluation_title}></h1>
  <div class="well">
    <a href="#" onclick="jQuery('#treetbl<{$evaluation_sn}>').treetable('expandAll'); return false;" onkeypress="jQuery('#treetbl<{$evaluation_sn}>').treetable('expandAll'); return false;" class="btn btn-default btn-xs"><{$smarty.const._MD_TADEVALUA_EXPAND_ALL}></a>
    <a href="#" onclick="jQuery('#treetbl<{$evaluation_sn}>').treetable('collapseAll'); return false;" onkeypress="jQuery('#treetbl<{$evaluation_sn}>').treetable('collapseAll'); return false;" class="btn btn-default btn-xs"><{$smarty.const._MD_TADEVALUA_COLLAPSE_ALL}></a>
    <div class="row">

      <{if $db_files}>
        <div class="col-sm-12">
          <{$db_files}>
        </div>
      <{else}>
        <div class="jumbotron">
          <{$smarty.const._MD_TADEVALUA_EVALUATION_EMPTY}>
        </div>
      <{/if}>
    </div>
  </div>


  <{if $isAdmin}>
  <div class="row text-right">
    <a href="admin/main.php?evaluation_sn=<{$evaluation_sn}>" class="btn btn-warning"><{$smarty.const._TAD_EDIT}></a>
  </div>
  <{/if}>
<{/if}>
