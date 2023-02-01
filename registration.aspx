<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="obama_site.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>

    function validate() {
        var engSt = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var hebSt = "אבגדהוזחטיכלמנסעפצקרשת";
        var badSt = "*#,;:{}/'><()";
        var numst = "0123456789";

        //שם פרטי
        //האם השם באורך שני תווים לפחות
        var fName = document.myform.fName.value;
        if (fName.length < 2) {
            document.myform.mFname.value = "הכנס שם פרטי";
            document.myform.mFname.style.display = "inline";
            return false;
        }
        else document.myform.mFname.style.display = "none";
        //האם השם מכיל רק אותיות בעברית
        for (i = 0; i < fName.length; i++) {
            var badChar = fName.charAt(i);
            if (!(badChar >= 'א' && badChar <= 'ת')) {
                document.myform.mFname.value = "הקלד רק אותיות בעברית";
                document.myform.mFname.style.display = "inline";
                return false;
            }
            else document.myform.mFname.style.display = "none";
        }
        //שם משפחה
        //האם השם מכיל שתי אותיות לפחות 
        var lName = document.myform.lName.value;
        if (lName.length < 2) {
            document.myform.mLname.value = "הכנס שם משפחה";
            document.myform.mLname.style.display = "inline";
            return false;
        }
        else document.myform.mLname.style.display = "none";

        //האם השם מכיל רק אותיות בעברית
        for (i = 0; i < lName.length; i++) {
            var badChar = lName.charAt(i);
            if (!(badChar >= 'א' && badChar <= 'ת')) {
                document.myform.mLname.value = "הקלד רק אותיות בעברית";
                document.myform.mLname.style.display = "inline";
                return false;
            }
            else document.myform.mLname.style.display = "none";
        }


        // שם משתמש
        var uname = document.myform.username.value;
        //האם השם מכיל שתי אותיות לפחות

        if (uname.length < 2) {
            document.myform.mUname.value = "הכנס שם משתמש";
            document.myform.mUname.style.display = "inline";
            return false;
        }
        else document.myform.mUname.style.display = "none";
        //האם שם משתמש מכיל רק אותיות באנגלית קטנות או גדולות
        for (i = 0; i < uname.length; i++) {
            var badChar = uname.charAt(i);
            if ((badChar >= 'a' && badChar <= 'z') || (badChar >= 'A' && badChar <= 'Z')) {
                document.myform.mUname.style.display = "none";
            }
            else {
                document.myform.mUname.value = "הקלד רק אותיות באנגלית";
                document.myform.mUname.style.display = "inline";
                return false;
            }
        }

        // סיסמה

        var password = document.myform.password1.value;
        //האם הסיסמה מכילה שש תווים לפחות
        if (password.length < 6) {
            document.myform.mPass1.value = "צריך שש תווים לפחות";
            document.myform.mPass1.style.display = "inline";
            return false;
        }
        else document.myform.mPass1.style.display = "none";

        //בדיקה האם קיימות אותיות באנגלית
        var charCounter = 0;
        for (i = 0; i < engSt.length; i++) {
            engChar = engSt.charAt(i);
            if (password.indexOf(engChar) != -1) {
                charCounter++;
            }
        }
        if (charCounter == 0) {
            document.myform.mPass1.value = "סיסמה חייבת להכיל אותיות באנגלית";
            document.myform.mPass1.style.display = "inline";
            return false;
        }
        else document.myform.mPass1.style.display = "none";
        //בדיקה האם קיימים מספרים

        var numCounter = 0;
        for (i = 0; i < numst.length; i++) {
            numm = numst.charAt(i);
            if (password.indexOf(numm) != -1) {
                numCounter++;
            }
        }
        if (numCounter == 0) {
            document.myform.mPass1.value = "סיסמה חייבת להכיל מספרים";
            document.myform.mPass1.style.display = "inline";
            return false;
        }
        else document.myform.mPass1.style.display = "none";

        //בדיקה האם יש רק אותיות או מספרים
        for (i = 0; i < password.length; i++) {
            var badChar = password.charAt(i);
            if ((badChar >= 'a' && badChar <= 'z') || (badChar >= 'A' && badChar <= 'Z') || (badChar >= '0' && badChar <= '9')) {
                document.myform.mPass1.style.display = "none";
            }
            else {
                document.myform.mPass1.value = "הקלד רק אותיות באנגלית ומספרים";
                document.myform.mPass1.style.display = "inline";
                return false;
            }
        }


        // אימות סיסמה
        var r_password = document.myform.password2.value;
        //בדירה האם השדה ריק

        if (r_password.length == 0) {
            document.myform.mPass2.value = "הכנס אימות סיסמא";
            document.myform.mPass2.style.display = "inline";
            return false;
        }
        else document.myform.mPass2.style.display = "none";

        // בדיקה האם הסיסמה ואימות סיסמה זהות

        if (password != r_password) {
            document.myform.mPass2.value = "הסיסמא והאימות סיסמא לא אותו דבר";
            document.myform.mPass2.style.display = "inline";
            return false;
        }
        else document.myform.mPass2.style.display = "none";





        //בדיקת טלפון
        var phone = document.myform.phone.value;

        //האם אורכו של המספר בין 9 ל 10 ספרות


        if (!(phone.length == 9 || phone.length == 10)) {
            document.myform.mPhone.value = "צריך או 9 או 10 ספרות";
            document.myform.mPhone.style.display = "inline";
            return false;
        }
        else document.myform.mPhone.style.display = "none";


        //בדיקה האם יש רק מספרים


        for (i = 0; i < phone.length; i++) {
            var badChar = phone.charAt(i);
            if (badChar >= '0' && badChar <= '9') {
                document.myform.mPhone.style.display = "none";
            }
            else {
                document.myform.mPhone.value = "הקלד רק מספרים";
                document.myform.mPhone.style.display = "inline";
                return false;
            }
        }


        //בדיקה האם מספר הטלפון מתחיל בספרה 0
        if ((phone.charAt(0) != '0')) {
            document.myform.mPhone.value = "המספר צריך להתחיל בספרה 0";
            document.myform.mPhone.style.display = "inline";
            return false;
        }
        else document.myform.mPhone.style.display = "none";





        // אימייל
        var email = document.myform.email.value;

        //האם אורכה של כתובת המייל לפחות 6 תווים

        if (email.length < 6) {
            document.myform.mMail.value = "צריך שש תווים לפחות";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";

        //האם קיים תו לא חוקי בכתובת המייל
        for (i = 0; i < badSt.length; i++) {
            badChar = badSt.charAt(i);
            if (email.indexOf(badChar) != -1) {
                document.myform.mMail.value = "קיים תו לא חוקי";
                document.myform.mMail.style.display = "inline";
                return false;
            }
            else document.myform.mMail.style.display = "none";
        }
        //האם קיימות אותיות בעברית בכתובת המייל

        var charCounter = 0;
        for (i = 0; i < engSt.length; i++) {
            engChar = engSt.charAt(i);
            if (email.indexOf(engChar) != -1) {
                charCounter++;
            }
        }
        if (charCounter == 0) {
            document.myform.mMail.value = "אימייל חייבת להכיל אותיות באנגלית";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";

        //האם כתובת המייל מתחילה במספר
        if ((email.charAt(0) >= '0' && email.charAt(0) <= '9')) {
            document.myform.mMail.value = "כתובת המייל אינה יכולה להתחיל במספר";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";
        //האם לא קיימת נקודה בכתובת המייל
        if (email.indexOf(".") == -1) {
            document.myform.mMail.value = "כתובת חייבת להכיל .";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";
        //האם לא קיים הסימן @ בכתובת המייל

        if (email.indexOf("@") == -1) {
            document.myform.mMail.value = "כתובת חייבת להכיל @";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";

        //האם הסימן @ מופיע כבר בשתי האותיות הראשונות
        if (email.indexOf("@") < 2) {
            document.myform.mMail.value = "@ לא יכול להיות בין 2 התווים הראשונים";
            document.myform.mMail.style.display = "inline";
            return false;
        }

        //האם קיימת נקודה בשתי התווים הראשונים

        if (email.indexOf(".") < 2) {
            document.myform.mMail.value = ". לא יכול להיות בין 2 התווים הראשונים";
            document.myform.mMail.style.display = "inline";
            return false;
        }

        //האם יש יותר מסימן @ אחד בכתובת
        if (email.split("@").length > 2) {
            document.myform.mMail.value = "כתובת דואר אלקטרוני לא יכולה להכיל יותר מ @ אחד";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";
        //האם קיימות יותר משתי נקודות בכתובת המייל

        if (email.split(".").length > 3) {
            document.myform.mMail.value = "כתובת דואר אלקטרוני לא יכולה להכיל יותר מ שתי נקודות";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";


        //האם יש לפחות שני תווים אחרי הנקודה האחרונה
        if (email.lastIndexOf(".") + 3 > email.length) {
            document.myform.mMail.value = "חייבים להיות לפחות שני תווים אחרי ה . האחרונה";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";
        //האם קיימים לפחות 4 תווים אחרי הסימן @

        if (email.lastIndexOf("@") + 5 > email.length) {
            document.myform.mMail.value = "חייבים להיות לפחות ארבע תווים אחרי ה @ האחרון";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";

        //האם קיימת נקודה לפני הסימן @
        if (email.indexOf("@") > email.indexOf(".")) {
            document.myform.mMail.value = "לא ניתן לשים . לפני @ ";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";
        //האם קיימים לפחות שני תווים בין הסימן @ לנקודה

        if (email.indexOf("@") + 3 > email.indexOf(".")) {
            document.myform.mMail.value = "צריך שתי תווים בין נקודה לשטרודל ";
            document.myform.mMail.style.display = "inline";
            return false;
        }
        else document.myform.mMail.style.display = "none";


        //אם יש שתי נקודות בכתובת האם יש לפחות שני תווים ביניהן

        if (email.split(".").length > 3) {

            if (email.indexOf(".") + 3 > email.lastIndexOf(".")) {
                document.myform.mMail.value = "צריך שתי תווים בין נקודה לנקודה ";
                document.myform.mMail.style.display = "inline";
                return false;
            }
        }
        else document.myform.mMail.style.display = "none";



        return true;

    }

</script>  
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <form onsubmit="return validate(  )" method="get" action="" name="myform" id="myform">
    <div class="mainDiv">
        <h1>הרשמה</h1>
    
    <br /><br />
        <table>
            <tr>
                <td><b>שם פרטי:</b></td>
                <td><input type="text" name="fName" /></td>
                <td><input type="text" class="label" name="mFname" id="mFName" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>שם משפחה:</b></td>
                <td><input type="text" name="lName" /></td>
                <td><input type="text" class="label" name="mLname" id="mLname" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>שם משתמש:</b></td>
                <td><input type="text" name="username" /></td>
                <td><input type="text" class="label" name="mUname" id="mUname" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>סיסמא:</b></td>
                <td><input type="password" name="password1" maxlength="12"/></td>
                <td><input type="text" class="label" name="mPass1" id="mPass1" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>אימות סיסמא:</b></td>
                <td><input type="password" name="password2" maxlength="12"/></td>
                <td><input type="text" class="label" name="mPass2" id="mPass2" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>טלפון:</b></td>
                <td><input type="text" name="phone" /></td>
                <td><input type="text" class="label" name="mPhone" id="mPhone" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>אימייל:</b></td>
                <td><input type="text" name="email" /></td>
                <td><input type="text" class="label" name="mMail" id="mMail" size="30" disabled="disabled" /></td>
            </tr>
            <tr>
                <td><b>מגדר:</b></td>
                <td><input type="radio" name="gender" value="male" checked="checked" />
                    זכר
                    <input type="radio" name="gender" value="female" />
                    נקבה

                </td>
            </tr>
            <tr>
                <td><b>תחביבים:</b></td>
                <td><input type="checkbox" name="hobbies" value="football"/>כדורגל<br />
                    <input type="checkbox" name="hobbies" value="basketball"/>כדורסל<br />
                    <input type="checkbox" name="hobbies" value="movies"/>סרטים<br />
                    <input type="checkbox" name="hobbies" value="internet"/>אינטרנט<br />
                    <input type="checkbox" name="hobbies" value="shoping"/>קניות<br />
                    <input type="checkbox" name="hobbies" value="extreme"/>ספורט אקסטרים<br />
                    <input type="checkbox" name="hobbies" value="Photography"/>צילום</td>
            </tr>
            <tr>
                <td><b>אזור מגורים:</b></td>
                <td><select name="area">
            <option value="גוש דן">גוש דן</option>
            <option value="ירושלים והסביבה">ירושלים והסביבה</option>
            <option value="השפלה">השפלה</option>
            <option value="השרון">השרון</option>
            <option value="הנגב">הנגב</option>
        </select></td>
            </tr>
            <tr>
                <td><b>הערות:</b></td>
                <td><textarea name="openText" rows="5" cols="20"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="reset" name="נקה" value="נקה" />
                                <input type="submit" id="submit" name="submit" value="שלח" /></td>
            </tr>
        </table>
        </div>
        </form>
        </center>
</asp:Content>