<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title></title>

<body>

	<div class="content-wrapper" style="min-height:90vh;">
	     <div class="iframeBox" style=" display:none; width:100%; height:100vh;">
			<iframe id="main_iframe" name="ifr" src="" frameborder="0" style="width:100%; height:100vh;">
			</iframe>
	     </div>
	</div>

	<script>

		function goPage(url,mCode) //아이프레임 결정자.
		{
			console.log('파라미터 삽입'+mCode);
			console.log('iframe 주소'+url);
			
			$('iframe[name="ifr"]').attr("src",url);
			$('iframe[name="ifr"]').on("load", function(){
				document.querySelector('.iframeBox').style.display="";
			});

			if(typeof(history.pushState)=='function')
			{
				//현재 주소를 가져온다.
				var renewURL=location.href;
				//현재 주소 중 .do의! 뒤 부분이 있다면 날려버린다. 쩜두까진 살리고 뒤를 자름.
				
				renewURL=renewURL.substring(0,renewURL.indexOf(".do")+3);

				if(mCode!='m1') //메인이 아니면
				{
					renewURL+="?mCode="+mCode;
				}
				
				//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용.
				history.pushState(mCode,null,renewURL); //변화없음.
			}
			else
			{
				location.hash="#"+mCode; //#뒤에를 value 취급한다.
			}
		}

		window.onload=function(){
			goPage('<%=request.getContextPath()%>/common/${mUrl}','${mCode}'); //프로토 타입이기 때문에 바로호출.
		}

	</script>

</body>