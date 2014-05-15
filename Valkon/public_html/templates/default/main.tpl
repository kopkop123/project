<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        {$page_type = $CI->core->core_data['data_type'];}
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>{$site_title}</title>
        
        <meta name="description" content="{$site_description}" />
        <meta name="keywords" content="{$site_keywords}" />
        
        <meta name='yandex-verification' content='5edadbc4dfcadf95' />
        <!--<link href='http://fonts.googleapis.com/css?family=Didact+Gothic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css' />-->
        <link rel="stylesheet" type="text/css" href="{$THEME}css/general.css" />
        <link rel="stylesheet" type="text/css" href="{$THEME}css/slideshow.css" />
        
        
        <script type="text/javascript" src="{$THEME}js/jquery.js"></script>
        <script type="text/javascript" src="{$THEME}js/jquery.hoverIntent.js"></script>
        <script type="text/javascript" src="{$THEME}js/jquery.cycle.js"></script>

        <script type="text/javascript" src="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
        <link rel="stylesheet" type="text/css" href="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" />


        <script type="text/javascript" src="{$THEME}js/jquery.functions.js"></script>
        <script type="text/javascript" src="{$THEME}js/cufon.js"></script>
        <script type="text/javascript" src="{$THEME}js/js.js"></script>

        <link rel="icon" href="{$THEME}images/favicon.png" type="image/x-icon" />
        
        
{literal}
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-47854097-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    <script type="text/javascript">
  WebFontConfig = {
    google: { families: [ 'Didact+Gothic::latin,cyrillic' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); </script>
{/literal}

    

    </head>
    <body>
        
        <div class="wrap">
            <div class="header">
                <div class="top-icons">
                    <a href="#"></a>
                    <a href="#"></a>
                    <a href="#"></a>
                </div>
                <div class="logo"><a href="{site_url('')}"><img src="{$THEME}images/logo.png" alt="logo" border="0"/></a></div>
                <div class="phones">{widget('phones')}</div>
            </div>
            <div class="clr"></div>
            <div class="slider-wrap">
                <div id="slideshow">
                    <div id="slidenext"></div>
                        <div id="slideprev"></div>
                        <ul id="slides">
                            <li><a href="#"><img src="{$THEME}images/slide1.jpg" alt="" width="940" height="330" /></a></li>
                            <li><a href="#"><img src="{$THEME}images/slides/slide2.jpg" alt=""  width="940" /></a></li>
                            <li><a href="#"><img src="{$THEME}images/slides/slide3.jpg" alt=""  width="940" /></a></li>
                            <li><a href="#"><img src="{$THEME}images/slides/slide6.jpg" alt=""  width="940" /></a></li>
                            <li><a href="#"><img src="{$THEME}images/slides/slide7.jpg" alt=""  width="940" /></a></li>
                        </ul>
                        
                        <div id="slideshow_violator" class="clearfix">
                            <div id="slide_navigation" class="clearfix"></div>
                        </div>
                    </div>
            </div>
                        
            <div class="mainmenu-wrap"><div class="mainmenu-wrap2"><div class="mainmenu-wrap3">
                {load_menu('mainmenu')}
                <div id="search">
                    <form action="{site_url('search')}" method="POST">
                        <input type="submit" class="submit" value=""/>
                        <input type="text" class="text" name="text" value="Поиск" onfocus="if (this.value == 'Поиск')
            this.value = '';" onblur="if (this.value == '')
            this.value = 'Поиск';"/>
                        {form_csrf()}
                    </form>
                </div>
            </div></div></div>
            <div class="content-wrap">
                {if $page.id != 1}
                    
                    <div class="left-title">{widget('z-raboty')}Аренда спецтехники</div>
                    <div class="breadcrumbs">
                        {if $CI->uri->segment('1')=='feedback'}
                            <a href="/">Главная</a> / <span>Заявка</span>
                        {/if}
                        {if $CI->uri->segment('1')=='gallery'}
                            <a href="/">Главная</a> / <span>Наши работы</span>
                        {/if}
                        {widget('path2')}
                        
                    </div>
                    <div class="clr"></div>
                    
                {/if}
                {if $page.id != 1}
                    <div class="left-col">{load_menu('menu-spectehika')}</div>
                    <div class="content-wrap2">
                        {if $page.id == 16}
                        {widget('zayavka1')}
                        {/if}
                        {if $page.id == 17}
                        {widget('zayavka2')}
                        {/if}
                        {$content}
                    </div>
                {else:}{$content}{/if}
                <div class="clr"></div>
            </div>
            <div class="clr"></div>
            <div class="footer-wrap"><div class="footer-wrap2"><div class="footer-wrap3">
                <div class="footer-menu">{load_menu('mainmenu')}</div>
                <div class="footer-information1">
                    {widget('footer-information1')}</div>
                    {literal}
<!-- Yandex.Metrika informer -->
<a href="http://metrika.yandex.ru/stat/?id=23504056&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/23504056/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0;float:left;padding-top:3px;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:23504056,lang:'ru'});return false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter23504056 = new Ya.Metrika({id:23504056,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/23504056" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
                    {/literal}
                
                <div class="footer-information2">{widget('footer-information2')}</div>
            </div></div></div>
        </div>
    </body>
</html>