<div class="order-wrap-2" {if $message_sent}style="height:200px;"{/if}><div class="order" {if $message_sent}style="height:200px;"{/if}>
                {if $message_sent}
                    <div style="color: green;">
                        Спасибо, ваша заявка зарегистрирована. Наш менеджер свяжется с вами в ближайшее время.<br/>
                        <a href="{site_url('')}">Вернуться на главную</a>
                    </div>
                {else:}
                
                <form action="{site_url('')}" id="userForm" enctype="multipart/form-data" method="post">
                    
                    <p style="text-align: center">Заявка <br/>на оказание услуг по осуществлению перевозки грузов<br/></p>
                    <p>Заказчик: 
                        <input type="text" name="clientname" size="80" value="{if $_POST.clientname}{$_POST.clientname}{/if}">
                        {if $form_errors_c.clientname}<br/>{$form_errors_c.clientname}{/if}
                    </p>

                    <table width="741" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="221">Время и дата подачи заявки</td>
                        <td colspan="2">
                        <input name="bidhours" type="text" size="5" value="{if $_POST.bidhours}{$_POST.bidhours}{/if}">:<input name="bidminutes" type="text" size="5" value="{if $_POST.bidminutes}{$_POST.bidminutes}{/if}">&nbsp;&nbsp;&nbsp;      
                         "<input name="biddate" type="text" id="textfield" size="5" value="{if $_POST.biddate}{$_POST.biddate}{/if}">"<input name="bidmonth" type="text" size="20" value="{if $_POST.bidmonth}{$_POST.bidmonth}{/if}">201<input name="bidyear" type="text" size="5" value="{if $_POST.bidyear}{$_POST.bidyear}{/if}" >
                         г.
                        {if $form_errors_c.bidhours}<br/>{$form_errors_c.bidhours}{/if}
                        {if $form_errors_c.bidminutes}<br/>{$form_errors_c.bidminutes}{/if}
                        {if $form_errors_c.biddate}<br/>{$form_errors_c.biddate}{/if}
                        {if $form_errors_c.bidmonth}<br/>{$form_errors_c.bidmonth}{/if}
                        {if $form_errors_c.bidyear}<br/>{$form_errors_c.bidyear}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Период осуществления перевозки</td>
                        <td width="264">"
                          <input name="fromdate" type="text" size="5" value="{if $_POST.fromdate}{$_POST.fromdate}{/if}">
                          "
                          <input name="frommonth" type="text" size="20" value="{if $_POST.frommonth}{$_POST.frommonth}{/if}">
                          201
                          <input name="fromyear" type="text" size="5" value="{if $_POST.fromyear}{$_POST.fromyear}{/if}">
                    г.
                        {if $form_errors_c.fromdate}<br/>{$form_errors_c.fromdate}{/if}
                        {if $form_errors_c.frommonth}<br/>{$form_errors_c.frommonth}{/if}
                        {if $form_errors_c.fromyear}<br/>{$form_errors_c.fromyear}{/if}
                        </td>
                        <td width="256">"
                          <input name="todate" type="text" size="5" value="{if $_POST.todate}{$_POST.todate}{/if}">
                          "
                          <input name="tomonth" type="text" size="20" value="{if $_POST.tomonth}{$_POST.tomonth}{/if}">
                          201
                          <input name="toyear" type="text" size="5" value="{if $_POST.toyear}{$_POST.toyear}{/if}">
                    г.
                        {if $form_errors_c.todate}<br/>{$form_errors_c.todate}{/if}
                        {if $form_errors_c.tomonth}<br/>{$form_errors_c.tomonth}{/if}
                        {if $form_errors_c.toyear}<br/>{$form_errors_c.toyear}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Требуемый тип техники (марка, модель техники)</td>
                        <td colspan="2">
                            <input name="typet" type="text" size="50" value="{if $_POST.typet}{$_POST.typet}{/if}">
                            {if $form_errors_c.typet}<br/>{$form_errors_c.typet}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Грузоотправитель (фирма)</td>
                        <td colspan="2">
                            <input name="work" type="text" size="100" value="{if $_POST.work}{$_POST.work}{/if}">
                            {if $form_errors_c.work}<br/>{$form_errors_c.work}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Время и дата подачи техники под погрузку</td>
                        <td colspan="2">
                            <input name="orderhours" type="text" size="5" value="{if $_POST.orderhours}{$_POST.orderhours}{/if}">:<input type="text" name="orderminutes" size="5" value="{if $_POST.orderminutes}{$_POST.orderminutes}{/if}">&nbsp;&nbsp;&nbsp;      
                         "<input name="orderdate" type="text" size="5" value="{if $_POST.orderdate}{$_POST.orderdate}{/if}">"<input name="ordermonth" type="text" size="20" value="{if $_POST.ordermonth}{$_POST.ordermonth}{/if}">201<input name="orderyear" type="text" size="5" value="{if $_POST.orderyear}{$_POST.orderyear}{/if}">
                        г.
                        {if $form_errors_c.orderhours}<br/>{$form_errors_c.orderhours}{/if}
                        {if $form_errors_c.orderminutes}<br/>{$form_errors_c.orderminutes}{/if}
                        {if $form_errors_c.orderdate}<br/>{$form_errors_c.orderdate}{/if}
                        {if $form_errors_c.ordermonth}<br/>{$form_errors_c.ordermonth}{/if}
                        {if $form_errors_c.orderyear}<br/>{$form_errors_c.orderyear}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Место погрузки и его адрес</td>
                        <td colspan="2">
                            <input name="object" type="text" size="70" value="{if $_POST.object}{$_POST.object}{/if}">
                            {if $form_errors_c.object}<br/>{$form_errors_c.object}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Удаленность от города, км</td>
                        <td colspan="2">
                            <input name="length" type="text" size="50" value="{if $_POST.length}{$_POST.length}{/if}">
                            {if $form_errors_c.length}<br/>{$form_errors_c.length}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Режим работы грузоотправителя (фирмы)</td>
                        <td colspan="2">
                            <input name="worktime" type="text" size="50" value="{if $_POST.worktime}{$_POST.worktime}{/if}">
                            {if $form_errors_c.worktime}<br/>{$form_errors_c.worktime}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Контактное лицо, телефон</td>
                        <td colspan="2">
                            <input name="contactname" type="text" size="50" value="{if $_POST.contactname}{$_POST.contactname}{/if}">
                            {if $form_errors_c.contactname}<br/>{$form_errors_c.contactname}{/if}
                        </td>
                      </tr>
                      
                      
                      
                      
                      <tr>
                        <td>Грузополучатель (фирма)</td>
                        <td colspan="2">
                            <input name="object2" type="text" size="50" value="{if $_POST.object2}{$_POST.object2}{/if}">
                            {if $form_errors_c.object2}<br/>{$form_errors_c.object2}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Место разгрузки и его адрес</td>
                        <td colspan="2">
                            <input name="place2" type="text" size="50" value="{if $_POST.place2}{$_POST.place2}{/if}">
                            {if $form_errors_c.place2}<br/>{$form_errors_c.place2}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Удаленность от города, км</td>
                        <td colspan="2">
                            <input name="length2" type="text" size="50" value="{if $_POST.length2}{$_POST.length2}{/if}">
                            {if $form_errors_c.length2}<br/>{$form_errors_c.length2}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Режим работы грузополучателя (фирмы)</td>
                        <td colspan="2">
                            <input name="worktime2" type="text" size="50" value="{if $_POST.worktime2}{$_POST.worktime2}{/if}">
                            {if $form_errors_c.worktime2}<br/>{$form_errors_c.worktime2}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Контактное лицо, телефон</td>
                        <td colspan="2">
                            <input name="contactname2" type="text" size="50" value="{if $_POST.contactname2}{$_POST.contactname2}{/if}">
                            {if $form_errors_c.contactname2}<br/>{$form_errors_c.contactname2}{/if}
                        </td>
                      </tr>
                      
                      <tr>
                        <td>Наименование груза</td>
                        <td colspan="2">
                            <input name="tech" type="text" size="50" value="{if $_POST.tech}{$_POST.tech}{/if}">
                            {if $form_errors_c.tech}<br/>{$form_errors_c.tech}{/if}
                        </td>
                      </tr>
                      
                      
                      
                      
                      <tr>
                        <td>Объявленная стоимость груза</td>
                        <td colspan="2">
                            <input name="liabilityname" type="text" size="50" value="{if $_POST.liabilityname}{$_POST.liabilityname}{/if}">
                            {if $form_errors_c.liabilityname}<br/>{$form_errors_c.liabilityname}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Вес (тонн), вес упаковки (тонн) какая загрузка</td>
                        <td colspan="2">
                            <input name="weight" type="text" size="50" value="{if $_POST.weight}{$_POST.weight}{/if}">
                            {if $form_errors_c.weight}<br/>{$form_errors_c.weight}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Срок доставки груза</td>
                        <td width="264" colspan="2">"
                          <input name="biddate2" type="text" size="5" value="{if $_POST.biddate2}{$_POST.biddate2}{/if}">
                          "
                          <input name="bidmonth2" type="text" size="20" value="{if $_POST.bidmonth2}{$_POST.bidmonth2}{/if}">
                          201
                          <input name="bidyear2" type="text" size="5" value="{if $_POST.bidyear2}{$_POST.bidyear2}{/if}">
                    г.
                        {if $form_errors_c.biddate2}<br/>{$form_errors_c.biddate2}{/if}
                        {if $form_errors_c.bidmonth2}<br/>{$form_errors_c.bidmonth2}{/if}
                        {if $form_errors_c.bidyear2}<br/>{$form_errors_c.bidyear2}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Условия оплаты</td>
                        <td colspan="2">Предоплата в размере 100%</td>
                      </tr>
                      <tr>
                        <td>Стоимость перевозки</td>
                        <td colspan="2">
                            <input name="cost" type="text" size="50" value="{if $_POST.cost}{$_POST.cost}{/if}">
                            {if $form_errors_c.cost}<br/>{$form_errors_c.cost}{/if}
                        </td>
                      </tr>
                      <tr>
                        <td>Дополнительная информация</td>
                        <td colspan="2">
                            <input name="addit" type="text" size="50" value="{if $_POST.addit}{$_POST.addit}{/if}">
                            {if $form_errors_c.addit}<br/>{$form_errors_c.addit}{/if}
                        </td>
                      </tr>
                      
                    {if $captcha_type =='captcha'}
                      <tr class="cust-viz">
                        <td colspan="3">На нашем сайте действует защита от спама. Будьте добры, введите символы с картинки латинскими буквами, затем нажмите кнопку «Отправить». Не закрывайте сразу страницу, дождитесь уведомления об успешной отправке. </td>
                      </tr>
                      <tr class="cust-viz">
                          <td colspan="3" style="padding:20px 4px 0 4px;text-align: center;">
                              <div>{$cap_image}</div>
                              <div><input style="width:80px;" type="text" name="captcha" value="" />
                          </td></div>
                      </tr>
                      {if $form_errors_c.captcha}
                          <tr>
                              <td colspan="3" style="padding-bottom: 20px;text-align: left;"><div style="padding-left: 20px;text-align: left;">{$form_errors_c.captcha}</div></td>
                          </tr>
                      {/if}
                    {/if}
                    <tr class="cust-viz">
                        <td colspan="3">
                            {form_csrf()}<input type="submit" value="Отправить" name="submitbtn" id="10" class="submit-button">
                        </td>
                    </tr>
                      
                      
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="3">Минимальная продолжительность смены работы техники в черте города Санкт-Петербург не менее 8 (восемь) часов в смену, за пределами кольцевой автодороги города Санкт-Петербург не менее 10 (десять) часов в смену.<br></td>
                      </tr>
                      <tr>
                        <td colspan="3">Доставка техники в черте города Санкт-Петербург составляет 1(один) час, за пределами кольцевой автодороги города Санкт-Петербурга оговаривается дополнительно.<br></td>
                      </tr>
                      <tr>
                        <td colspan="3">Факсимильная копия заявки и заявка, отправленная по электронной почте, имеют юридическую силу оригинала и считаются действительными при условии, что они утверждены подписью и печатью ЗАКАЗЧИКА.<br></td>
                      </tr>
                      <tr>
                        <td colspan="3">Также заявка принимается в работу ИСПОЛНИТЕЛЕМ по телефону: (812)346-8117, факсу (812)640-9646<br></td>
                      </tr>
                    </table>
                </form>
                    
                    
                    
                    
                    
                    
                    
                {/if}
</div></div>