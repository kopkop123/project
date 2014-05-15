<div class="order-wrap-2" {if $message_sent}style="height:200px;"{/if}><div class="order" {if $message_sent}style="height:200px;"{/if}>
                {if $message_sent}
                    <div style="color: green;">
                        Спасибо, ваша заявка зарегистрирована. Наш менеджер свяжется с вами в ближайшее время.<br/>
                        <a href="{site_url('')}">Вернуться на главную</a>
                    </div>
                {else:}
                
                <form action="{site_url('')}" id="userForm" enctype="multipart/form-data" method="post">
                    
                    <p style="text-align: center">Заявка <br/>на оказание услуг по предоставлению строительно-дорожной техники</p>
                    <p>Заказчик: 
                        <input type="text" name="clientname" size="80" value="{if $_POST.clientname}{$_POST.clientname}{/if}">
                        {if $form_errors_c.clientname}<br/>{$form_errors_c.clientname}{/if}
                    </p>

                    <table width="741" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="221">Время и дата подачи заявки</td>
                        <td colspan="2">
                        <input name="bid-hours" type="text" size="5" value="{if $_POST.bid-hours}{$_POST.bid-hours}{/if}">:<input name="bid-minutes" type="text" size="5" value="{if $_POST.bid-minutes}{$_POST.bid-minutes}{/if}">&nbsp;&nbsp;&nbsp;      
                         "<input name="bid-date" type="text" id="textfield" size="5" value="{if $_POST.bid-date}{$_POST.bid-date}{/if}">"<input name="bid-month" type="text" size="20" value="{if $_POST.bid-month}{$_POST.bid-month}{/if}">201<input name="bid-year" type="text" size="5" value="{if $_POST.bid-year}{$_POST.bid-year}{/if}" >
                         г.
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        <!--{if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}-->
                        </td>
                      </tr>
                      <tr>
                        <td>Период предоставления техники</td>
                        <td width="264">"
                          <input name="fromperiod-date" type="text" size="5" value="{if $_POST.fromperiod-date}{$_POST.fromperiod-date}{/if}">
                          "
                          <input name="fromperiod-month" type="text" size="20" value="{if $_POST.fromperiod-month}{$_POST.fromperiod-month}{/if}">
                          201
                          <input name="fromperiod-year" type="text" size="5" value="{if $_POST.fromperiod-year}{$_POST.fromperiod-year}{/if}">
                    г.
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        <!--{if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}-->
                        </td>
                        <td width="256">"
                          <input name="toperiod-date" type="text" size="5" value="{if $_POST.toperiod-date}{$_POST.toperiod-date}{/if}">
                          "
                          <input name="toperiod-month" type="text" size="20" value="{if $_POST.toperiod-month}{$_POST.toperiod-month}{/if}">
                          201
                          <input name="toperiod-year" type="text" size="5" value="{if $_POST.toperiod-year}{$_POST.toperiod-year}{/if}">
                    г.
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        <!--{if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}-->
                        </td>
                      </tr>
                      <tr>
                        <td>Время и дата подачи техники на объект</td>
                        <td colspan="2">
                            <input name="order-hours" type="text" size="5" value="{if $_POST.order-hours}{$_POST.order-hours}{/if}">:<input type="text" name="order-minutes" size="5" value="{if $_POST.order-minutes}{$_POST.order-minutes}{/if}">&nbsp;&nbsp;&nbsp;      
                         "<input name="order-date" type="text" size="5" value="{if $_POST.order-date}{$_POST.order-date}{/if}">"<input name="order-month" type="text" size="20" value="{if $_POST.order-month}{$_POST.order-month}{/if}">201<input name="order-year" type="text" size="5" value="{if $_POST.order-year}{$_POST.order-year}{/if}">
                        г.
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        <!--{if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}-->
                        </td>
                      </tr>
                      <tr>
                        <td>Наименование вида работ</td>
                        <td colspan="2">
                            <input name="work" type="text" size="50" value="{if $_POST.work}{$_POST.work}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Требуемый тип техники (марка, модель техники)</td>
                        <td colspan="2">
                            <input name="typet" type="text" size="50" value="{if $_POST.typet}{$_POST.typet}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Дополнительное навесное оборудование</td>
                        <td colspan="2">
                            <input name="tech" type="text" size="50" value="{if $_POST.tech}{$_POST.tech}{/if}">
                            
                        </td>
                      </tr>
                      <tr>
                        <td>Наименование объекта и адрес производства работ</td>
                        <td colspan="2">
                            <input name="object" type="text" size="70" value="{if $_POST.object}{$_POST.object}{/if}">
                            
                        </td>
                      </tr>
                      <tr>
                        <td>Удаленность от города, км</td>
                        <td colspan="2">
                            <input name="length" type="text" size="50" value="{if $_POST.length}{$_POST.length}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Режим работы на объекте</td>
                        <td colspan="2">
                            <input name="worktime" type="text" size="50" value="{if $_POST.worktime}{$_POST.worktime}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Контактное лицо (ФИО), телефон</td>
                        <td colspan="2">
                            <input name="contactname" type="text" size="50" value="{if $_POST.contactname}{$_POST.contactname}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Ответственный за безопасное проведение работ на объекте (ФИО), телефон</td>
                        <td colspan="2">
                            <input name="liabilityname" type="text" size="50" value="{if $_POST.liabilityname}{$_POST.liabilityname}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Условия оплаты</td>
                        <td colspan="2">Еженедельная предоплата в размере 100% </td>
                      </tr>
                      <tr>
                        <td>Единица измерения</td>
                        <td colspan="2">час</td>
                      </tr>
                      <tr>
                        <td>Стоимость за единицу измерения</td>
                        <td colspan="2">
                            <input name="cost" type="text" size="50" value="{if $_POST.cost}{$_POST.cost}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="3"> Минимальная продолжительность смены работы техники в черте города Санкт-Петербург не менее 8 (восемь) часов в смену, за пределами кольцевой автодороги города Санкт-Петербург не менее 10 (десять) часов в смену. <br></td>
                      </tr>
                      <tr>
                        <td colspan="3"> Доставка техники в черте города Санкт-Петербург составляет 1(один) час, за пределами кольцевой автодороги города Санкт-Петербурга оговаривается дополнительно. <br></td>
                      </tr>
                      <tr>
                        <td colspan="3"> Факсимильная копия заявки и заявка, отправленная по электронной почте, имеют юридическую силу оригинала и считаются действительными при условии, что они утверждены подписью и печатью ЗАКАЗЧИКА. <br></td>
                      </tr>
                      <tr>
                        <td colspan="3"> Заявка принимается в работу ИСПОЛНИТЕЛЕМ по телефону: (812)346-8117, факсу (812)640-9646 <br></td>
                      </tr>
                    </table>
                    
                    
                    
                    
                    
                    
                    
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="184">Сумма кредита:</td>
                        <td width="166">
                            <input type="text" name="cash" value="{if $_POST.cash}{$_POST.cash}{/if}">
                            {if $form_errors_c.cash}<br/>{$form_errors_c.cash}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Ф.И.О.:</td>
                        <td><input type="text" name="name" value="{if $_POST.name}{$_POST.name}{/if}">
                        {if $form_errors_c.name}<br/>{$form_errors_c.name}{/if}</td>
                      </tr>
                      <tr>
                          <td colspan="2" style="text-align: center;">Паспорт:</td>
                      </tr>
                      <tr>
                        <td>Серия:</td>
                        <td><input type="text" name="serial" value="{if $_POST.serial}{$_POST.serial}{/if}">
                        {if $form_errors_c.serial}<br/>{$form_errors_c.serial}{/if}</td>
                      </tr>
                      <tr>
                        <td>Номер:</td>
                        <td><input type="text" name="number" value="{if $_POST.number}{$_POST.number}{/if}">
                        {if $form_errors_c.number}<br/>{$form_errors_c.number}{/if}</td>
                      </tr>
                      <tr>
                        <td>Кем выдан:</td>
                        <td><input type="text" name="passreg" value="{if $_POST.passreg}{$_POST.passreg}{/if}">
                        {if $form_errors_c.passreg}<br/>{$form_errors_c.passreg}{/if}</td>
                      </tr>
                      <tr>
                        <td>Когда выдан:</td>
                        <td><input type="text" name="passdata" value="{if $_POST.passdata}{$_POST.passdata}{/if}">
                        {if $form_errors_c.passdata}<br/>{$form_errors_c.passdata}{/if}</td>
                      </tr>
                      <tr>
                        <td>Код подразделения:</td>
                        <td><input type="text" name="passstate" value="{if $_POST.passstate}{$_POST.passstate}{/if}">
                        {if $form_errors_c.passstate}<br/>{$form_errors_c.passstate}{/if}</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>Дата рождения:</td>
                        <td><input type="text" name="date" value="{if $_POST.date}{$_POST.date}{/if}">
                        {if $form_errors_c.date}<br/>{$form_errors_c.date}{/if}</td>
                      </tr>
                      <tr>
                        <td>Место рождения:</td>
                        <td><input type="text" name="place" value="{if $_POST.place}{$_POST.place}{/if}">
                        {if $form_errors_c.place}<br/>{$form_errors_c.place}{/if}</td>
                      </tr>
                      <tr>
                        <td>Прописка:</td>
                        <td><input type="text" name="addr1" value="{if $_POST.addr1}{$_POST.addr1}{/if}">
                        {if $form_errors_c.addr1}<br/>{$form_errors_c.addr1}{/if}</td>
                      </tr>
                      <tr>
                        <td>Место регистрации:</td>
                        <td><input type="text" name="addr2" value="{if $_POST.addr2}{$_POST.addr2}{/if}">
                        {if $form_errors_c.addr2}<br/>{$form_errors_c.addr2}{/if}</td>
                      </tr>
                      <tr>
                        <td>Контактный телефон:</td>
                        <td><input type="text" name="phone" value="{if $_POST.phone}{$_POST.phone}{/if}">
                        {if $form_errors_c.phone}<br/>{$form_errors_c.phone}{/if}</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>Место работы:</td>
                        <td><input type="text" name="work" value="{if $_POST.work}{$_POST.work}{/if}">
                        {if $form_errors_c.work}<br/>{$form_errors_c.work}{/if}</td>
                      </tr>
                      <tr>
                        <td>Адрес места работы:</td>
                        <td><input type="text" name="workaddr" value="{if $_POST.workaddr}{$_POST.workaddr}{/if}">
                        {if $form_errors_c.workaddr}<br/>{$form_errors_c.workaddr}{/if}</td>
                      </tr>
                      <tr>
                        <td>Телефон с места работы:</td>
                        <td><input type="text" name="workphone" value="{if $_POST.workphone}{$_POST.workphone}{/if}">
                        {if $form_errors_c.workphone}<br/>{$form_errors_c.workphone}{/if}</td>
                      </tr>
                      <tr>
                        <td>Должность:</td>
                        <td><input type="text" name="proph" value="{if $_POST.proph}{$_POST.proph}{/if}">
                        {if $form_errors_c.proph}<br/>{$form_errors_c.proph}{/if}</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>Второй документ:</td>
                        <td><input type="text" name="doccust" value="{if $_POST.doccust}{$_POST.doccust}{/if}">
                        {if $form_errors_c.doccust}<br/>{$form_errors_c.doccust}{/if}</td>
                      </tr>
                    {if $captcha_type =='captcha'}
                      <tr class="cust-viz">
                        <td colspan="2">На нашем сайте действует защита от спама. Будьте добры, введите символы с картинки латинскими буквами, затем нажмите кнопку «Отправить». Не закрывайте сразу страницу, дождитесь уведомления об успешной отправке. </td>
                      </tr>
                      <tr class="cust-viz">
                          <td colspan="2" style="padding:20px 4px 0 4px;text-align: center;">
                              <div>{$cap_image}</div>
                              <div><input style="width:80px;" type="text" name="captcha" value="" />
                          </td></div>
                      </tr>
                      {if $form_errors_c.captcha}
                          <tr>
                              <td colspan="2" style="padding-bottom: 20px;text-align: left;"><div style="padding-left: 20px;text-align: left;">{$form_errors_c.captcha}</div></td>
                          </tr>
                      {/if}
                    {/if}
                    <tr class="cust-viz">
                        <td colspan="2">
                            {form_csrf()}<input type="submit" value="Отправить" name="submitbtn" id="10" class="submit-button">
                        </td>
                    </tr>
                    </table>
                {/if}
</div></div>