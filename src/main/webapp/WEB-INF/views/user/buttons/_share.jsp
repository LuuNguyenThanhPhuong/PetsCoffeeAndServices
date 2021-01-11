<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="sharing_button">
	<span><i class="fa fa-share-alt"></i></span>
	<div class="social-media">
		<a target="_blank"
			href="http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/tour/detail/${prod.maTour}"
			class="share-facebook" title="Chia sẻ lên Facebook"> <i
			class="fa fa-facebook"></i>
		</a> <a target="_blank"
			href="https://twitter.com/intent/tweet?text=WebsiteDuLichToanQuoc&url=http://localhost:8080/tour/detail/${prod.maTour}"
			class="share-twitter" title="Chia sẻ lên Twitter"> <i
			class="fa fa-twitter"></i>
		</a> <a target="_blank"
			href="http://pinterest.com/pin/create/button/?url=http://localhost:8080/tour/detail/${prod.maTour}&description=WebsiteDuLichToanQuoc&media=/static/image/tour/${prod.hinh}"
			class="share-google" title="+1"> <i class="fa fa-google"></i>
		</a>
	</div>
</div>

