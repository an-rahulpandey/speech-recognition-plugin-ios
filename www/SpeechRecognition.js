var cordova = require('cordova'),
    exec = require('cordova/exec');

var SpeechRecognition = function() {
        this.options = {};
};

SpeechRecognition.prototype = {
    /*
        Add your plugin methods here
    */
    start: function() {
        cordova.exec( null, null, "SpeechRecognition", "startRecording",[]);
    },
    
    stop: function(){
        cordova.exec(null,null,"SpeechRecognition","stopRecording",[])
    },
    
    showOutput:function(success,fail){
        cordova.exec(success,fail,"SpeechRecognition","showOutput",[]);
    }
};

var SpeechRecognitionInstance = new SpeechRecognition();

module.exports = SpeechRecognitionInstance;
