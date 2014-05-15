<h3 style="margin-top: -11px;">Наши работы</h3>
<div id="titleExt"><h5><a href="<?php echo site_url ('gallery'); ?>"><?php echo lang ('Gallery', 'gallery'); ?></a> &gt;&gt; <span class="ext"><?php echo $album['name']; ?></span></h5></div>
<ul class="products thumbs">
    <?php $counter = 1?>
    <?php if(is_true_array($album['images'])){ foreach ($album['images'] as $image){ ?>
        <li <?php if($counter == 4): ?> class="last" <?php $counter = 0?><?php endif; ?>>
            <a href="<?php echo site_url ($album_link . 'image/'.  $image['id'] ); ?>" title="<?php echo strip_tags ( $image['description'] ); ?>" class="image"><img src="<?php echo media_url ($thumb_url .  $image['full_name'] ); ?>" alt="<?php echo strip_tags ( $image['description'] ); ?>" />
                </a>
                <p><?php echo  $image['description']  ?></p>
        </li>
        <?php $counter++?>
    <?php }} ?>

    
</ul>


<div class="gallery-pagination"><?php echo $pagination?></div>
<?php $mabilis_ttl=1397799957; $mabilis_last_modified=1390307731; //application/modules/gallery/assets/thumbnails.tpl ?>