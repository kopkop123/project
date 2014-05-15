<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Image CMS
 */

class Feedback_Widgets extends MY_Controller {

   	public function __construct()
	{
		parent::__construct();
    } 

    public function show_feedback($widget = array())
    {
        if ( $widget['settings'] == FALSE)
        {
            $settings = $this->defaults;
        }else{
            $settings = $widget['settings'];
        }

        $this->load->module('feedback');
        $this->feedback->index2();
        //shuffle( $this->tags->tags );

        return '';
    }
    
    public function show_feedback2($widget = array())
    {
        if ( $widget['settings'] == FALSE)
        {
            $settings = $this->defaults;
        }else{
            $settings = $widget['settings'];
        }

        $this->load->module('feedback');
        $this->feedback->index3();
        //shuffle( $this->tags->tags );

        return '';
    }

    // Configure form
    public function tags_cloud_configure($action = 'show_settings', $widget_data = array())
    {
        if( $this->dx_auth->is_admin() == FALSE) exit;

        switch ($action)
        {
            case 'show_settings':

            break;

            case 'update_settings':

            break;

            case 'install_defaults':
                     
            break;
        }
    }

}
