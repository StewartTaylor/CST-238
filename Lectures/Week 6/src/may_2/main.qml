import QtQuick 2.6
import QtQuick.Controls 1.5
import QtMultimedia 5.6
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Poor Man's Snapchat")

    Camera
    {
        id: cam_selfie
    }

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        VideoOutput
        {
            anchors.fill: parent
            source: cam_selfie
        }

        Image
        {
            id: img_camera
            source: "../../img/camera.png"
            height: 75
            width: 75
            opacity: 1

            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.bottom: big_wrapper.bottom
            anchors.bottomMargin: 60

            MouseArea
            {
                id: ma_mousearea
                anchors.fill: parent

                onPressed:
                {
                    img_camera.opacity = 0.2
                }

                onReleased:
                {
                    img_camera.opacity = 1
                }

                onClicked:
                {
                    se_shutter_camera.play()
                }
            }
        }

        Audio
        {
            id: iPod_shameless
            source:  "../../music/Shameless.mp3"
            autoPlay: true
        }

        Audio
        {
            id: se_shutter_camera
            source: "../../sound_effects/shutter_camera.mp3"
        }
    }
}
