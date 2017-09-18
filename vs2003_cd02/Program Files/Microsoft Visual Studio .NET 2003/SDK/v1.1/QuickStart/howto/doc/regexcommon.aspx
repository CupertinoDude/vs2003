<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/regularexpressionsheader.inc" -->

<h4>How Do I...Use common Regular Expressions?</h4>

There are a variety of tasks that regular expressions can be used
for in regards to input validation and file parsing.  Some of the most
common expressions are often hard to remember because of the power and
options available.  Here is a list of commonly used regular expressions:

<center>
  <table width="80%">
    <tr>
      <th align="center">Use</th>
      <th align="center">Expression</th>
    </tr>
    <tr>
      <td><b>Social Security Number</b></td>
      <td>\d{3}-\d{2}-\d{4}</td>
    </tr>
    <tr>
      <td><b>US Phone Number</b></td>
      <td>((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}</td>
    </tr>
    <tr>
      <td><b>US Postal Code</b></td>
      <td>\d{5}(-\d{4})?</td>
    </tr>
    <tr>
      <td><b>Internet EMail Address</b></td>
      <td>[\w-]+@([\w-]+\.)+[\w-]+</td>
    </tr>
    <tr>
      <td><b>Internet URL</b></td>
      <td>http://([\w-]\.)+[\w-](/[\w- ./?%=]*)?</td>
    </tr>
    <tr>
      <td><b>Simple Password (digit)</b></td>
      <td>^(?=.*\d).{4,8}$</td>
    </tr>
    <tr>
      <td><b>Advanced Password (upper, lower, digit)</b></td>
      <td>^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$</td>
    </tr>
    <tr>
      <td><b>Common File masks</b></td>
      <td>^(.+)\\(.+)\.(.+)</td>
    </tr>
    <tr>
      <td><b>Major          Credit Card</b></td>
      <td>\d{4}-?\d{4}-?\d{4}-?\d{4}</td>
    </tr>
  </table>
</center>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->