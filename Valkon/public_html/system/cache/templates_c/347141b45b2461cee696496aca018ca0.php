<?php $Comments = $CI->load->module('comments')->init($page)?>
<div id="titleExt">
    <h5><?php echo widget ('path'); ?><span class="ext"><?php echo $page['title']; ?></span></h5>
</div>

<div id="detail">
    <?php echo $page['full_text']; ?>
</div>

<script type="text/javascript">
        $(function() {
            renderPosts($('#for_comments'));
        })
    
</script>

<div id="comment">
    <div id="for_comments" name="for_comments"></div>
</div>
<?php $mabilis_ttl=1397799685; $mabilis_last_modified=1387798996; ///home/v/valkonspru/public_html/templates/default/page_full.tpl ?>