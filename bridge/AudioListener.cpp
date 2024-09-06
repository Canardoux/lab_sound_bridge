#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
#include "struct.h"
using namespace lab;


DART_EXPORT int createAudioListener(AudioContext* context) {
    auto audioListener = std::make_shared<AudioListener>(/**context*/);
    return keepAudioListener(audioListener);
}

DART_EXPORT void AudioListener_setPosition(int id, float x, float y, float z) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setPosition(x, y, z);
    }
}

DART_EXPORT int AudioListener_positionX(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 1, listener->positionX()) : -1;
}

DART_EXPORT int AudioListener_positionY(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 2, listener->positionY()) : -1;
}

DART_EXPORT int AudioListener_positionZ(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 3, listener->positionZ()) : -1;
}


DART_EXPORT void AudioListener_setOrientation(int id, float x, float y, float z, float upX, float upY, float upZ) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setOrientation(x, y, z, upX, upY, upZ);
    }
}

DART_EXPORT void AudioListener_setForward(int id, float x, float y, float z) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setForward({x, y, z});
    }
}

DART_EXPORT int AudioListener_forwardX(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 4, listener->forwardX()) : -1;
}

DART_EXPORT int AudioListener_forwardY(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 5, listener->forwardY()) : -1;
}

DART_EXPORT int AudioListener_forwardZ(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 6, listener->forwardZ()) : -1;
}


DART_EXPORT void AudioListener_setUpVector(int id, float x, float y, float z) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setUpVector({x, y, z});
    }
}



DART_EXPORT int AudioListener_upX(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 7, listener->upX()) : -1;
}

DART_EXPORT int AudioListener_upY(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 8, listener->upY()) : -1;
}

DART_EXPORT int AudioListener_upZ(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 9, listener->upZ()) : -1;
}

DART_EXPORT void AudioListener_setVelocity(int id, float x, float y, float z) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setVelocity(x, y, z);
    }
}

DART_EXPORT int AudioListener_velocityX(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 10, listener->velocityX()) : -1;
}

DART_EXPORT int AudioListener_velocityY(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 11, listener->velocityY()) : -1;
}

DART_EXPORT int AudioListener_velocityZ(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 12, listener->velocityZ()) : -1;
}



DART_EXPORT void AudioListener_setDopplerFactor(int id, float dopplerFactor) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setDopplerFactor(dopplerFactor);
    }
}

DART_EXPORT int AudioListener_dopplerFactor(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 13, listener->dopplerFactor()) : -1;
}


DART_EXPORT void AudioListener_setSpeedOfSound(int id, float speedOfSound) {
    auto listener = getAudioListener(id);
    if (listener) {
        listener->setSpeedOfSound(speedOfSound);
    }
}

DART_EXPORT int AudioListener_speedOfSound(int id) {
    auto listener = getAudioListener(id);
    return listener ? keepAudioParam(id, 14, listener->speedOfSound()) : -1;
}


DART_EXPORT void AudioListener_release(int id){
    keepAudioListenerRelease(id);
}

DART_EXPORT int AudioListener_has(int id) {
    auto listener = getAudioListener(id);
    return listener ? 1 : 0;
}