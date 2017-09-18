<%@Page Language="C#" ResponseEncoding="UTF-8"%>



<html>
   <head>
      <link rel="stylesheet" href="../i18n_styles.css">
   </head>

   <body>

    <h3>I18N: Encodings</h3>
    <div class="details">
    	This sample demonstrates using different encodings on the same page. 
	The source for the page itself is stored with UTF-8 encoding. Internally ASP.NET handles
	the page as Unicode. By using the ResponseEncoding attribute, ASP.NET
	is asked to send the page with UTF-8 encoding. 
    </div>

<hr>

       <center>

	<div class="details">
	This is an english text.
	</div>	

	<div class="details">
	Dies ist ein deutscher Text. Er demonstriert die 
	Möglichkeit von Umlauten.
	</div>	

	<div class="details">
	効果的にビジネスシーンの変化に適応できるかは、企業内部のデジタルによる情報プロセス、"デジタル･ナーバス･システム"がどれだけ健全であるかにかかっています。
	</div>	

	<div class="details" dir="rtl">
הכללים המופיעים ברשיונות השונים ואין בה כדי למצות את כל כללי הרישוי. השתדלנו לכלול את כללי הרישוי העיקריים, אשר לגביהם פנו אלינו 
	</div>	


       </center>

   </body>
</html>







