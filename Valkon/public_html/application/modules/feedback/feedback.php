<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Image CMS
 *
 * Feedback module
 */
class Feedback extends MY_Controller {

    public $username_max_len = 30;
    public $message_max_len = 600;
    public $theme_max_len = 150;
    public $admin_mail = 'admin@localhost';
    public $message = '';
    protected $formErrors = array();

    public function __construct() {
        parent::__construct();
        $this->load->module('core');
        $this->load_settings();

        $this->formErrors = array(
            'required' => lang('Field is required'),
            'min_length' => lang('Length is less than the minimum'),
            'valid_email' => lang('Email is not valid'),
            'max_length' => lang('Length greater than the maximum')
        );

        $lang = new MY_Lang();
        $lang->load('feedback');
    }

    public function autoload() {
        
    }

    function captcha_check($code) {
        if (!$this->dx_auth->captcha_check($code))
            return FALSE;
        else
            return TRUE;
    }

    function recaptcha_check() {
        $result = $this->dx_auth->is_recaptcha_match();
        if (!$result) {
            $this->form_validation->set_message('recaptcha_check', lang("Improper protection code", 'feedback'));
        }

        return $result;
    }

    // Index function
    public function index() {
        $this->core->set_meta_tags(lang('Feedback', 'feedback'));

        $this->load->library('form_validation');

        // Create captcha
        $this->dx_auth->captcha();
        $tpl_data['cap_image'] = $this->dx_auth->get_captcha_image();

        $this->template->add_array($tpl_data);

        if (count($_POST) > 0) {
            $this->form_validation->set_rules('name', lang('Name', 'feedback'), 'trim|required|min_length[3]|max_length[' . $this->username_max_len . ']|xss_clean');
            $this->form_validation->set_rules('email', lang('E-Mail', 'feedback'), 'trim|required|valid_email|xss_clean');
            $this->form_validation->set_rules('theme', lang('Theme', 'feedback'), 'trim|required|max_length[' . $this->theme_max_len . ']|xss_clean');

            if ($this->dx_auth->use_recaptcha)
                $this->form_validation->set_rules('recaptcha_response_field', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|xss_clean|required|callback_recaptcha_check');
            else
                $this->form_validation->set_rules('captcha', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|required|xss_clean|callback_captcha_check');

            $this->form_validation->set_rules('message', lang('Message', 'feedback'), 'trim|required|max_length[' . $this->message_max_len . ']|xss_clean');

            if ($this->form_validation->run($this) == FALSE) { // there are errors
                $fields = array(
                    'theme' => lang('Theme', 'feedback'),
                    'name' => lang('Name', 'feedback'),
                    'email' => lang('E-mail', 'feedback'),
                    'message' => lang('Message', 'feedback'),
                );
                $errors = "";
                $this->form_validation->set_error_delimiters("", "");
                foreach ($fields as $field => $name) {
                    $error = $this->form_validation->error($field);
                    if (!empty($error)) {
                        $error_ = isset($this->formErrors[$error]) ? $this->formErrors[$error] : lang('Error', 'feedback');
                        $errors .= "<div style=\"color:red\">{$name} - {$error_}</div>";
                    }
                }
                $this->template->assign('form_errors', $errors);
            } else { // form is validate
                $this->message = strip_tags(nl2br(
                                lang('Theme', 'feedback') . ' : ' . $this->input->post('theme') .
                                lang('Name', 'feedback') . ' : ' . $this->input->post('name') .
                                lang('E-mail', 'feedback') . ' : ' . $this->input->post('email') .
                                lang('Message', 'feedback') . ' : ' . $this->input->post('message')
                ));
                $this->_send_message();
            }
        }

        $this->display_tpl('feedback');
    }
    
    
    
    public function index2() {
        //$this->core->set_meta_tags('Обратная Связь');

        $this->load->library('form_validation');
        
        // Create captcha
        $this->dx_auth->captcha();
        $tpl_data['cap_image'] = $this->dx_auth->get_captcha_image();

        $this->template->add_array($tpl_data);
        
        $check_widjet = 0;

        if (count($_POST) > 0) {
            $this->form_validation->set_rules('clientname', 'Заказчик', 'trim|required|max_length[200]|xss_clean');
            $this->form_validation->set_rules('bidhours', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('bidminutes', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('biddate', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('bidmonth', 'Время и дата подачи заявки', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('bidyear', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('fromdate', 'Период предоставления техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('frommonth', 'Период предоставления техники', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('fromyear', 'Период предоставления техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('todate', 'Период предоставления техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('tomonth', 'Период предоставления техники', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('toyear', 'Период предоставления техники', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('orderhours', 'Время и дата подачи техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('orderminutes', 'Время и дата подачи техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('orderdate', 'Время и дата подачи техники', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('ordermonth', 'Время и дата подачи техники', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('orderyear', 'Время и дата подачи техники', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('work', 'Наименование вида работ', 'trim|required|min_length[3]|max_length[200]|xss_clean');
            $this->form_validation->set_rules('typet', 'Требуемый тип техники', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('tech', 'Дополнительное оборудование', 'trim|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('object', 'Наименование и адрес объекта', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('length', 'Удаленность от города', 'trim|min_length[3]|max_length[100]|xss_clean');
            
            $this->form_validation->set_rules('worktime', 'Режим работы', 'trim|required|max_length[200]|xss_clean');
            $this->form_validation->set_rules('contactname', 'Контактное лицо', 'trim|required|max_length[300]|xss_clean');
            $this->form_validation->set_rules('liabilityname', 'Ответственный за безопасное проведение работ', 'trim|max_length[300]|xss_clean');
            
            
            
            if ($this->dx_auth->use_recaptcha)
                $this->form_validation->set_rules('recaptcha_response_field', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|xss_clean|required|callback_recaptcha_check');
            else
                $this->form_validation->set_rules('captcha', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|required|xss_clean|callback_captcha_check');

            
            if ($this->form_validation->run($this) == FALSE) {
                $fields = array(
                    'clientname' => lang('Заказчик', 'feedback'),
                    'bidhours' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidminutes' => lang('Время и дата подачи заявки', 'feedback'),
                    'biddate' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidmonth' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidyear' => lang('Время и дата подачи заявки', 'feedback'),
                    'fromdate' => lang('Период предоставления техники', 'feedback'),
                    'frommonth' => lang('Период предоставления техники', 'feedback'),
                    'fromyear' => lang('Период предоставления техники', 'feedback'),
                    'todate' => lang('Период предоставления техники', 'feedback'),
                    'tomonth' => lang('Период предоставления техники', 'feedback'),
                    'toyear' => lang('Период предоставления техники', 'feedback'),
                    
                    'orderhours' => lang('Время и дата подачи техники', 'feedback'),
                    'orderminutes' => lang('Время и дата подачи техники', 'feedback'),
                    'orderdate' => lang('Время и дата подачи техники', 'feedback'),
                    'ordermonth' => lang('Время и дата подачи техники', 'feedback'),
                    'orderyear' => lang('Время и дата подачи техники', 'feedback'),
                    
                    'work' => lang('Наименование вида работ', 'feedback'),
                    'typet' => lang('Требуемый тип техники', 'feedback'),
                    'tech' => lang('Дополнительное оборудование', 'feedback'),
                    'object' => lang('Наименование и адрес объекта', 'feedback'),
                    'length' => lang('Удаленность от города', 'feedback'),
                    'worktime' => lang('Режим работы', 'feedback'),
                    'contactname' => lang('Контактное лицо', 'feedback'),
                    
                    'liabilityname' => lang('Ответственный за безопасное проведение работ', 'feedback'),
                    'captcha' => 'Капча'
                );
                $errors = "";
                $this->form_validation->set_error_delimiters("", "");
                $errorsCustArr = array();
                foreach ($fields as $field => $name) {
                    $error = $this->form_validation->error($field);
                    $errorsCustArr[$field] = '<div class="cust_error_styling">'.$error.'</div>';
                    if (!empty($error)) {
                        $error_ = isset($this->formErrors[$error]) ? $this->formErrors[$error] : lang('Error', 'feedback');
                        $errors .= "<div style=\"color:red\">{$name} - {$error_}</div>";
                    }
                }
                
                $this->template->assign('form_errors', $errors);
                $this->template->assign('form_errors_c', $errorsCustArr);
                
                
                //$this->template->assign('form_errors', validation_errors('<div style="color:red">', '</div>'));
            } else {
                
                //Формирование сообщения
                         
$this->message = '
У вас новая заявка. Данные клиента:
Заказчик : ' . $this->input->post('clientname') . '
Время и дата подачи заявки : ' . $this->input->post('bidhours') . ':'.$this->input->post('bidminutes').', "'.$this->input->post('biddate').'"'.$this->input->post('bidmonth').'.201'.$this->input->post('bidyear').'г. '.'
Период предоставления техники : от ' . $this->input->post('fromdate') . '.'.$this->input->post('frommonth').'.'.$this->input->post('fromyear').' г. до '.$this->input->post('todate').'.'.$this->input->post('tomonth').'.'.$this->input->post('toyear').' г.
Время и дата подачи техники : ' . $this->input->post('orderhours') . ':'.$this->input->post('orderminutes').' '.$this->input->post('orderdate').'.'.$this->input->post('ordermonth').'.'.$this->input->post('orderyear').'
Наименование вида работ : ' . $this->input->post('work') . '
Требуемый тип техники : ' . $this->input->post('typet') . '
Дополнительное оборудование : ' . $this->input->post('tech') . '
Наименование и адрес объекта : ' . $this->input->post('object') . '
Удаленность от города : ' . $this->input->post('length') . '
Режим работы : ' . $this->input->post('worktime') . '
Контактное лицо : ' . $this->input->post('contactname') . '
Ответственный за безопасное проведение работ : ' . $this->input->post('liabilityname');
                
                //отсылаем сообщение
                $this->_send_message2();

                
                // Сохранение информации о клиенте в базу
                
                /*$current_date = date('Y-m-d H:i:s');
                $data = array(
                    'date' => $current_date,
                    'cash' => $this->input->post('cash'),
                    'name' => $this->input->post('name'),
                    'serial' => $this->input->post('serial'),
                    'number' => $this->input->post('number'),
                    'passreg' => $this->input->post('passreg'),
                    'passdata' => $this->input->post('passdata'),
                    'passstate' => $this->input->post('passstate'),
                    'passdate' => $this->input->post('date'),
                    'place' => $this->input->post('place'),
                    'addr1' => $this->input->post('addr1'),
                    'addr2' => $this->input->post('addr2'),
                    'phone' => $this->input->post('phone'),
                    'work' => $this->input->post('work'),
                    'workaddr' => $this->input->post('workaddr'),
                    'workphone' => $this->input->post('workphone'),
                    'proph' => $this->input->post('proph'),
                    'doccust' => $this->input->post('doccust')
                );

                $this->db->insert('clents_datac', $data);*/
                
            }
        }
        $this->display_tpl2('show_feedback');
    }
    
    
    
    public function index3() {
        //$this->core->set_meta_tags('Обратная Связь');

        $this->load->library('form_validation');
        
        // Create captcha
        $this->dx_auth->captcha();
        $tpl_data['cap_image'] = $this->dx_auth->get_captcha_image();

        $this->template->add_array($tpl_data);
        
        $check_widjet = 0;

        if (count($_POST) > 0) {
            $this->form_validation->set_rules('clientname', 'Заказчик', 'trim|required|max_length[200]|xss_clean');
            $this->form_validation->set_rules('bidhours', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('bidminutes', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('biddate', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('bidmonth', 'Время и дата подачи заявки', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('bidyear', 'Время и дата подачи заявки', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('fromdate', 'Период осуществления перевозки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('frommonth', 'Период осуществления перевозки', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('fromyear', 'Период осуществления перевозки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('todate', 'Период осуществления перевозки', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('tomonth', 'Период осуществления перевозки', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('toyear', 'Период осуществления перевозки', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('typet', 'Требуемый тип техники', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('work', 'Грузоотправитель (фирма)', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            
            $this->form_validation->set_rules('orderhours', 'Время и дата подачи техники под погрузку', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('orderminutes', 'Время и дата подачи техники под погрузку', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('orderdate', 'Время и дата подачи техники под погрузку', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('ordermonth', 'Время и дата подачи техники под погрузку', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('orderyear', 'Время и дата подачи техники под погрузку', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('object', 'Место погрузки и его адрес', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('length', 'Удаленность от города', 'trim|min_length[3]|max_length[200]|xss_clean');
            $this->form_validation->set_rules('worktime', 'Режим работы грузоотправителя (фирмы)', 'trim|required|max_length[300]|xss_clean');
            $this->form_validation->set_rules('contactname', 'Контактное лицо, телефон', 'trim|required|max_length[400]|xss_clean');
            
            $this->form_validation->set_rules('object2', 'Грузополучатель (фирма)', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('place2', 'Место разгрузки и его адрес', 'trim|required|min_length[3]|max_length[300]|xss_clean');
            $this->form_validation->set_rules('length2', 'Удаленность от города', 'trim|min_length[3]|max_length[100]|xss_clean');
            $this->form_validation->set_rules('worktime2', 'Режим работы грузополучателя (фирмы)', 'trim|required|max_length[300]|xss_clean');
            $this->form_validation->set_rules('contactname2', 'Контактное лицо, телефон', 'trim|required|max_length[300]|xss_clean');
            $this->form_validation->set_rules('tech', 'Наименование груза', 'trim|required|min_length[3]|max_length[200]|xss_clean');
            
            $this->form_validation->set_rules('liabilityname', 'Объявленная стоимость груза', 'trim|max_length[300]|xss_clean');
            $this->form_validation->set_rules('weight', 'Вес (тонн), вес упаковки (тонн) какая загрузка', 'trim|min_length[3]|max_length[200]|xss_clean');
            
            $this->form_validation->set_rules('biddate2', 'Срок доставки груза', 'trim|required|max_length[5]|xss_clean');
            $this->form_validation->set_rules('bidmonth2', 'Срок доставки груза', 'trim|required|max_length[20]|xss_clean');
            $this->form_validation->set_rules('bidyear2', 'Срок доставки груза', 'trim|required|max_length[5]|xss_clean');
            
            $this->form_validation->set_rules('addit', 'Дополнительная информация', 'trim|min_length[3]|max_length[400]|xss_clean');
            
            
            if ($this->dx_auth->use_recaptcha)
                $this->form_validation->set_rules('recaptcha_response_field', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|xss_clean|required|callback_recaptcha_check');
            else
                $this->form_validation->set_rules('captcha', lang("Code protection", 'feedback') . 'RECAPTCHA', 'trim|required|xss_clean|callback_captcha_check');

            
            if ($this->form_validation->run($this) == FALSE) {
                $fields = array(
                    'clientname' => lang('Заказчик', 'feedback'),
                    'bidhours' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidminutes' => lang('Время и дата подачи заявки', 'feedback'),
                    'biddate' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidmonth' => lang('Время и дата подачи заявки', 'feedback'),
                    'bidyear' => lang('Время и дата подачи заявки', 'feedback'),
                    
                    
                    'fromdate' => lang('Период осуществления перевозки', 'feedback'),
                    'frommonth' => lang('Период осуществления перевозки', 'feedback'),
                    'fromyear' => lang('Период осуществления перевозки', 'feedback'),
                    'todate' => lang('Период осуществления перевозки', 'feedback'),
                    'tomonth' => lang('Период осуществления перевозки', 'feedback'),
                    'toyear' => lang('Период осуществления перевозки', 'feedback'),
                    
                    'typet' => lang('Требуемый тип техники', 'feedback'),
                    'work' => lang('Грузоотправитель (фирма)', 'feedback'),
                    
                    'orderhours' => lang('Время и дата подачи техники', 'feedback'),
                    'orderminutes' => lang('Время и дата подачи техники', 'feedback'),
                    'orderdate' => lang('Время и дата подачи техники', 'feedback'),
                    'ordermonth' => lang('Время и дата подачи техники', 'feedback'),
                    'orderyear' => lang('Время и дата подачи техники', 'feedback'),
                    
                    'object' => lang('Место погрузки и его адрес', 'feedback'),
                    'length' => lang('Удаленность от города', 'feedback'),
                    'worktime' => lang('Режим работы грузоотправителя (фирмы)', 'feedback'),
                    'contactname' => lang('Контактное лицо, телефон', 'feedback'),
                    
                    'object2' => lang('Грузополучатель (фирма)', 'feedback'),
                    'place2' => lang('Место разгрузки и его адрес', 'feedback'),
                    'length2' => lang('Удаленность от города', 'feedback'),
                    'worktime2' => lang('Режим работы грузополучателя (фирмы)', 'feedback'),
                    'contactname2' => lang('Контактное лицо, телефон', 'feedback'),
                    'tech' => lang('Наименование груза', 'feedback'),
                    
                    'liabilityname' => lang('Объявленная стоимость груза', 'feedback'),
                    'weight' => lang('Вес (тонн), вес упаковки (тонн) какая загрузка', 'feedback'),
                    
                    'biddate2' => lang('Срок доставки груза', 'feedback'),
                    'bidmonth2' => lang('Срок доставки груза', 'feedback'),
                    'bidyear2' => lang('Срок доставки груза', 'feedback'),
                    
                    'addit' => lang('Дополнительная информация', 'feedback'),
                    'captcha' => 'Капча'
                );
                $errors = "";
                $this->form_validation->set_error_delimiters("", "");
                $errorsCustArr = array();
                foreach ($fields as $field => $name) {
                    $error = $this->form_validation->error($field);
                    $errorsCustArr[$field] = '<div class="cust_error_styling">'.$error.'</div>';
                    if (!empty($error)) {
                        $error_ = isset($this->formErrors[$error]) ? $this->formErrors[$error] : lang('Error', 'feedback');
                        $errors .= "<div style=\"color:red\">{$name} - {$error_}</div>";
                    }
                }
                
                $this->template->assign('form_errors', $errors);
                $this->template->assign('form_errors_c', $errorsCustArr);
                
                
                //$this->template->assign('form_errors', validation_errors('<div style="color:red">', '</div>'));
            } else {
                
                //Формирование сообщения
                         
$this->message = '
У вас новая заявка. Данные клиента:
Заказчик : ' . $this->input->post('clientname') . '
Время и дата подачи заявки : ' . $this->input->post('bidhours') . ':'.$this->input->post('bidminutes').', "'.$this->input->post('biddate').'"'.$this->input->post('bidmonth').'.201'.$this->input->post('bidyear').'г. '.'
Период предоставления техники : от ' . $this->input->post('fromdate') . '.'.$this->input->post('frommonth').'.'.$this->input->post('fromyear').' г. до '.$this->input->post('todate').'.'.$this->input->post('tomonth').'.'.$this->input->post('toyear').' г.
Требуемый тип техники : '.$this->input->post('typet').'
Грузоотправитель (фирма) : ' . $this->input->post('work') . '
Время и дата подачи техники под погрузку : ' . $this->input->post('orderhours') . ':'.$this->input->post('orderminutes').' '.$this->input->post('orderdate').'.'.$this->input->post('ordermonth').'.'.$this->input->post('orderyear').'
Место погрузки и его адрес : ' . $this->input->post('object') . '
Удаленность от города : ' . $this->input->post('length') . '
Режим работы грузоотправителя (фирмы) : ' . $this->input->post('worktime') . '
Контактное лицо, телефон : ' . $this->input->post('contactname') . '
Грузополучатель (фирма) : ' . $this->input->post('object2') . '
Место разгрузки и его адрес : ' . $this->input->post('place2') . '
Удаленность от города : ' . $this->input->post('length2') . '
Режим работы грузополучателя (фирмы) : ' . $this->input->post('worktime2') . '
Контактное лицо, телефон : ' . $this->input->post('contactname2') . '
Наименование груза : ' . $this->input->post('tech') . '
Объявленная стоимость груза : ' . $this->input->post('liabilityname') . '
Вес (тонн), вес упаковки (тонн) какая загрузка : ' . $this->input->post('weight').'
Время и дата подачи заявки : ' . $this->input->post('biddate2').'"'.$this->input->post('bidmonth2').'.201'.$this->input->post('bidyear2').'г. '.'
Дополнительная информация : ' . $this->input->post('addit');







                
                //отсылаем сообщение
                $this->_send_message2();

                
                // Сохранение информации о клиенте в базу
                
                /*$current_date = date('Y-m-d H:i:s');
                $data = array(
                    'date' => $current_date,
                    'cash' => $this->input->post('cash'),
                    'name' => $this->input->post('name'),
                    'serial' => $this->input->post('serial'),
                    'number' => $this->input->post('number'),
                    'passreg' => $this->input->post('passreg'),
                    'passdata' => $this->input->post('passdata'),
                    'passstate' => $this->input->post('passstate'),
                    'passdate' => $this->input->post('date'),
                    'place' => $this->input->post('place'),
                    'addr1' => $this->input->post('addr1'),
                    'addr2' => $this->input->post('addr2'),
                    'phone' => $this->input->post('phone'),
                    'work' => $this->input->post('work'),
                    'workaddr' => $this->input->post('workaddr'),
                    'workphone' => $this->input->post('workphone'),
                    'proph' => $this->input->post('proph'),
                    'doccust' => $this->input->post('doccust')
                );

                $this->db->insert('clents_datac', $data);*/
                
            }
        }
        $this->display_tpl2('show_feedback2');
    }
    

    // Send e-mail
    private function _send_message() {
        $config['charset'] = 'UTF-8';
        $config['wordwrap'] = FALSE;

        $this->load->library('email');
        $this->email->initialize($config);

        $this->email->from($this->input->post('email'), $this->input->post('name'));
        $this->email->to($this->admin_mail);

        $this->email->subject($this->input->post('theme'));
        $this->email->message($this->message);

        $this->email->send();

        $this->template->assign('message_sent', TRUE);
    }
    
    private function _send_message2() {
        $config['charset'] = 'UTF-8';
        $config['wordwrap'] = FALSE;

        $this->load->library('email');
        $this->email->initialize($config);

        $this->email->from('robot@valkon-spb.ru', 'Клиент');
        $this->email->to('007exxe@gmail.com');

        $this->email->subject('Новая заявка');
        $this->email->message($this->message);

        $this->email->send();

        $this->template->assign('message_sent', TRUE);
    }

    private function load_settings() {
        $this->db->limit(1);
        $this->db->where('name', 'feedback');
        $query = $this->db->get('components')->row_array();

        $settings = unserialize($query['settings']);

        if (is_int($settings['message_max_len'])) {
            $this->message_max_len = $settings['message_max_len'];
        }

        if ($settings['email']) {
            $this->admin_mail = $settings['email'];
        }
    }

    /**
     * Display template file
     */
    private function display_tpl($file = '') {
        $file = realpath(dirname(__FILE__)) . '/templates/' . $file;
        $this->template->show('file:' . $file);
    }
    
    private function display_tpl2($file = '') {
        $file = realpath(dirname(__FILE__)) . '/templates/' . $file;
        $this->template->show('file:' . $file,FALSE);
    }

}

/* End of file sample_module.php */
