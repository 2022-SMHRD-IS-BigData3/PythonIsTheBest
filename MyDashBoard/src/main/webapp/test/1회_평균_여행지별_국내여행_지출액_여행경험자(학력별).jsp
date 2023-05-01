<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1회_평균_여행지별_국내여행_지출액__여행경험자(학력별)</title>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="chart-test.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
</head>
<style>
	.savebox {
    		margin-left: 630px;
    	}
    	
	#pieChart {
        display: flex;
        justify-content: center;
        height: 700px;
    }
    button {
        width: 100px;
        border: 0;
        outline: none;
        font-size: 15px;
        margin: 1px;
        background: rgb(243, 156, 18);
        color: white;
        padding: 5px;
        cursor: pointer;
        border-radius: 5px;
    }

    button:hover {
        background-color: cornsilk;
        /* 원하는 배경색으로 변경 */
        color: black;
    }

    h1 {
        text-align: center;
    }
</style>

<body>
<div id="contentDiv">
<form onsubmit="return false" method="post">
    <h1>1회_평균_여행지별_국내여행_지출액__여행경험자(학력별)</h1>
    <div class="chart-container">
        <canvas id="pieChart"></canvas>
    </div>
    <br>
    <div id="regionButtons" style="text-align: center;">
	    <button class="regionClass" data-region="서울" id="seoulBtn">서울</button>
	    <button class="regionClass" data-region="부산" id="busanBtn">부산</button>
	    <button class="regionClass" data-region="대구" id="daeguBtn">대구</button>
	    <button class="regionClass" data-region="인천" id="incheonBtn">인천</button>
	    <button class="regionClass" data-region="광주" id="gwangjuBtn">광주</button>
	    <button class="regionClass" data-region="대전" id="daejeonBtn">대전</button>
	    <button class="regionClass" data-region="울산" id="ulsanBtn">울산</button>
	    <button class="regionClass" data-region="세종" id="sejongBtn">세종</button>
	    <button class="regionClass" data-region="경기" id="gyeonggiBtn">경기</button>
	    <button class="regionClass" data-region="강원" id="gangwonBtn">강원</button>
	    <button class="regionClass" data-region="충북" id="chongbukBtn">충북</button>
	    <button class="regionClass" data-region="충남" id="chongnamBtn">충남</button>
	    <button class="regionClass" data-region="전북" id="jeonbukBtn">전북</button>
	    <button class="regionClass" data-region="전남" id="jeonnamBtn">전남</button>
	    <button class="regionClass" data-region="경북" id="gyongbukBtn">경북</button>
	    <button class="regionClass" data-region="경남" id="gyongnamBtn">경남</button>
	    <button class="regionClass" data-region="제주" id="jejuBtn">제주</button>
    </div>
    <br>
    <div class="savebox">
    <input type="text" name="saveName"  placeholder="차트 이름을 입력하세요">
    <input type = "hidden" name = "fileName" value ="12">
	<input type = "hidden" name = "chartType" value ="pie">
	<input type="hidden" name="region" value="" id="regionInput">
    <input type="submit" value="저장" id = "save">
    </div>
    </form>
    </div>
    
    
    <!-- 지역 버튼 눌렀을 때 버튼에 따라 지역값 넣는 함수 -->
	<script type="text/javascript" src="region.js"></script>
    
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        // 표 데이터
        const data = {
            labels: ["초졸 이하", "중학교", "고등학교", "대학교이상"],
            datasets: [{
                label: '평균 지출액',
                data: [],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.75)',
                    'rgba(54, 162, 235, 0.75)',
                    'rgba(255, 206, 86, 0.75)',
                    'rgba(75, 192, 192, 0.75)',
                    'rgba(153, 102, 255, 0.75)',
                    'rgba(255, 159, 64, 0.75)',
                    'rgba(94, 232, 129, 0.75)'
                ],
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 0
            }]
        };

        // 차트 생성 함수
        function createPieChart(data) {
            return new Chart(document.getElementById('pieChart').getContext('2d'), {
                type: 'pie',
                data: data,
                plugins: [ChartDataLabels],
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: 'right',
                        labels: {
                            boxWidth: 12
                        }
                    },
                    plugins: {
                        datalabels: {
                            formatter: (value, context) => {
                                return context.chart.data.labels[context.dataIndex]
                            }
                        }
                    }
                }
            });
        }

        // 초기에 도넛 차트 생성
        const chart = createPieChart(data);

        // 지역 버튼 클릭 이벤트 핸들러
        $('#regionButtons button').on('click', function () {
            const region = $(this).data('region'); // 클릭한 버튼의 data-region 속성값을 가져옴

            // region에 따라 데이터를 업데이트하고 차트를 그림
            switch (region) {
                case '서울':
                    data.datasets[0].data = [64, 73, 61, 89];
                    break;
                case '부산':
                    data.datasets[0].data = [77, 66, 112, 154];
                    break;
                case '제주':
                    data.datasets[0].data = [425, 305, 443, 502];
                    break;
                case '대구':
                    data.datasets[0].data = [47, 70, 87, 101];
                    break;
                case '인천':
                    data.datasets[0].data = [65, 57, 62, 76];
                    break;
                case '광주':
                    data.datasets[0].data = [68, 72, 93, 94];
                    break;
                case '대전':
                    data.datasets[0].data = [66, 59, 78, 87];
                    break;
                case '울산':
                    data.datasets[0].data = [47, 51, 73, 74];
                    break;
                case '세종':
                    data.datasets[0].data = [0, 40, 54, 59];
                    break;
                case '경기':
                    data.datasets[0].data = [37, 43, 49, 63];
                    break;
                case '강원':
                    data.datasets[0].data = [87, 97, 125, 141];
                    break;
                case '충북':
                    data.datasets[0].data = [52, 70, 89, 90];
                    break;
                case '충남':
                    data.datasets[0].data = [58, 75, 81, 98];
                    break;
                case '전북':
                    data.datasets[0].data = [55, 78, 80, 100];
                    break;
                case '전남':
                    data.datasets[0].data = [62, 75, 97, 104];
                    break;
                case '경북':
                    data.datasets[0].data = [52, 58, 88, 93];
                    break;
                case '경남':
                    data.datasets[0].data = [48, 62, 79, 93];
                    break;
                default:
                    // 기본값은 임의의 데이터로 설정
                    data.datasets[0].data = [Math.random() * 100, Math.random() * 100, Math.random() * 100, Math.random() * 100, Math.random() * 100, Math.random() * 100, Math.random() * 100];
                    break;
            }

            chart.update(); // 차트 업데이트
        });
$('#save').on('click',function(){
        	
        	$.ajax({
        		url : '/MyDashBoard/Mycheck.do',
        		data : $('form').serialize(),
        		success:function(){
        			console.log($('#contentDiv'));
        			$('#contentDiv')[0].innerHTML = '<h1>저장되었습니다.</h1>';
        		}
        	})
        })
        })
    </script>
</body>

</html>