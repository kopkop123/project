<div id="titleExt"><h5><?php echo widget ('path'); ?><span class="ext"><?php echo $category['name']; ?></span></h5></div>
<?php echo $category['short_desc']; ?>
<?php if($no_pages): ?>
        <p><?php if(isset($no_pages)){ echo $no_pages; } ?></p>
<?php endif; ?>
<ul>
<?php if(is_true_array($pages)){ foreach ($pages as $page){ ?>
	<li><a href="<?php echo site_url ( $page['full_url'] ); ?>"><?php echo $page['title']; ?></a></li>
<?php }} ?>
</ul>
<div class="pagination" align="center">
    <?php if(isset($pagination)){ echo $pagination; } ?>
</div>
<?php $mabilis_ttl=1397799553; $mabilis_last_modified=1387798992; ///home/v/valkonspru/public_html/templates/default/category.tpl ?>