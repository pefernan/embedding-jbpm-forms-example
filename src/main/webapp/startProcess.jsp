<script type="text/javascript">
    if (!window.jbpmRestAPI) window.jbpmRestAPI = new jbpmRestAPI();

    var hostURL = "http://localhost:8080/kie-wb/";

    var processes = [];

    var hiring = {
        deployment: "org.jbpm:HR:1.0",
        processId: "hiring"
    };

    processes.push("human-resources", hiring);

    function onsuccessShowForm(response) {
        document.getElementById("startProcessDiv").style.display = "block";
        document.getElementById("startProcessAction").style.display = "block";
    }

    function onerrorShowForm(response) {
        alert("Something wrong happened: " + response);
        document.getElementById("startProcessDiv").style.display = "none";
        document.getElementById("startProcessAction").style.display = "none";
        window.jbpmRestAPI.clearContainer("startProcessDiv")
    }

    function showStartProcessForm() {
        var process = document.getElementById("process").value;
        if (process) {
            var processInfo = processes[process];
            if (processInfo) {
                jbpmRestAPI.showStartProcessForm(hostURL. processInfo.deploymentId, processInfo.processId, "startProcessDiv", onsuccessShowForm, onerrorShowForm)
            }
        }
    }
</script>
<div>
    <select name="process" id="process">
        <option value="human-resources" selected>Human Resources</option>
    </select>
    <input type="button" value="Start Process" onclick="showStartProcessForm()">
    <div id="startProcessDiv" style="display: none;"></div>
    <div id="startProcessAction" style="display: none;">
        <input type="button" value="Start Process!" onclick="startProcess()">
    </div>
</div>