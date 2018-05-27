<%@ Page Language="C#"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.tabs > li > a').click(function (event) {
                
                event.preventDefault();//prevents the default action of browser

                var active_tab_selector = $('.tabs > li.active > a').attr('href');
                
                var actived_tab = $('.tabs > li.active');
                actived_tab.removeClass('active');

                $(this).parents('li').addClass('active');

                //hide displaying tab content
                $(active_tab_selector).removeClass('active');
                $(active_tab_selector).addClass('hide');

                //show target tab content
                var target_tab_selector = $(this).attr('href');
                $(target_tab_selector).removeClass('hide');
                $(target_tab_selector).addClass('active');

            });
        });
    </script>
    <style>
        .tab-content.active {
            display: block;
        }

        .tab-content.hide {
            display: none;
        }
    </style>
</head>
<body>
    <div>
        <ul class="tabs">
            <li class="active">
                <a href="#tab1">Tab 1</a>
            </li>
            <li>
                <a href="#tab2">Tab 2</a>
            </li>
            <li>
                <a href="#tab3">Tab 3</a>
            </li>
        </ul>
    </div>
    <section id="tab1" class="tab-content active">
        <div>
            This is tab 1 data
        </div>
    </section>
    <section id="tab2" class="tab-content hide">
        <div>
            Here is tab 2 data
        </div>
    </section>
    <section id="tab3" class="tab-content hide">
        <div>
            Tab 3 contents
        </div>
    </section>
</body>
</html>
