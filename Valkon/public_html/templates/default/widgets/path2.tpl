{$i=0}
<div>
    <a href="/">Главная</a> \
    {foreach $navi_cats as $item}
        {$i++}
        {if $i < count($navi_cats)}
            <a href="{site_url($item.path_url)}">{$item.name}</a> \
        {else:}
            <span>{$item.name}</span>
        {/if}
    {/foreach}
</div>
