import QtQuick 2.0

Item {
    property var buttons: []
    property int preselectionIndex: -1

    Component.onCompleted: {
        if(preselectionIndex == -1)
            console.log("Please define a preselectionIndex in order to use this component properly.")
        if(buttons.length == 0){
            console.log("Please add buttons to the CustomButtonGroup component.")
            return;
        }
        buttons[preselectionIndex > -1 ? preselectionIndex : 0].checked = true;
    }

    Repeater{
        model: buttons
        Item{
            Connections{
                target: buttons[index]
                function onClicked(){
                    for(let i = 0; i < buttons.length; i++){
                        if(buttons[i].checked && i !== index)
                            buttons[i].checked = false;
                    }
                }
            }
        }
    }
}
