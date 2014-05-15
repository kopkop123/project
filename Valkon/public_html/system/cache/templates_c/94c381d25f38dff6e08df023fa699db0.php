<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title><?php echo lang ('Operation panel',"admin"); ?> - Image CMS</title>
        <meta name="description" content="<?php echo lang ('Operation panel',"admin"); ?> - Image CMS" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/style.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/bootstrap-responsive.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/bootstrap-notify.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/jquery/custom-theme/jquery-ui-1.8.23.custom.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/jquery/custom-theme/jquery-ui-1.8.16.custom.css"/>
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/jquery/custom-theme/jquery.ui.1.8.16.ie.css"/>
    </head>
    <body>

        <?php $ci = get_instance();?>
        <?php if($ci->config->item('is_installed') === TRUE AND file_exists(APPPATH.'modules/install/install.php')): ?>
            <?php echo chmod (APPPATH.'modules/install/install.php', 0777); ?>
            <?php if(!rename(APPPATH.'modules/install/install.php', APPPATH.'modules/install/_install.php')): ?>
                <?php echo die ('<span style="font-size:18px;"><br/><br/>'.lang("Delete the file to continue","admin").'/application/modules/install/install.php</div>'); ?>
            <?php endif; ?>
        <?php endif; ?>

        <div class="main_body">
            <div class="form_login t-a_c">
                <a href="/admin/dashboard" class="d-i_b">
                    <img src="<?php if(isset($THEME)){ echo $THEME; } ?>img/logo.png"/>
                </a><br/>
                <form method="post" action="<?php if(isset($BASE_URL)){ echo $BASE_URL; } ?>admin/login/" class="standart_form t-a_l" id="with_out_article">
                    <?php if($login_failed): ?>
                        <label>
                            <?php echo lang ('Users with such Email not found','admin'); ?>
                        </label>
                        <?php if(isset($login_failed)){ echo $login_failed; } ?>
                    <?php endif; ?>
                    <label>
                        <input type="text" name="login" placeholder="<?php echo lang ("E-mail", "admin"); ?>"/><?php if(isset($login_error)){ echo $login_error; } ?>
                        <span class="icon-user"></span>
                    </label>
                    <label>
                        <input type="password" name="password" placeholder="<?php echo lang ("Password", "admin"); ?>"/><?php if(isset($password_error)){ echo $password_error; } ?>
                        <span class="icon-lock"></span>
                    </label>
                    <?php if($use_captcha == "1"): ?>

                        <label style="margin-bottom:50px">
                            <?php echo lang ('Security code', 'admin'); ?>:<br/>
                            <div id="captcha"><?php if(isset($cap_image)){ echo $cap_image; } ?></div>
                            <a href="" onclick="ajax_div('captcha', '<?php if(isset($BASE_URL)){ echo $BASE_URL; } ?>/admin/login/update_captcha');
                                    return false;"><?php echo lang ('Update the code',"admin"); ?></a>
                            <input type="text" name="captcha" /><?php if(isset($captcha_error)){ echo $captcha_error; } ?>
                        </label>
                    <?php endif; ?>
                    <div class="o_h">
                        <div class="pull-left frame_label">
                            <span class="frame_label">
                                <span class="niceCheck">
                                    <input type="checkbox" name="remember" value="1"/>
                                </span>
                                <?php echo lang ('Remember',"admin"); ?>
                            </span>
                        </div>
                        <a href="<?php if(isset($BASE_URL)){ echo $BASE_URL; } ?>admin/login/forgot_password/" class="pull-right"><?php echo lang ('Forgot your password?',"admin"); ?></a>
                    </div>
                    <input type="submit" value="<?php echo lang ('Log in',"admin"); ?>" class="btn btn-info" style="margin-top: 26px;"/>
                    <?php echo form_csrf (); ?>
                </form>
            </div>
        </div>
        <script src="<?php if(isset($THEME)){ echo $THEME; } ?>js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="<?php if(isset($THEME)){ echo $THEME; } ?>js/scripts.js" type="text/javascript"></script>
    </body>
</html><?php $mabilis_ttl=1397800113; $mabilis_last_modified=1387798958; ///home/v/valkonspru/public_html/templates/administrator/login_page.tpl ?>