<%--
  Created by IntelliJ IDEA.
  User: gil
  Date: 2020-04-17
  Time: 오후 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pie Chart with Custom Tooltips</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/admin/bootstrap3/css/bootstrap.css">
    <script async="" src="//www.google-analytics.com/analytics.js"></script><script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
    <script src="https://www.chartjs.org/samples/latest/utils.js"></script>

    <style>
        #canvas-holder {
            width: 100%;
            margin-top: 50px;
            text-align: center;
        }
        #chartjs-tooltip {
            opacity: 1;
            position: absolute;
            background: rgba(0, 0, 0, .7);
            color: white;
            border-radius: 3px;
            -webkit-transition: all .1s ease;
            transition: all .1s ease;
            pointer-events: none;
            -webkit-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
        }

        .chartjs-tooltip-key {
            display: inline-block;
            width: 10px;
            height: 10px;
            margin-right: 10px;
        }
    </style>
    <style>
        .grid-container {/*그리드 구간이 필요할때마다 컬럼과 로우를 추가한다(tr,td하듯이)*/
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr;
        }
        /*쓰려는 용도에 맞추어 css를 적용*/
        .grid-top {
            padding: 40px;
            text-align: center;
            background-color: chartreuse;
            grid-column: 1/11;
        }
        .grid-side {
            padding: 5px;
            text-align: left;
            border: 1px solid black;
            background-color: lawngreen;
            grid-column: 1/3;
            grid-row: 2/6;
        }
        .grid-item {
            padding: 40px;
            text-align: center;
            border: 1px solid black;
            background-color: lightgreen;
            grid-column:3 / 11;
        }
        .jumbotron{
            background-color: green;
            margin-bottom: 0px;
            background-image: url('../images/955519.png');
            height: 25em
        }
        .inlineBlock{
            display: inline-block;
        }
    </style>
    <style type="text/css">/* Chart.js */
    @keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}</style></head>
<body>
    <div data-gr-c-s-loaded="true">
    <div class="grid-container">
        <div class="grid-top jumbotron" >
        </div>
        <div class="grid-side">
            <label style="color: white"><h1>관리메뉴</h1></label>
            <ul>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/admin/registered_book_list?page_num=1" style="color: white">상품 현황</a></label></li></h3>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/board/list?board_category=공지&page_num=1" style="color: white">공지사항관리</a></label></li></h3>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/board/list?board_category=문의&page_num=1" style="color: white">문의사항관리</a></label></li></h3>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/graph/saleGraph" style="color: white">판매현황보기</a></label></li></h3>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/admin/register_book" style="color: white">상품등록하기</a></label></li></h3>
                <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/member/logout" style="color: white">로그아웃</a></label></li></h3>
            </ul>
        </div>
        <div class="grid-item" style="text-align: right">접속자 :
            ${sessionScope.member.id}
            <div id="canvas-holder" style="width: 100%;">
                <div class="chartjs-size-monitor">
                    <div class="chartjs-size-monitor-expand">
                        <div class=""></div>
                    </div>
                    <div class="chartjs-size-monitor-shrink"><div class=""></div>
                    </div>
                </div>
                <div>
                    <div class="inlineBlock" style="width: 35%;">
                        <h1><label>판매부수 현황</label></h1><br/><br>
                        <canvas id="chart-area" width="375" height="375" style="display: block; height: 300px; width: 300px;" class="chartjs-render-monitor"></canvas>
                    </div>
                    <div class="inlineBlock" style="width: 35%;">
                        <h1><label>현재 상황 브리핑</label></h1>
                        <h3>What is Lorem Ipsum?</h3>
                    </div>
                </div>
                <div id="chartjs-tooltip" class="center" style="opacity: 0; left: 300px; top: 300px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-style: normal; padding: 6px;">
                    <table><thead></thead><tbody><tr><td><span class="chartjs-tooltip-key" style="background:rgb(255, 205, 86); border-color:#fff; border-width: 2px"></span>Yellow: 100</td></tr></tbody></table>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    Chart.defaults.global.tooltips.custom = function(tooltip) {
        // Tooltip Element
        var tooltipEl = document.getElementById('chartjs-tooltip');

        // Hide if no tooltip
        if (tooltip.opacity === 0) {
            tooltipEl.style.opacity = 0;
            return;
        }

        // Set caret Position
        tooltipEl.classList.remove('above', 'below', 'no-transform');
        if (tooltip.yAlign) {
            tooltipEl.classList.add(tooltip.yAlign);
        } else {
            tooltipEl.classList.add('no-transform');
        }

        function getBody(bodyItem) {
            return bodyItem.lines;
        }

        // Set Text
        if (tooltip.body) {
            var titleLines = tooltip.title || [];
            var bodyLines = tooltip.body.map(getBody);

            var innerHtml = '<thead>';

            titleLines.forEach(function(title) {
                innerHtml += '<tr><th>' + title + '</th></tr>';
            });
            innerHtml += '</thead><tbody>';

            bodyLines.forEach(function(body, i) {
                var colors = tooltip.labelColors[i];
                var style = 'background:' + colors.backgroundColor;
                style += '; border-color:' + colors.borderColor;
                style += '; border-width: 2px';
                var span = '<span class="chartjs-tooltip-key" style="' + style + '"></span>';
                innerHtml += '<tr><td>' + span + body + '</td></tr>';
            });
            innerHtml += '</tbody>';

            var tableRoot = tooltipEl.querySelector('table');
            tableRoot.innerHTML = innerHtml;
        }

        var positionY = this._chart.canvas.offsetTop;
        var positionX = this._chart.canvas.offsetLeft;

        // Display, position, and set styles for font
        tooltipEl.style.opacity = 1;
        tooltipEl.style.left = positionX + tooltip.caretX + 'px';
        tooltipEl.style.top = positionY + tooltip.caretY + 'px';
        tooltipEl.style.fontFamily = tooltip._bodyFontFamily;
        tooltipEl.style.fontSize = tooltip.bodyFontSize;
        tooltipEl.style.fontStyle = tooltip._bodyFontStyle;
        tooltipEl.style.padding = tooltip.yPadding + 'px ' + tooltip.xPadding + 'px';
    };

    var config = {
        type: 'pie',
        data: {
            datasets: [{
                data: [
                    <c:forEach items="${graphDataList}" var="data" varStatus="i" begin="0" end="2">
                    <c:choose>
                    <c:when test="${i.index<2}">
                    ${data.con},
                    </c:when>
                    <c:otherwise>
                    ${data.con}
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                ],
                backgroundColor: [
                    window.chartColors.red,
                    window.chartColors.orange,
                    window.chartColors.yellow,,
                ],
            }],
            labels: [
                <c:forEach items="${graphDataList}" var="data" varStatus="i" begin="0" end="2">
                <c:choose>
                <c:when test="${i.index<2}">
                ${data.isbn},
                </c:when>
                <c:otherwise>
                ${data.isbn}
                </c:otherwise>
                </c:choose>
                </c:forEach>
            ]
        },
        options: {
            responsive: true,
            legend: {
                display: false
            },
            tooltips: {
                enabled: false,
            }
        }
    };

    window.onload = function() {
        var ctx = document.getElementById('chart-area').getContext('2d');
        window.myPie = new Chart(ctx, config);
    };
</script>
</html>