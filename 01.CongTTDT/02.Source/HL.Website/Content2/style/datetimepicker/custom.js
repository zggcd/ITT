/*
  jQuery Document ready
*/

    var jqCustom = $.noConflict();
    jQuery(document).ready(function () {
        jqCustom('.datepicker').datepicker({
		    onSelect: function (){this.focus();}
			}
        );
         jqCustom('.timepicker').timepicker({
	        controlType: 'select',
		    onSelect: function (){this.focus();}
			}
        );

        jqCustom('.datetimepicker').datetimepicker({
	        controlType: 'select',
        	timeFormat: 'HH:mm',
        	onSelect: function (){this.focus();}
        });
        });
jqCustom.datepicker.regional['custom'] = {     
    dateFormat: 'dd/mm/yy',	
	monthNames:['Tháng một','Tháng hai','Tháng ba','Tháng tư','Tháng năm','Tháng sáu','Tháng bảy',
	'Tháng tám','Tháng chín','Tháng mười','Tháng mười một','Tháng mười hai'],
	monthNamesShort: ['Th 1','Th 2','Th 3','Th 4','Th 5','Th 6','Th 7',
	'Th 8','Th 9','Th 10','Th 11','Th 12'],
	dayNames: ['Chủ nhật','Thứ hai','Thứ ba','Thứ tư','Thứ năm','Thứ sáu','Thứ bảy'],
	dayNamesShort: ['Chủ nhật','Thứ 2','Thứ 3','Thứ 4','Thứ 5','Thứ 6','Thứ 7'],
	dayNamesMin: ['CN','T2','T3','T4','T5','T6','T7']
	
};
jqCustom.datepicker.setDefaults(jqCustom.datepicker.regional['custom']);
jqCustom.timepicker.regional['custom'] = {
	timeOnlyTitle: 'Chọn thời gian',
	timeText: 'Thời gian',
	hourText: 'Giờ',
	minuteText: 'Phút',
	secondText: 'Giây',
	currentText:'Bây giờ',
	closeText:'OK',
	isRTL: false
};
jqCustom.timepicker.setDefaults(jqCustom.timepicker.regional['custom']);

//});
   
