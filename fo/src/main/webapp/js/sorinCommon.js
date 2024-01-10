let sorin = {};

var sorinAccount = "";
var sorinBdAccount = "";

$(function () {
	if(currentPage != 'bid'){
		sorinAccount = sorin.account.getUserInfo();  //"";
	} else {
		sorinBdAccount = sorin.bdAccount.getBdUserInfo(); //구매입찰
	}
});

///////////////////////////////      ajax 통신 시작      ///////////////////////////////
sorin.ajax = {
	/**
     * <pre>
     * 함수명 : postJSON</br>
     * 설  명 : ajax POST 통신, 데이터를 JSON형으로 주고 받음</br>
     * 사용법 : sorin.ajax.postJSON(url, data, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL (String)
     * @param data 보낼 JSON형 Data
     * @param isAsync boolean, true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	postJSON : function(url, data, isAsync, callback) {
		return comAjax("POST", url, data, "json", "application/json", true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : getJSON</br>
     * 설  명 : ajax GET 통신, 데이터를 JSON형으로 주고 받음</br>
     * 사용법 : sorin.ajax.getJSON(url, data, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL (String)
     * @param data 보낼 JSON형 Data
     * @param isAsync boolean, true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	getJSON : function(url, data, isAsync, callback) {
		return comAjax("GET", url, data, "json", "application/json", true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : postSetContentType</br>
     * 설  명 : ajax POST 통신, 데이터를 지정한 형으로 보내고 JSON형으로 받음</br>
     * 사용법 : sorin.ajax.postSetContentType(url, data, contentType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL (String)
     * @param data 보낼 Data
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	postSetContentType : function(url, data, contentType, isAsync, callback) {
		return comAjax("POST", url, data, "json", contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : getSetContentType</br>
     * 설  명 : ajax GET 통신, 데이터를 지정한 형으로 보내고 JSON형으로 받음</br>
     * 사용법 : sorin.ajax.getSetContentType(url, data, contentType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL (String)
     * @param data 보낼 Data
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	getSetContentType : function(url, data, contentType, isAsync, callback) {
		return comAjax("GET", url, data, "json", contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : postSetDataType</br>
     * 설  명 : ajax POST 통신, 데이터를 JSON형으로 보내고 지정한 형으로 받음</br>
     * 사용법 : sorin.ajax.postSetDataType(url, data, dataType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL (String)
     * @param data 보낼 JSON형의 Data
     * @param dataType 받을 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	postSetDataType : function(url, data, dataType, isAsync, callback) { // dataType을 사용하지 않고 싶을경우 "" 공백으로
		return comAjax("POST", url, data, dataType, "application/json", true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : getSetDataType</br>
     * 설  명 : ajax GET 통신, 데이터를 JSON형으로 보내고 지정한 형으로 받음</br>
     * 사용법 : sorin.ajax.getSetDataType(url, data, dataType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL 문자열
     * @param data 보낼 JSON 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	getSetDataType : function(url, data, dataType, isAsync, callback) {
		return comAjax("GET", url, data, dataType, "application/json", true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : postSetAllType</br>
     * 설  명 : ajax POST 통신, 데이터를 원하는 형식으로 보내고 받음</br>
     * 사용법 : sorin.ajax.postSetDataType(url, data, dataType, contentType, isAsync, callbackㅍ)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	postSetAllType : function(url, data, dataType, contentType, isAsync, callback) { // contentType을 사용하지 않고 싶을경우 "" 공백으로
		return comAjax("POST", url, data, dataType, contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : postSetAllType</br>
     * 설  명 : ajax POST 통신, 데이터를 원하는 형식으로 보내고 받음(pageMove 전용)</br>
     * 사용법 : sorin.ajax.postSetDataType(url, data, dataType, contentType, isAsync, callbackㅍ)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	postSetAllTypeForPageMove : function(url, data, dataType, contentType, isAsync, callback) { // contentType을 사용하지 않고 싶을경우 "" 공백으로
		sorin.loading.start();
		return comAjaxForPageMove("POST", url, data, dataType, contentType, true, isAsync, callback)
			.then(function () {
			sorin.loading.stop();
		})
		.catch(function () {
			sorin.loading.stop();
		});
//		return comAjaxForPageMove("POST", url, data, dataType, contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : getSetAllType</br>
     * 설  명 : ajax GET 통신, 데이터를 원하는 형식으로 보내고 받음</br>
     * 사용법 : sorin.ajax.getSetAllType(url, data, dataType, contentType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 6.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 6. Kown sun hyung - 생성
     * </pre>
     *
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	getSetAllType : function(url, data, dataType, contentType, isAsync, callback) {
		return comAjax("GET", url, data, dataType, contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : custom</br>
     * 설  명 : ajax 통신, 데이터를 원하는 형식으로 보내고 받음</br>
     * 사용법 : sorin.ajax.custom(type, url, data, dataType, contentType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 17.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 17. Kown sun hyung - 생성
     * </pre>
     *
	 * @param type ajax type
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	custom : function(type, url, data, dataType, contentType, isAsync, callback) {
		return comAjax(type, url, data, dataType, contentType, true, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : customProcessData</br>
     * 설  명 : ajax 통신, 데이터를 원하는 형식으로 보내고 받음</br>
     * 사용법 : sorin.ajax.customProcessData(type, url, data, dataType, contentType, processData, isAsync, callback)</br>
     * 작성일 : 2021. 9. 3.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 9. 3. Kown sun hyung - 생성
     * </pre>
     *
	 * @param type ajax type
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
	 * @param processData processData 설정 (Bollean)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	customProcessData : function(type, url, data, dataType, contentType, processData, isAsync, callback) {
		return comAjax(type, url, data, dataType, contentType, processData, isAsync, callback);
	},

	/**
     * <pre>
     * 함수명 : customErrorReturn</br>
     * 설  명 : ajax POST 통신, 데이터를 원하는 형식으로 보내고 받음(error return 값을 수정 가능하다)</br>
     * 사용법 : sorin.ajax.custom(type, url, data, dataType, contentType, isAsync, callback)</br>
     * 작성일 : 2021. 6. 17.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 7. 28. Kown sun hyung - 생성
     * </pre>
     *
	 * @param type ajax type
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
     */
	customErrorCallback : function(type, url, data, dataType, contentType, isAsync, callback, errorCallback) {
		return comAjaxCustomErrorCallback(type, url, data, dataType, contentType, isAsync, callback, errorCallback);
	},
	
	/**
     * <pre>
     * 함수명 : comAjaxCustomErrorCallbackNoException</br>
     * 설  명 : ajax POST 통신, 데이터를 원하는 형식으로 보내고 받음(errorException으로 에러팝업을 발생시키지 않고 error return후 직접 에러팝업처리를 위한 함수)</br>
     * 사용법 : sorin.ajax.comAjaxCustomErrorCallbackNoException(type, url, data, dataType, contentType, isAsync, callback, errorCallback)</br>
     * 작성일 : 2023. 10. 04.</br>
     * 작성자 : srec0067</br>
     * -------------------------------------</br>
     * 2023. 10. 04. srec0067 - 생성
     * </pre>
     *
	 * @param type ajax type
     * @param url URL 문자열
     * @param data 보낼 형식의 Data
     * @param dataType 받을 Data형 (String)
     * @param contentType 보낼 Data형 (String)
     * @param isAsync true:비동기, false:동기
     * @param callback success 값을 전달하는 callback function
	 * @param errorCallback error 값을 전달하는 callback function
     */
	comAjaxCustomErrorCallbackNoException : function(type, url, data, dataType, contentType, isAsync, callback, errorCallback) {
		return comAjaxCustomErrorCallbackNoException(type, url, data, dataType, contentType, isAsync, callback, errorCallback);
	}
}

function comAjax(_type, _url, _data, _dataType, _contentType, _processData, _isAsync, callback) {
	if(!sorin.validation.isEmpty(_type) && !sorin.validation.isEmpty(_url)) {
		//sorin.loading.start();
		$.ajax({
				type : _type,
				url : _url,
				data : _data,
				dataType : _dataType,
				contentType : _contentType,
				processData : _processData,
				async: _isAsync,
				success : function(data) {
					callback(data);
				},
				error : function(request, status, error) {
					errorException(request);
				}
		});
	}
}

function comAjaxForPageMove(_type, _url, _data, _dataType, _contentType, _processData, _isAsync, callback) {
	if(!sorin.validation.isEmpty(_type) && !sorin.validation.isEmpty(_url)) {
		return $.ajax({
				type : _type,
				url : _url,
				data : _data,
				dataType : _dataType,
				contentType : _contentType,
				processData : _processData,
				async: _isAsync,
				beforeSend: function (xhr) {
					if (null != _data){
		            	xhr.setRequestHeader("data",_data);
					}
		        },
				success : function(data) {
					callback(data);
				},
				error : function(request, status, error) {
					errorException(request);
				}
		});
	}
}

function comAjaxCustomErrorCallback(_type, _url, _data, _dataType, _contentType, _isAsync, callback, errorCallback) {
	if(!sorin.validation.isEmpty(_type) && !sorin.validation.isEmpty(_url)) {
		//sorin.loading.start();
		$.ajax({
				type : _type,
				url : _url,
				data : _data,
				dataType : _dataType,
				contentType : _contentType,
				async: _isAsync,
				success : function(data) {
					callback(data);
					//sorin.loading.stop();
				},
				error : function(request, status, error) {
					errorCallback();
					errorException(request);
					//sorin.loading.stop();
				}
		});
	}
}

function comAjaxCustomErrorCallbackNoException(_type, _url, _data, _dataType, _contentType, _isAsync, callback, errorCallback) {
	if(!sorin.validation.isEmpty(_type) && !sorin.validation.isEmpty(_url)) {
		$.ajax({
				type : _type,
				url : _url,
				data : _data,
				dataType : _dataType,
				contentType : _contentType,
				async: _isAsync,
				success : function(data) {
					callback(data);
				},
				error : function(request, status, error) {
					errorCallback(request);
				}
		});
	}
}

function errorException(request) {
	if(request.responseJSON != null) {
		var errorMsg = '';
		for(var i = 0; i < request.responseJSON.length; i++) {
			if(i > 0) {
				errorMsg += '\n' + request.responseJSON[i].defaultMessage;
			} else {
				errorMsg += request.responseJSON[i].defaultMessage;
			}
		}
		validAlertPopup(errorMsg);
	} else if (request.responseText != ""){
		validAlertPopup(request.responseText);
	} else {
		validAlertPopup("errorStatus : " + request.statusText + "\n" + request);
	}
}

function validAlertPopup(text) {
	if(typeof alertPopup != "undefined"){
		alertPopup(text, function(){
			return true;
		});
	} else {
		alert(text);
		return;
	}
}
///////////////////////////////      ajax 통신 끝      ///////////////////////////////




///////////////////////////////      validation 시작      ///////////////////////////////
sorin.validation = {

	/**
	 * <pre>
	 * 함수명 : isNumeric</br>
	 * 설  명 : 숫자인지 판단해 준다. (예: 1234, +123, -123, 1.234, 1,234)</br>
	 * 사용법 : sorin.validation.isNumeric(1234)</br>
	 * 작성일 : 2021. 6. 11.</br>
	 * 작성자 : Kwon sun hyung</br>
	 * -------------------------------------</br>
	 * 2021. 6. 11. Kown sun hyung - 생성
	 * </pre>
	 * @param num
	 * @returns {Boolean} 숫자 여부
	 */
	isNumeric : function(num){
		if (!sorin.validation.isNull(num)) {
			// 좌우 trim(공백제거)을 해준다.
			num = String(num).replace(/^\s+|\s+$/g, "");

			// 모든 10진수 (부호 있음, 자릿수구분기호 있음, 소수점 있음)
			var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;

			if( regex.test(num) ){
				num = num.replace(/,/g, "");
				return isNaN(num) ? false : true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	},

	/**
	 * <pre>
	 * 함수명 : isTell</br>
	 * 설  명 : 전화번호인지 판단해 준다. (예: 0212345678)</br>
	 * 사용법 : sorin.validation.isCellPhone('0212345678')</br>
	 * 작성일 : 2021. 6. 16.</br>
	 * 작성자 : Kwon sun hyung</br>
	 * -------------------------------------</br>
	 * 2021. 6. 16. Kown sun hyung - 생성
	 * </pre>
	 * @param num
	 * @returns {Boolean} 유효 여부
	 */
	isTell : function(num){
		if (!sorin.validation.isNull(num)) {
			var regex = /^\d{2,3}\d{3,4}\d{4}$/;
		 	return regex.test(num) ? true : false;
		} else {
			return false;
		}
	},

	/**
	 * <pre>
	 * 함수명 : isCellPhone</br>
	 * 설  명 : 휴대전화번호인지 판단해 준다. (예: 01012345678)</br>
	 * 사용법 : sorin.validation.isCellPhone('01012345678')</br>
	 * 작성일 : 2021. 6. 16.</br>
	 * 작성자 : Kwon sun hyung</br>
	 * -------------------------------------</br>
	 * 2021. 6. 16. Kown sun hyung - 생성
	 * </pre>
	 * @param num
	 * @returns {Boolean} 유효 여부
	 */
	isCellPhone : function(num){
		if (!sorin.validation.isNull(num)) {
			var regex = /^01[0-9]\d{3,4}\d{4}$/;
	 		return regex.test(num) ? true : false;
		} else {
			return false;
		}
	},

	/**
	 * <pre>
	 * 함수명 : isEmail</br>
	 * 설  명 : email인지 판단해 준다. (예: 'test@gmail.com')</br>
	 * 사용법 : sorin.validation.isEmail('test@gmail.com')</br>
	 * 작성일 : 2021. 6. 16.</br>
	 * 작성자 : Kwon sun hyung</br>
	 * -------------------------------------</br>
	 * 2021. 6. 16. Kown sun hyung - 생성
	 * </pre>
	 * @param str
	 * @returns {Boolean} 유효 여부
	 */
	isEmail : function(str){
		if (!sorin.validation.isNull(str)) {
			var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			return regex.test(str) ? true : false;
		} else {
			return false;
		}
	},

	/**
	 * <pre>
	 * 함수명 : is24Hour</br>
	 * 설  명 : 입력받은 인자가 24시간제인지 판단해 준다.</br>
	 * 사용법 : sorin.validation.is24Hour('18:30')</br>
	 * 작성일 : 2021. 6. 17.</br>
	 * 작성자 : Kwon sun hyung</br>
	 * -------------------------------------</br>
	 * 2021. 6. 17 Kown sun hyung - 생성
	 * </pre>
	 * @param time
	 * @returns {Boolean} 유효 여부
	 */
	is24Hour : function(time){
		if (!sorin.validation.isNull(time)) {
			var regex = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
			return regex.test(time) ? true : false;
		} else {
			return false;
		}
	},

	/**
     * <pre>
     * 함수명 : isValidLength</br>
     * 설  명 : 입력받은 인자가 허용 길이내 인지 확인</br>
     * 사용법 : sorin.validation.isValidLength(obj, leng)</br>
     * 작성일 : 2021. 6. 16.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 16. Kown sun hyung - 생성
     * </pre>
     *
     * @param obj 문자열
	 * @param leng 숫자
     * @return {Boolean} 허용 길이 여부
     */
	isValidLength : function(obj, leng) {
		return obj.toString().length <= leng ? true : false;
	},

	/**
     * <pre>
     * 함수명 : date</br>
     * 설  명 : 입력받은 문자열을 Date 형식으로 변환할 수 있는지(정상적인 날자 데이터인지) 여부 반환</br>
     * 사용법 : sorin.validation.isDate('20210611')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kown sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param str yyyymmdd 또는 yymmdd 형식의 문자열
     * @return {Boolean} 정상적인 날짜 데이터 여부
     */
    isDate : function(str) {
        // Checks for the following valid date formats:
        // Also separates date into month, day, and year variables
        var datePat = /^(\d{2}|\d{4})(\/|-)(\d{1,2})\2(\d{1,2})$/;

        var matchArray = str.match(datePat); // is the format ok?
        if (matchArray == null) {
            return false;
        }

        var year = matchArray[1];
        var month = matchArray[3]; // parse date into variables
        var day = matchArray[4];

        if (month < 1 || month > 12) { // check month range
            return false;
        }
        if (day < 1 || day > 31) {
            return false;
        }
        if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
            return false
        }
        if (month == 2) { // check for february 29th
            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));

            if (day > 29 || (day == 29 && !isleap)) {
                return false;
            }
        }
        return true; // date is valid
    },

	/**
     * <pre>
     * 함수명 : date</br>
     * 설  명 : 입력받은 문자열을 Date 형식으로 변환할 수 있는지(정상적인 날자 데이터인지) 여부 반환</br>
     * 사용법 : sorin.validation.isDate2('2021-06-11')</br>
     * 작성일 : 2021. 10. 15.</br>
     * 작성자 : Kown sun hyung</br>
     * -------------------------------------</br>
     * 2021. 10. 15. Kown sun hyung - 생성
     * </pre>
     *
     * @param str yyyy-mm-dd 형식의 문자열
     * @return {Boolean} 정상적인 날짜 데이터 여부
     */
	isDate2 : function(str){
		if (!sorin.validation.isNull(str)) {
			var regex = /^[1-3][0-9]\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
			return regex.test(str) ? true : false;
		} else {
			return false;
		}
	},

    /**
     * <pre>
     * 함수명 : isUndefined</br>
     * 설  명 : 입력받은 인자가 undefined 인지 여부 반환</br>
     * 사용법 : sorin.validation.isUndefined(obj)</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>

     * @param obj 문자열 또는 객체
     * @return {Boolean} undefined 여부
     *
     */
    isUndefined : function(obj) {
        return obj === undefined;
    },

    /**
     * <pre>
     * 함수명 : isNull</br>
     * 설  명 : 입력받은 인자가 null 인지 여부 반환</br>
     * 사용법 : sorin.validation.isNull(obj)</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param obj 문자열 또는 객체
     * @return {Boolean} null 여부
     */
    isNull : function(obj) {
        return obj === null;
    },

    /**
     * <pre>
     * 함수명 : isEmpty</br>
     * 설  명 : 입력받은 인자가 비었는지 여부 반환</br>
     * 사용법 : sorin.validation.isEmpty(obj)</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param obj 문자열 또는 객체
     * @return {Boolean} 빈 값 여부
     */
    isEmpty : function(obj) {
        return sorin.validation.isUndefined(obj) || sorin.validation.isNull(obj) || obj === '' || obj === 'null'
                || obj.length === 0;
    },

    /**
     * <pre>
     * 함수명 : isEmpty</br>
     * 설  명 : 입력받은 문자열에서 이모지 제거</br>
     * 사용법 : sorin.validation.isEmoji(obj)</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 12. 13. srec0031 - 생성
     * </pre>
     *
     * @param newVal 신규 문자열
     * @param oldVal 이전 문자열
     * @return 이모지가 제거된 문자열
     */
	isEmoji : function(newVal, oldVal){
		var regex = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
		//var result = str.replace(regex, "");
		var isEmoji = regex.test(newVal);
		//이모지 포함되었을때
		if(isEmoji == true) {
			return oldVal;
		}
		return newVal;
	},
}
///////////////////////////////      validation 끝      ///////////////////////////////




///////////////////////////////      mask 시작      ///////////////////////////////
sorin.mask = {
    /**
     * <pre>
     * 함수명 : numeric</br>
     * 설  명 : numeric 클래스를 가진 엘리먼트에 숫자 마스크 세팅</br>
     * 사용법 :</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    numeric : function() {
        $(".numeric").css("ime-mode", "disabled") // 한글입력 X
        .mask("#0", {
            reverse : true,
            maxlength : false
        });
    },

    /**
     * <pre>
     * 함수명 : decimal</br>
     * 설  명 : decimal 클래스를 가진 엘리먼트에 정부 마스크 세팅</br>
     * 사용법 :</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    decimal : function() {
        $(".decimal").css("ime-mode", "disabled") // 한글입력 X
        .autoNumeric("init", {
            aSep : ',',
            aDec : '.',
            vMax : '9999999999999.9',
            vMin : '-9999999999999.9'
        });
    },
    /**
     * <pre>
     * 함수명 : phoneNumber</br>
     * 설  명 : phoneNumber 클래스를 가진 엘리먼트에 전화번호 마스크 세팅</br>
     * 사용법 :</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    phoneNumber : function() {
        var phoneMask = function(val) {
            var mask = "000-000-00000";
            var value = val.replace(/\D/g, '');

            if (value.length > 2) {
                if (value.substring(0, 2) == "02") {
                    mask = "00-000-00000";
                    if (value.length == 10) {
                        mask = "00-0000-0000"
                    }
                } else {
                    if (value.length == 11) {
                        mask = "000-0000-0000"
                    }
                }
            }

            return mask;
        };

        var option = {
            onKeyPress : function(val, e, field, options) {
                field.mask(phoneMask.apply({}, arguments), options);
            },
            onComplete : function(val, e, field, options) {
                var mask = "000-000-00000";
                var value = val.replace(/\D/g, '');
                if (value.substring(0, 2) == "02") {
                    mask = "00-000-00000";
                    if (value.length == 10) {
                        mask = "00-0000-0000"
                    }
                } else {
                    if (value.length == 11) {
                        mask = "000-0000-0000"
                    }
                }
                field.mask(mask, options);
            }
        };

        $('.phoneNumber').mask(phoneMask, option);
    },
    /**
     * <pre>
     * 함수명 : comma</br>
     * 설  명 : comma 클래스를 가진 엘리먼트를 숫자(콤마) 형식의 마스크를 세팅</br>
     * 사용법 :</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    comma : function() {
        $('.comma').mask("#,##0", {
            reverse : true,
            maxlength : false
        });
    },
    /**
     * <pre>
     * 함수명 : commaAndFixed</br>
     * 설  명 : commaAndFixed 클래스를 가진 엘리먼트를 숫자(콤마&소수점) 형식의 마스크를 세팅</br>
     * 사용법 : sorin.mask.commaAndFixed</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    commaAndFixed : function(data) {
        return data.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
};
///////////////////////////////      mask 끝      ///////////////////////////////




///////////////////////////////      common 시작      ///////////////////////////////
sorin.common = {



};
///////////////////////////////      common 끝      ///////////////////////////////




///////////////////////////////      loading 시작      ///////////////////////////////
sorin.loading = {
    /**
     * <pre>
     * 함수명 : start</br>
     * 설  명 : 화면 전체에 로딩 중 처리</br>
     * 사용법 : loading.start()</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    start : function() {
        $.blockUI({
            // message : '<img src="../images/ajax-loader-white.gif" alt="Loading..." />'
            message :
                    '<div class="wrapper">' +
                        '<div class="loading-wrap active">' +
                            '<div class="dimmer"></div>' +
                            '<div class="ispinner ispinner-large">' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                            '</div>' +
                        '</div>' +
                    '</div>',
            css : {
                backgroundColor : 'rgba(0,0,0,0.0)',
                color : '#000000',
                border : '0px solid #a00'
            }
        });
    },

    /**
     * <pre>
     * 함수명 : stop</br>
     * 설  명 : 화면 전체의 로딩 중 처리 해제</br>
     * 사용법 : loading.stop()</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     */
    stop : function() {
        $.unblockUI();
    },

    startModal : function() {
        $('.modal-content').block({
            // message : '<img src="../images/ajax-loader-white.gif" alt="Loading..." />'
            message :
                    '<div class="wrapper">' +
                        '<div class="loading-wrap active">' +
                            '<div class="dimmer"></div>' +
                            '<div class="ispinner ispinner-large">' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                                '<div class="ispinner-blade"></div>' +
                            '</div>' +
                        '</div>' +
                    '</div>',
            css : {
                backgroundColor : 'rgba(0,0,0,0.0)',
                color : '#000000',
                border : '0px solid #a00'
            }
        });
    },

    stopModal : function() {
        $('.modal-content').unblock();
    }
};
///////////////////////////////      loading 끝      ///////////////////////////////




///////////////////////////////      formatter 시작      ///////////////////////////////
sorin.formatter = {
    /**
     * <pre>
     * 함수명 : tel</br>
     * 설  명 : 전화번호 포멧 변경(0212345678 -> 02-1234-5678)</br>
     * 사용법 : sorin.formatter.tel('0212345678')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param tel 전화번호
     * @return {String} 포메팅된 전화번호 또는 ""
     */
    tel : function(tel) {
        if (!sorin.validation.isNull(tel)) {
            return tel.replace(/(^02|0[0-9]{2})([0-9]{3,4})([0-9]{4})/, "$1-$2-$3");
        } else {
            return "";
        }
    },

	/**
     * <pre>
     * 함수명 : phone</br>
     * 설  명 :  포멧 변경(01012345678 -> 010-1234-5678)</br>
     * 사용법 : sorin.formatter.cellPhone('01012345678')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param phone 전화번호
     * @return {String} 포메팅된 전화번호 또는 ""
     */
    cellPhone : function(phone) {
        if (!sorin.validation.isNull(phone)) {
            return phone.replace(/(^01[0-9])([0-9]{3,4})([0-9]{4})/, "$1-$2-$3");
        } else {
            return "";
        }
    },

    /**
     * <pre>
     * 함수명 : post</br>
     * 설  명 : 구우편번호 포멧 변경(123456 -> 123-456)</br>
     * 사용법 : sorin.formatter.post('123456')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param no 구우편번호(6자리)
     * @return {String} 포매팅된 구우편번호 또는 ""
     */
    post : function(no) {
        if (!sorin.validation.isNull(no)) {
            return no.replace(/([0-9]{3})([0-9]{3})/, "$1-$2");
        } else {
            return "";
        }
    },

    /**
     * <pre>
     * 함수명 : bizNo</br>
     * 설  명 : 사업자번호 포멧 변경(1234567890 -> 123-45-67890)</br>
     * 사용법 : sorin.formatter.bizNo('1234567890')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param no 사업자번호
     * @return {String} 포매팅된 사업자번호 또는 ""
     */
    bizNo : function(no) {
        if (!sorin.validation.isNull(no)) {
            return no.replace(/([0-9]{3})([0-9]{2})([0-9]{5})/, "$1-$2-$3");
        } else {
            return "";
        }
    },

    /**
     * <pre>
     * 함수명 : cprNo</br>
     * 설  명 : 주민번호 포멧 변경(1234561234567 -> 123456-1234567)</br>
     * 사용법 : sorin.formatter.cprNo('1234561234567')</br>
     * 작성일 : 2021. 6. 11.</br>
     * 작성자 : Kwon sun hyung</br>
     * -------------------------------------</br>
     * 2021. 6. 11. Kown sun hyung - 생성
     * </pre>
     *
     * @param no 주민번호
     * @return {String} 포매팅된 주민번호 또는 ""
     */
    cprNo : function(no) {
        if (!sorin.validation.isNull(no)) {
            return no.replace(/([0-9]{6})([0-9]{7})/, "$1-$2");
        } else {
            return "";
        }
    }
};
///////////////////////////////      formatter 끝      ///////////////////////////////

///////////////////////////////      account 시작      ///////////////////////////////

sorin.account = {
	/**
	 * <pre>
	 * 함수명 : getUserInfo</br>
	 * 설  명 : 유저 정보를 가져온다</br>
	 * 사용법 : getUserInfo()</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 *
	 * @return {JSON} 유저(Account) 정보
	 */
	getUserInfo : function() {
	    if(sorinAccount == "" || sorinAccount == null) {
	        sorin.ajax.postSetDataType("/Common/getUserInfo", "" , "", false, data => sorinAccount = data)
	    }
	    return sorinAccount;
	},


	/**
	 * <pre>
	 * 함수명 : getUserName</br>
	 * 설  명 : 유저 이름를 가져온다</br>
	 * 사용법 : getUserName()</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 * * @return {String} 유저 이름
	 */
	getUserName : function() {
	    if(sorinAccount == "" || sorinAccount == null) {
	        sorin.account.getUserInfo();
	    }
	    return (sorinAccount == null || sorinAccount == "") ? null : sorinAccount.name;
	},

	/**
	 * <pre>
	 * 함수명 : getUserEmail</br>
	 * 설  명 : 유저 이메일을 가져온다</br>
	 * 사용법 : getUserEmail()</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 * * @return {String} 유저 이메일
	 */
	getUserEmail : function() {
	    if(sorinAccount == "" || sorinAccount == null) {
	        sorin.account.getUserInfo();
	    }
	    return (sorinAccount == null || sorinAccount == "") ? null : sorinAccount.email;
	},

	/**
	 * <pre>
	 * 함수명 : refreshUserInfo</br>
	 * 설  명 : 유저 정보를 새로 조회한다.(회원정보 변경시등)</br>
	 * 사용법 : refreshUserInfo()</br>
	 * 작성일 : 2021. 9. 08.</br>
	 * 작성자 : srec0012</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 * * @return {String} 유저 이메일
	 */
	refreshUserInfo : function(){
		sorinAccount = null;
		 sorin.account.getUserInfo();
	}
};

//var sorinAccount = sorin.account.getUserInfo();  //"";

///////////////////////////////      account 끝      ///////////////////////////////

///////////////////////////////      bdAccount 시작      ///////////////////////////////

sorin.bdAccount = {
    /**
     * <pre>
     * 함수명 : getBdUserInfo</br>
     * 설  명 : 구매입찰 유저 정보를 가져온다</br>
     * 사용법 : getBdUserInfo()</br>
     * 작성일 : 2023. 8. 25.</br>
     * 작성자 : srec0077</br>
     * -------------------------------------</br>
     * </pre>
     *
     * @return {JSON} 유저(bdAccount) 정보
     */
    getBdUserInfo : function() {
        if(sorinBdAccount == "" || sorinBdAccount == null) {
            sorin.ajax.postSetDataType("/Common/getBdUserInfo", "" , "", false, data => sorinBdAccount = data)
        }
        return sorinBdAccount;
    },


    /**
     * <pre>
     * 함수명 : getEntrpsNm</br>
     * 설  명 : 업체명을 가져온다</br>
     * 사용법 : getEntrpsNm()</br>
     * 작성일 : 2023. 8. 25.</br>
     * 작성자 : srec0077</br>
     * -------------------------------------</br>
     * </pre>
     * * @return {String} 업체명
     */
    getEntrpsNm : function() {
        if(sorinBdAccount == "" || sorinBdAccount == null) {
            sorin.bdAccount.getBdUserInfo();
        }
        return (sorinBdAccount == null || sorinBdAccount == "") ? null : sorinBdAccount.entrpsNm;
    },

    /**
     * <pre>
     * 함수명 : refreshUserInfo</br>
     * 설  명 : 구매입찰 유저 정보를 새로 조회한다.(회원정보 변경시등)</br>
     * 사용법 : refreshUserInfo()</br>
     * 작성일 : 2021. 9. 08.</br>
     * 작성자 : srec0012</br>
     * -------------------------------------</br>
     * 2021. 8. 05. srec0041 - 생성
     * </pre>
     * * @return {String} 유저 이메일
     */
    refreshUserInfo : function(){
        sorinBdAccount = null;
         sorin.bdAccount.getBdUserInfo();
    }
};

///////////////////////////////      bdAccount 끝      ///////////////////////////////

///////////////////////////////      commCode 시작      ///////////////////////////////

sorin.commCode = {
	/**
	 * <pre>
	 * 함수명 : getMainCodes</br>
	 * 설  명 : 공통코드 메인코드 목록을 가져온다</br>
	 * 사용법 : getMainCodes()</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 *
	 * @return {JSON} 메인코드 : 서브코드
	 */
	getMainCodes : function() {
	    var result = "";
	    sorin.ajax.postSetAllType("/Common/getMainCodes", '','', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = data)
	    return result;
	},

	/**
	 * <pre>
	 * 함수명 : getSubCodes</br>
	 * 설  명 : 공통코드 서브코드 목록을 가져온다</br>
	 * 사용법 : getSubCodes(mainCode)</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 *
	 * @param - mainCode
	 * @return {JSON} 서브코드 : 값
	 */
	getSubCodes : function(mainCode) {
	    var result = "";
	    sorin.ajax.postSetAllType("/Common/getSubCodes", {
	        'mainCode': mainCode
	    },'json', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = data)
	    return result;
	},

	/**
	 * <pre>
	 * 함수명 : getCodeValue</br>
	 * 설  명 : 공통코드 값(codeValue)을 가져온다</br>
	 * 사용법 : getCodeValue(mainCode, subCode)</br>
	 * 작성일 : 2021. 8. 05.</br>
	 * 작성자 : srec0041</br>
	 * -------------------------------------</br>
	 * 2021. 8. 05. srec0041 - 생성
	 * </pre>
	 *
	 * @param - mainCode 메인코드
	 * @param - subCode 서브코드
	 * @return {String} 값
	 */
	getCodeValue : function(mainCode, subCode) {
	    var result = "";
	    sorin.ajax.postSetAllType("/Common/getCodeValue", {
	        'mainCode': mainCode,
	        'subCode': subCode
	    }, 'html', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = data)
	    return result;
	},

	/**
	* 설명 : 공통코드 서브코드 목록을 CommonCodeVO 반환으로 변경한 메소드
	* @return Object
	*/
	getSubCodesRetVo: function(mainCode) {
		var result = {};
	    sorin.ajax.postSetAllType("/Common/getSubCodesRetVo", {
	        'mainCode': mainCode
	    }, 'html', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = JSON.parse(data))
	    return result;
	},

	/**
	* 설명 : 공통코드 서브코드를 CommonCodeVO 반환으로 변경한 메소드
	* @return Object
	*/
	getSubCodesRetVo: function(mainCode, subCode) {
		var result = {};
	    sorin.ajax.postSetAllType("/Common/getSubCodesRetVo", {
	        'mainCode': mainCode,
	        'subCode': subCode
	    }, 'html', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = JSON.parse(data))
	    return result;
	},
	
	/**
	 * <pre>
	 * 함수명 : getFilterCode</br>
	 * 설  명 : 공통코드 필터처리한 서브코드 목록을 가져온다</br>
	 * 사용법 : getSubCodes(mainCode)</br>
	 * 작성일 : 2023. 11. 10.</br>
	 * 작성자 : srec0067</br>
	 * -------------------------------------</br>
	 * 2021. 11. 10. srec0067 - 생성
	 * </pre>
	 *
	 * @param - mainCode
	 * @return {JSON} 서브코드 : 값
	 */
	getFilterCode : function(mainCode, subCode, columKey, columnValue) {
	    var result = "";
	    sorin.ajax.postSetAllType("/Common/getFilterCode", {
	        'mainCode': mainCode,
	        'subCode': subCode,
	        'columKey': columKey,
	        'columnValue': columnValue
	    },'json', 'application/x-www-form-urlencoded; charset=UTF-8', false, data => result = data)
	    return result;
	}
}

///////////////////////////////      commCode 끝      ///////////////////////////////


///////////////////////////////      paging 시작      ///////////////////////////////

sorin.paging = {
	set : function(pageIndex, pageSize, rowCountPerPage, totalRowCount
					, firstTagClass, prevTagClass, nextTagClass, lastTagClass, tagClass
					, clickEvent) {

	    let remainder = 0;
		if((totalRowCount % rowCountPerPage) > 0) {
			remainder = 1;
		}

		let totalPage = Math.floor((totalRowCount / rowCountPerPage) + remainder);
		let showFirstPage = Math.floor(pageIndex / pageSize);

		if((pageIndex % pageSize) == 0) {
			showFirstPage = Math.floor(pageIndex / pageSize) - 1;
		}

		if(showFirstPage < 1) {
			showFirstPage = 1;
		} else {
			showFirstPage = (showFirstPage * pageSize) + 1;
		}

		let showLastPage = showFirstPage + (pageSize - 1);

		if(totalPage <= pageSize) {
			showLastPage = totalPage;
		}

		if(totalPage < showLastPage) {
			showLastPage = totalPage;
		}

		let prevIndex = pageIndex - 1;
		let nextIndex = pageIndex + 1;

		if(prevIndex < 1) {
			prevIndex = 1;
		}

		if(nextIndex >= totalPage) {
			nextIndex = totalPage;
		}

		let appendHtml = "";
		for(let i = showFirstPage; i <= showLastPage; i++){
			if(pageIndex == i) {
				appendHtml += '<strong aria-label="현재 페이지">' + i + '</strong>';
			} else {
				appendHtml += '<a href="javascript:;" class="'+tagClass+'" onclick="javascript:'+clickEvent+'(' + i + ',' + pageSize + ',' + rowCountPerPage + ',' + totalRowCount + ')"' + '>' + i + '</a>';
			}
		}

		let result = '<a href="javascript:;" class="'+firstTagClass+'" aria-label="첫 페이지" onclick="javascript:'+clickEvent
												+'(1,' + pageSize + ',' + rowCountPerPage + ',' + totalRowCount + ')"' + '></a>'

			        + '<a href="javascript:;" class="'+prevTagClass+'" aria-label="이전 페이지" onclick="javascript:'+clickEvent
												+'(' + prevIndex + ',' + pageSize + ',' + rowCountPerPage + ',' + totalRowCount + ')"' + '></a>'

			        + appendHtml

			        + '<a href="javascript:;" class="'+nextTagClass+'" aria-label="다음 페이지" onclick="javascript:'+clickEvent
												+'(' + nextIndex + ',' + pageSize + ',' + rowCountPerPage + ',' + totalRowCount + ')"' + '></a>'

			        + '<a href="javascript:;" class="'+lastTagClass+'" aria-label="마지막 페이지" onclick="javascript:'+clickEvent
												+'(' + totalPage + ',' + pageSize + ',' + rowCountPerPage + ',' + totalRowCount + ')"' + '></a>';


	    return result;
	}
}


///////////////////////////////      paging 끝     ///////////////////////////////
///////////////////////////////  Input KeyEvent ////////////////////////////////////
sorin.keyevent ={
	numberKeyup : function(event,type) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
	        return;
	    else{
	    	if (typeof type == 'undefined' || type=="normal"){
	    		event.target.value = sorin.keyevent.comma(event.target.value.replace(/[^-\.0-9]/g, ""));
	    	}
	    	else if(type == 'tel'){
	    		console.log("numberKeyup:"+event.target.value);
	    		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	    	}
	    	else if(type == 'bizno'){
	    		var tmpStr = event.target.value.replace(/[^0-9]/g, "");
	    		if (tmpStr.length>5){
	    			tmpStr = tmpStr.substring(0,10);
	    			event.target.value  = tmpStr.replace(/(\d{3})(\d{2})(\d{1,5})/,"$1-$2-$3")
	    		}
	    		else if (tmpStr.length>3){
	    			event.target.value  = tmpStr.replace(/(\d{3})(\d{1,2})/,"$1-$2")
	    		}
	    		else{
	    			event.target.value = tmpStr;
	    		}
	    	}
	    }
	},

	numberKeyDown : function(field,type) {
		if (typeof type == 'undefined' || type=='normal'){
			field.value = sorin.keyevent.comma(field.value);
		}
		else if(type == 'tel'){
			field.value = field.value.replace(/[^0-9]/g, "");
		}
		else if(type == 'bizno'){
			var tmpStr = field.value.replace(/[^0-9]/g, "");
			if (tmpStr.length>5){
				tmpStr = tmpStr.substring(0,10);
				field.value  = tmpStr.replace(/(\d{3})(\d{2})(\d{1,5})/,"$1-$2-$3")
			}
			else if (tmpStr.length>3){
				field.value  = tmpStr.replace(/(\d{3})(\d{1,2})/,"$1-$2")
			}
			else{
				field.value = tmpStr;
			}
		}
	},

	comma : function(obj) {
	    var regx = new RegExp(/(-?\d+)(\d{3})/);
	    var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
	    var strArr = obj.split('.');
	    while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
	        //정수 부분에만 콤마 달기
	        strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
	    }
	    if (bExists > -1) {
	        //. 소수점 문자열이 발견되지 않을 경우 -1 반환
	        obj = strArr[0] + "." + strArr[1];
	    } else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환
	        obj = strArr[0];
	    }
	    return obj;//문자열 반환
	}
}
///////////////////////////////  Input KeyEvent  끝 ////////////////////////////////

///////////////////////////////  Timer timeformat ////////////////////////////////////
sorin.timer = {
	/**
	 * <pre>
	 * 함수명 : timeFormat</br>
	 * 설  명 : 초 형태의 시간을 DD:HH:mm:ss 형태로 반환한다.</br>
	 * 사용법 : timeFormat(secondTerm)</br>
	 * 작성일 : 2021. 12. 15.</br>
	 * 작성자 : srec0042</br>
	 * -------------------------------------</br>
	 * 2021. 12. 15. srec0042 - 생성
	 * </pre>
	 *
	 * @param - secondTerm 초 형태의 시간
	 * @return {String} DD일 HH:mm:ss 형태
	 */
	timeFormat : function(secondTerm) {
		var days = Math.floor(secondTerm / (3600*24)); // 일
		var hours = Math.floor(secondTerm % (3600*24) / 3600); // 시간
		var minutes = Math.floor(secondTerm % 3600 / 60); // 분
		var seconds = Math.floor(secondTerm % 60); // 초

		var leftTime = ""; // 남은 시간

		days = days <= 0 ? "" : days+"일 ";
	    hours = hours < 10 ? "0"+hours : hours;
	    minutes = minutes < 10 ? "0"+minutes : minutes;
	    seconds = seconds < 10 ? "0"+seconds : seconds;

		leftTime = days+hours+":"+minutes+":"+seconds;

		return leftTime;
	}
}
///////////////////////////////  Timer timeformat 끝 ///////////////////////////////////


///////////////////////////////  Local time ////////////////////////////////////

sorin.localtime = {
	/**
	 * <pre>
	 * 함수명 : localTimeFormat</br>
	 * 설  명 : 초 형태의 시간을 HH:mm:ss 형태로 반환한다.</br>
	 * 사용법 : timeFormat(secondTerm)</br>
	 * 작성일 : 2022. 03. 25.</br>
	 * 작성자 : heehoonc</br>
	 * -------------------------------------</br>
	 * 2022. 03. 25. heehoonc - 생성
	 * </pre>
	 *
	 * @param - 변환할 시간 형식 (추후추가시)
	 * @return {String}

	 	호출 형태
		setInterval(sorin.localtime.localTimeFormat,1000);
	 */
	localTimeFormat : function() {

		let realTime = new Date();

    	let hour = realTime.getHours();
    	let minute = realTime.getMinutes();
    	let second = realTime.getSeconds();

    	if(hour<10){
    		hour = "0" + hour;
    	}

    	if(minute<10){
    		minute = "0" + minute;
	    }

	    if(second<10){
	    	second = "0" + second;
	    }

		return hour+":"+minute+":"+second

	
	},
	
	/**
	 * <pre>
	 * 함수명 : timeFormat</br>
	 * 설  명 : 초 형태의 시간을 (오전/오후)DD:HH:mm:ss 형태로 반환한다.</br>
	 * 사용법 : timeFormat(secondTerm)</br>
	 * 작성일 : 2023. 02. 06.</br>
	 * 작성자 : sumin95</br>
	 * -------------------------------------</br>
	 * 2023. 02. 06. sumin95 - 생성
	 * </pre>
	 *
	 * @param - secondTerm 초 형태의 시간
	 * @return {String} (오전/오후) HH:mm:ss 형태
	 */
	 
	ampmTimeFormat : function() {
		
		let realTime = new Date();

		let hour = realTime.getHours();
		let minute = realTime.getMinutes();
		let second = realTime.getSeconds();

		let divHours = "";
		let fullTime = "";
		
		divHours = hour < 12 ? "오전" : "오후";
		hour = hour >= 12 ? hour-12 : hour;
		
		if(hour == 0){
			hour = 12;		
		} else if(hour < 10){
			hour = "0" + hour;
		}

		if(minute < 10){
			minute = "0" + minute;
		}

		if(second < 10){
			second = "0" + second;
		}
		
		
		fullTime = divHours +" "+ hour+":"+minute+":"+second;
		
		return fullTime;
		}	
}


///////////////////////////////  Local time 끝 /////////////////////////////////

sorin.chart = {
	loginYn : "",					//로그인구분
	subscriberURI : "",				//헤더타이머소켓
	subscriberStartLmeURI : "",		//시초가수신 웹소켓
	subscriberRestTimeURI : "",		//LME 수신 오류 웹소켓
	subscriberSpreadURI : "",		//LME 스프레드 변동분 오류 웹소켓
	subscriberFxURI : "",			//환율 웹소켓 Uri
	subscriberFxpcKRWURI : "",		//환율 상세 웹소켓 Uri
	subscriberSelpcAllURI : "",		//전체 메탈 판매가격 웹소켓
	metalCodeListProperty : "",		//메탈코드목록
	
	pageMetal : "",					//선택된 메탈코드
	pageSleMthd: "",				//선택된 판매방식코드
	
	headerRestdeAt : "",			//영업시간 여부
	headerRestDeLive : "",			//실시간 영업 여부
	headerRestDeFixed : "",			//고정가 영업 여부
	headerSideCarMetalCode : "",	//사이드카 발동 금속 코드
	headerMotnAt : "",				//사이드카 발동 여부
	
	type : "", 						//차트타입(1분,30분,60분,일,월)
	metalCode : "", 				//금속코드
	itmSn : "", 					//아이템순번
	dstrctLclsfCode : "", 			//권역코드
	brandGroupCode : "", 			//브랜드그룹코드
	brandCode : "",					//브랜드코드
	sleMthdCode : "",				//판매방식코드
	metalClCode : "",				//금속분류코드
	metalNm : "",					//금속코드명
	realTime  : new Map(),			//실시간소켓종가정보
	currentList  : new Map(),		//차트이전봉데이터정보
	chartTitleInfo : new Map(), 	//차트타이틀영역 가격정보
	liveList : {},					//라이브메탈별정보
	restdeInfoList : {},			//메탈별 운영/휴일정보
	selPcChartList : {},			//차트영역 타이틀 및 서린시세가격정보
	rvcmpnVOList : {},				//조달청리스트
	avgDeEndPrice : {},				//기준매매가격
	prLmePblntfPcBasVO : {},		//LME 가격
	entrpsMetalItmStdr : {},		//업체 메탈권역브랜드 기준정보
	preminumSelInfoList : {},		//메탈별 권역브랜드그룹리스트
	chartSumTitleInfo : new Map(),	//전광판 내용 관리
	startLmeData : "",				//시초가수신전타겟 금속코드
	
	/** 
	* <pre>
	* 함수명 : 차트 전광판 설정</br>
	* 설  명 : 차트 전광판에 원하는 내용을 추가한다.</br>
	* 사용법 : sorin.chart.setChartSumTitle(type, content)</br>
	* 작성일 : 2023. 10. 19.</br>
	* 작성자 : srec0068</br>
	* -------------------------------------</br>
	* 2023. 10. 19. srec0068 - 생성
	* </pre>
	* 
	* @param - type 전광판 문구 종류
	* @return 
	*/
	setChartSumTitle : function(type, stTitle, edTitle, waitTerm) {
		if(sorin.validation.isEmpty(type) || sorin.validation.isEmpty($("#sumTitleWrap"))) {
		 	return;
	 	}

		if(sorin.validation.isEmpty(stTitle)) stTitle = "";
		if(sorin.validation.isEmpty(edTitle)) edTitle = "";
		if(sorin.validation.isEmpty(waitTerm)) waitTerm = "";

		//매개변수 정보를 통해 전광판 슬라이드 생성
		var newTitle = "";
		if(!sorin.validation.isEmpty(stTitle)) {
			newTitle = "<div class='swiper-slide " + type + "'><a href='#n' onclick='return false;'>" + stTitle;
			if(!sorin.validation.isEmpty(waitTerm)) {
				newTitle += " <span class='col-yellow'>-" + sorin.timer.timeFormat(waitTerm) + "</span> ";
			}
			newTitle += edTitle + "</a></div>";
		}
	
		//생성된 슬라이드에 따라 삽입/수정/삭제 수행
		var currTitle = sorin.chart.chartSumTitleInfo.get(type); 
		
		if(sorin.validation.isEmpty(newTitle)) { //전광판 슬라이드 삭제
			if($(".swiper-slide."+type).length > 0) {
				$.each($(".swiper-slide."+type), function (index, el) {
					sumTitleSwiper.removeSlide($(el).data("swiper-slide-index"));
				});
			}
		}else if(sorin.validation.isEmpty(currTitle) || sorin.validation.isEmpty($(".swiper-slide."+type))) { //슬라이드 추가
			sumTitleSwiper.appendSlide(newTitle);
		}else if(newTitle != currTitle) { //슬라이드 수정
			$(".swiper-slide."+type+">a").html($(newTitle).find("a").html());
		}
		sorin.chart.chartSumTitleInfo.set(type, newTitle);
		
		sumTitleSwiper.update();
	},
	
	/** 
	* <pre>
	* 함수명 : 차트 전광판 공지사항</br>
	* 설  명 : 차트 전광판에 공지사항을 추가한다.</br>
	* 사용법 : sorin.chart.setChartSumTitleNotice(noticeData)</br>
	* 작성일 : 2023. 10. 19.</br>
	* 작성자 : srec0068</br>
	* -------------------------------------</br>
	* 2023. 10. 19. srec0068 - 생성
	* </pre>
	* 
	* @param - noticeData 전광판에 추가할 공지사항 정보 리스트
	* @return 
	*/
	setChartSumTitleNotice : function(noticeData) {
		if(sorin.validation.isEmpty($("#sumTitleWrap"))) return;
		
		$(".swiper-slide.notice").remove();
		
		for(var notice of noticeData) {
			var div = $('<div class="swiper-slide notice"></div>');
			var a = $('<a href="#" onclick="return false;">'+notice.noticeSj+'</a>');
			a.attr('onclick', "pageMove('/fo/notice/noticeDtls',JSON.stringify({'noticeNo' : '"+ notice.noticeNo + "'}), 'application/json','csfaqcsfFaqViews')");
			div.append(a);
			sumTitleSwiper.appendSlide(div);
        }
		sumTitleSwiper.update(div);
	},
	
	/**
	* <pre>
	* 함수명 : 실시간 종가정보를 입력</br>
	* 설  명 : 현재시간기준 매칭 프리미엄가격정보의 실시간 종가정보를 입력한다.</br>
	* 사용법 : sorin.chart.setRealTime(premiumKey)</br>
	* 작성일 : 2023. 6. 8.</br>
	* 작성자 : srec0067</br>
	* -------------------------------------</br>
	* 2023. 6. 8. srec0067 - 생성
	* </pre>
	* 
	* @param - premiumKey 프리미엄종목키
	* @return {Object} 실시간종가정보 
	*/
	setRealTime : function(premiumKey, result, rtselTime) {
		let realTime = new Map();
			
		realTime.set('chartSelTime', rtselTime);
		realTime.set('endPc',  result.endPc);
		realTime.set('versusRate',  result.versusRate);

		sorin.chart.realTime.set(premiumKey,realTime);
	},
	
	/**
	* <pre>
	* 함수명 : 실시간 종가정보조회</br>
	* 설  명 : 현재시간기준 매칭 프리미엄가격정보의 실시간 종가정보를 조회한다.</br>
	* 사용법 : sorin.chart.getRealTime(premiumKey)</br>
	* 작성일 : 2023. 6. 8.</br>
	* 작성자 : srec0067</br>
	* -------------------------------------</br>
	* 2023. 6. 8. srec0067 - 생성
	* </pre>
	* 
	* @param - premiumKey 프리미엄종목키
	* @return {Object} 실시간종가정보 
	*/
	getRealTime : function(premiumKey) {
		let resultRealTime = new Map();
		let realTime = sorin.chart.realTime;
		
		if(realTime.size != 0) {
			if(!sorin.validation.isEmpty(realTime.get(premiumKey))) {
				resultRealTime.chartSelTime = realTime.get(premiumKey).get('chartSelTime');
				resultRealTime.endPc = realTime.get(premiumKey).get('endPc');
				resultRealTime.versusRate = realTime.get(premiumKey).get('versusRate');
			}
		}
		
		return resultRealTime;
	},
	
	/**
	* <pre>
	* 함수명 : 날짜포맷을 문자열로 전환시킨다.</br>
	* 설  명 : 문자열의 날짜데이터를 비교하기위해 날짜데이터를 년월일시분초의 문자열로 전환시킨다.</br>
	* 사용법 : sorin.chart.convertDateString(format)</br>
	* 작성일 : 2023. 6. 8.</br>
	* 작성자 : srec0067</br>
	* -------------------------------------</br>
	* 2023. 6. 8. srec0067 - 생성
	* </pre>
	* 
	* @param - format 날짜데이터(ex: new Date())
	* @return {year + month + date + hour + min + sec} 문자열 년월일시분초 
	*/
	convertDateString : function(format) {
		let year = format.getFullYear();
		
		let month = format.getMonth() + 1;
		if (month < 10) month = '0' + month;
		
		let date = format.getDate();
		if (date < 10) date = '0' + date;
		
		let hour = format.getHours();
		if (hour < 10) hour = '0' + hour;
		
		let min = format.getMinutes();
		if (min < 10) min = '0' + min;
		
		let sec = format.getSeconds();
		if (sec < 10) sec = '0' + sec;
		
		return year + month + date + hour + min + sec;
	},
	
	/**
	* <pre>
	* 함수명 : 날짜포맷을 문자열로 전환시킨다.</br>
	* 설  명 : 문자열의 날짜데이터를 비교하기위해 날짜데이터를 년월일시분초의 문자열로 전환시킨다.</br>
	* 사용법 : sorin.chart.date_to_str(format)</br>
	* 작성일 : 2023. 6. 8.</br>
	* 작성자 : srec0067</br>
	* -------------------------------------</br>
	* 2023. 6. 8. srec0067 - 생성
	* </pre>
	* 
	* @param - format 날짜데이터(ex: new Date())
	* @return {year + "/" + month + "/" + date + " " + hour + ":" + min + ":" + sec} 문자열 년/월/일/ 시:분:초 
	*/
	date_to_str : function(format) {
		var year = format.getFullYear();
		
		var month = format.getMonth() + 1;
		if (month < 10) month = '0' + month;
		
		var date = format.getDate();
		if (date < 10) date = '0' + date;
		
		var hour = format.getHours();
		if (hour < 10) hour = '0' + hour;
		
		var min = format.getMinutes();
		if (min < 10) min = '0' + min;
		
		var sec = format.getSeconds();
		if (sec < 10) sec = '0' + sec;
		
	    return year + "/" + month + "/" + date + " " + hour + ":" + min + ":" + sec;
	}
}

sorin.liveSearch = {
	srchItemList : {},					//상품검색 검색조건SELECT 아이템리스트
	srchDsLfList : {},				//상품검색 검색조건SELECT 권역리스트
	srchBdGpList : {},				//상품검색 검색조건SELECT 브랜드그룹리스트
	srchBrandList : {},					//상품검색 검색조건SELECT 브랜드리스트
	itemBrandList : {},					//상품검색 결과 아이템별 브랜드리스트
}