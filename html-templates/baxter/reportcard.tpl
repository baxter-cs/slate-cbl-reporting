<!DOCTYPE html>
<html>
    <head>
        {cssmin "reports/legacy.css" embed=true}
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://unpkg.com/vue"></script>
        <style>

        .main-grid{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(5, minmax(1fr, 2fr));
        }

        .content-area{
            justify-content: space-between;
            border: 1px solid black;
            border-radius: 2em;
            padding: 1em;
            margin: 0.5em;
        }

        .content-area-title{
            margin: 0.5em;
            font-size: 20pt;
        }

        .competencies{
            display: grid;
            flex-direction: column;
        }
        .competency-title{
            display: flex;
            justify-content: space-around;
            align-items: center;
            text-align: center;
            background-color: #DDD;
            font-size: 10pt;

        }

        .competency{
            margin: 2px;
            padding: 2px;
            display: flex;
            flex: 1;
            flex-direction: row;
            background-color: #CCC;

        }


        .competency * {
            flex: 1;
        }
        .level{
            display: flex;
            flex-wrap: wrap;
            border: 2px dotted rgba(0,0,0,0.2);
            margin: 1px;
            width: 1 fr;
            max-height: 60px;
            flex-direction: column;
            
        }

        .level-title{
            position: absolute;
            top: 5px;
            left: 5px;
            font-size:10;
            
            border-radius: 50%;
            background-color: #FFF;
        }

        .indicator{
            background-color: #eee;
            margin: 2px;
            font-size: 6pt;
            border-radius: 5%;
            display: flex;
            min-width: 2em;
            min-height: 2em;
            justify-content: space-around;
            align-items: center;
            text-align: center;
            font-weight: bold;
        }

        .indicator:hover{
            transform: scaleX(2) scaleY(2);
            transition: all 0.2s;
        }

        


</style>
    
    </head>
    <body>
      <div class="infoHeader" id="p1info">
        <div class="logo"><img src="images/logo.png"/></div>
        <div class="infoFlex">
          <div class="infoLine"><div class="infoLabel">Name</div>
            <div id="studentName" class="info" v-html="student.firstName"></div>
          </div>
          <div class="infoLine"><div class="infoLabel">Address</div>
            <div id="studentAddress" class="info"></div>
          </div>
          <div class="infoLine"><div class="infoLabel">Birthdate</div><div id="studentBirthdate" class="info"></div></div>
          <div class="infoLine"><div class="infoLabel">Graduation</div><div id="graduationDate" class="info"></div></div>
        </div>
      </div>

    
    </div>
    <div id="report-panel" class="main-grid">
        <div class="content-area" v-for="contentArea in contentAreas">
            <div class="content-area-title" v-html="contentArea.title"></div>
            <div class="competencies">
                <div class="competency" v-for="competency in contentArea.competencies">
                    <div class="competency-title" v-html="competency.title"></div>
                    <div class="level" v-for="level in competency.levels">

                        <div class="indicator" v-for="skillLevel in level.skillLevels">
                            <div v-html="standardLevelString(skillLevel.highestLevel)"></div>
                                <div v-html="shortDate(new Date(skillLevel.demonstrated))"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <script src="scripts/reportcard.js"></script>
    <script>
        var currentYearStart = 2017;
        var studentYear = 4;
        var STUDENT_START_YEAR = 1;
        {json_encode($completion)};
        var student = {json_encode($student)};
        var contentAreas = {json_encode($contentAreas)};
        var reportVue = makeStudentReportVue(student, contentAreas);
    </script>

  </body>
</html>
