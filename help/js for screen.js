// Скрипт для загрузки разных изображений, в зависимости от плотности пикселей и разрешения экрана

var about_page = $('.about'),
      location_page = $('.location'),
      main_page = $('.main'),
      pixel_ratio = (typeof window['devicePixelRatio'] !== 'undefined') ? window['devicePixelRatio'] : 1,
      schedule_page = $('.schedule'),
      screen = window.screen.width;
  if (pixel_ratio >= 2)
  {
    if ((screen >= 640) && (screen < 1024))
    {
      about_page.addClass('about-1024').css('background-image','url(/rs/img/yf-about-header-1024.jpg)');
      main_page.addClass('main-1024').css('background-image','url(/rs/img/yf-main-header-1024.jpg)');
    }
    else if (screen < 640)
    {
      about_page.addClass('about-640').css('background-image','url(/rs/img/yf-about-header-640.jpg)');
      location_page.addClass('location-640').css('background-image','url(/rs/img/yf-location-header-640.jpg)');
      main_page.addClass('main-640').css('background-image','url(/rs/img/yf-main-header-640.jpg)');
      schedule_page.addClass('schedule-640').css('background-image','url(/rs/img/yf-schedule-header-640.jpg)');
    }
  }
  else
  {
    if (screen <= 640)
    {
      about_page.addClass('about-640').css('background-image','url(/rs/img/yf-about-header-640.jpg)');
      location_page.addClass('location-640').css('background-image','url(/rs/img/yf-location-header-640.jpg)');
      main_page.addClass('main-640').css('background-image','url(/rs/img/yf-main-header-640.jpg)');
      schedule_page.addClass('schedule-640').css('background-image','url(/rs/img/yf-schedule-header-640.jpg)');
    }
    else if ((screen > 640) && (screen <= 1024))
    {
      about_page.addClass('about-1024').css('background-image','url(/rs/img/yf-about-header-1024.jpg)');
      main_page.addClass('main-1024').css('background-image','url(/rs/img/yf-main-header-1024.jpg)');
    }
  }