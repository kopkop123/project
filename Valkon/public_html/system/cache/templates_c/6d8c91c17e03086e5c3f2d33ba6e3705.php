<?php $i=0?> 
   <?php if(is_true_array($navi_cats)){ foreach ($navi_cats as $item){ ?> <?php $i++?>    
   <?php if($i < count($navi_cats)): ?>
        <a href="<?php echo site_url ( $item['path_url'] ); ?>"><?php echo $item['name']; ?></a> &gt;&gt; 
   <?php endif; ?>
   <?php }} ?>

<?php $mabilis_ttl=1397799553; $mabilis_last_modified=1387799149; ///home/v/valkonspru/public_html/templates/default/widgets/path.tpl ?>