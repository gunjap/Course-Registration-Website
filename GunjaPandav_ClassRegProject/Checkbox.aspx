<%@ Page Language="C#"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $(".checkbox").prop("checked", true);

            var $chk = $("#grpChkBox input:checkbox"); // cache the selector
            var $tbl = $("#EmpData");
            $chk.click(function () {
                var colToHide = $tbl.find("." + $(this).attr("name"));
                $(colToHide).toggle();
            });
        });
    </script>
</head>
<body>
    <div id="grpChkBox">
        <p><input class="checkbox" type="checkbox" name="empid" /> Employee ID</p>
        <p><input class="checkbox" type="checkbox" name="fname" /> First Name</p>
        <table id="EmpData">
            <thead>
                <tr><th class="empid">EmpId</th>
                    <th class="fname">First Name</th></tr>
            </thead>
            <tbody>
                <tr><td class="empid">1</td>
                    <td class="fname">Bill</td></tr>
                <tr><td class="empid">2</td>
                    <td class="fname">Laura</td></tr>
            </tbody>
        </table>
    </div>
</body>
</html>